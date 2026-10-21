import 'package:flutter/services.dart';

/// Front camera for the liveness walk, run natively (LivenessCamera.kt on
/// Android, LivenessCamera in AppDelegate.swift on iOS).
///
/// Capture, rotation and JPEG encoding all happen on the platform side; only
/// finished upright JPEGs cross into Dart, in capture order. The camera
/// plugin's image stream copied every raw frame into Dart instead, which held
/// the walk near 10 fps at 720p no matter how fast the phone was.
class LivenessCamera {
  LivenessCamera._();

  static const _methods = MethodChannel('com.cypurge.app/liveness_camera');
  static const _events = EventChannel('com.cypurge.app/liveness_frames');

  /// Upright, unmirrored JPEG frames. Listen BEFORE [start]: frames produced
  /// while nobody listens are dropped on the native side.
  static Stream<Uint8List> frames() =>
      _events.receiveBroadcastStream().map((frame) => frame as Uint8List);

  /// Opens the front camera near 720p at its fastest frame rate. Returns what
  /// the phone actually gave (width, height, fpsMax, encoders) for the log.
  /// Throws [PlatformException] `permission_denied` or `camera_failed`.
  static Future<Map<String, Object?>> start() async =>
      await _methods.invokeMapMethod<String, Object?>('start') ?? const {};

  /// Stops the camera and returns the session's native stats: dropped frames,
  /// average encode ms, encoder threads, mean luma. Never throws.
  static Future<Map<String, Object?>> stop() => _methods
      .invokeMapMethod<String, Object?>('stop')
      .then((stats) => stats ?? const <String, Object?>{})
      .catchError((Object _) => const <String, Object?>{});
}
