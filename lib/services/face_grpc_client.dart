import 'package:flutter/foundation.dart';
import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart';
import '../generated/face.pbgrpc.dart';

import '../config/constants.dart';
import '../utils/error_logger.dart';

/// gRPC client for communicating with the Go FaceAuth backend.
class FaceGrpcClient {
  static ClientChannel? _channel;
  static FaceAuthClient? _client;

  static const String _serverHost = AppConfig.grpcHost;
  static const int _serverPort = AppConfig.grpcPort;

  /// Connect to Go gRPC server over WiFi
  static void init() {
    _channel = ClientChannel(
      _serverHost,
      port: _serverPort,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );
    _client = FaceAuthClient(_channel!);
    debugPrint('gRPC client initialized → $_serverHost:$_serverPort');
  }

  static FaceAuthClient get client {
    if (_client == null) init();
    return _client!;
  }

  /// Enroll a face embedding on the backend for the given user, 
  /// including selfie frames and gesture metadata.
  static Future<({bool success, String message})> enrollFace(
    String userId, 
    List<double> embedding, {
    List<Uint8List>? frames,
    List<({String step, int timestamp, double confidence})>? metadata,
  }) async {
    try {
      final request = EnrollRequest()
        ..userId = userId
        ..embedding.addAll(embedding.map((e) => e.toDouble()));

      // Add selfie frames
      if (frames != null) {
        request.selfieFrames.addAll(frames);
      }

      // Add gesture metadata
      if (metadata != null) {
        request.metadata.addAll(metadata.map((m) => GestureLog()
          ..step = m.step
          ..timestampMs = Int64(m.timestamp)
          ..confidence = m.confidence));
      }

      final response = await client.enrollFace(request);
      debugPrint('Enroll response: ${response.success} - ${response.message}');
      return (success: response.success, message: response.message);
    } catch (e, stack) {
      ErrorLogger.log('FaceGrpcClient.enrollFace', e, stack);
      return (success: false, message: 'Connection error');
    }
  }

  /// Verify a face embedding against the enrolled one for the given user
  static Future<({bool match, double similarity, String message})> verifyFace(
      String userId, List<double> embedding) async {
    try {
      final request = VerifyRequest()
        ..userId = userId
        ..embedding.addAll(embedding.map((e) => e.toDouble()));
      final response = await client.verifyFace(request);
      debugPrint(
          'Verify response: match=${response.match}, sim=${response.similarity}, msg=${response.message}');
      return (
        match: response.match,
        similarity: response.similarity.toDouble(),
        message: response.message
      );
    } catch (e, stack) {
      ErrorLogger.log('FaceGrpcClient.verifyFace', e, stack);
      return (match: false, similarity: 0.0, message: 'Connection error');
    }
  }

  /// Ping the server to check connectivity
  static Future<bool> ping() async {
    try {
      final response = await client.ping(PingRequest());
      return response.status == 'alive';
    } catch (e, stack) {
      ErrorLogger.log('FaceGrpcClient.ping', e, stack);
      return false;
    }
  }

  static Future<void> shutdown() async {
    await _channel?.shutdown();
    _channel = null;
    _client = null;
  }
}
