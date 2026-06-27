import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:grpc/grpc.dart';

class ErrorLogger {
  /// Centrally log any exception or error caught in the application.
  /// 
  /// Outputs extremely detailed and structured logs to the terminal, 
  /// including specific fields for gRPC, Platform, and Socket errors, 
  /// so that developers do not have to copy and paste truncated outputs.
  static void log(String context, dynamic error, [StackTrace? stackTrace]) {
    final buffer = StringBuffer();
    
    buffer.writeln('\n======================================================================');
    buffer.writeln('🚨 [CYPURGE ERROR] - $context');
    buffer.writeln('======================================================================');
    buffer.writeln('Runtime Type: ${error.runtimeType}');
    
    if (error is GrpcError) {
      buffer.writeln('gRPC Code:      ${error.code}');
      buffer.writeln('gRPC Code Name: ${error.codeName}');
      buffer.writeln('gRPC Message:   ${error.message}');
      buffer.writeln('gRPC Details:   ${error.details}');
      buffer.writeln('gRPC Trailers:  ${error.trailers}');
      buffer.writeln('gRPC Raw Resp:  ${error.rawResponse}');
    } else if (error is PlatformException) {
      buffer.writeln('Platform Code:        ${error.code}');
      buffer.writeln('Platform Message:     ${error.message}');
      buffer.writeln('Platform Details:     ${error.details}');
      buffer.writeln('Platform Stacktrace:  ${error.stacktrace}');
    } else if (error is SocketException) {
      buffer.writeln('Socket OS Error: ${error.osError}');
      buffer.writeln('Socket Address:  ${error.address}');
      buffer.writeln('Socket Port:     ${error.port}');
      buffer.writeln('Socket Message:  ${error.message}');
    } else {
      buffer.writeln('Message: $error');
    }
    
    if (stackTrace != null) {
      buffer.writeln('\n-------------------------- STACK TRACE --------------------------');
      buffer.writeln(stackTrace.toString());
    } else if (error is Error && error.stackTrace != null) {
      buffer.writeln('\n-------------------------- STACK TRACE --------------------------');
      buffer.writeln(error.stackTrace.toString());
    }
    
    buffer.writeln('======================================================================\n');
    
    debugPrint(buffer.toString());
  }
}
