// ignore_for_file: prefer_single_quotes
// Messages use double quotes so apostrophes ("couldn't", "don't") stay unescaped.
import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:grpc/grpc.dart';

/// Turns any thrown error into a short, friendly sentence safe to show a worker.
/// Never leaks gRPC codes, stack traces, socket errnos, or "Exception:" noise.
///
/// [action] is an optional lower-case verb phrase for the fallback, e.g.
/// `humanizeError(e, action: 'submit your documents')`.
String humanizeError(Object? error, {String? action}) {
  final fallback = action != null
      ? "We couldn't $action. Please try again."
      : "Something went wrong. Please try again.";

  if (error is GrpcError) return _grpc(error, fallback);
  if (error is TimeoutException) {
    return "This is taking longer than expected. Check your connection and try again.";
  }
  if (error is SocketException) {
    return "You appear to be offline. Check your internet connection and try again.";
  }
  if (error is HttpException || error is HandshakeException) {
    return "We couldn't reach the server. Check your connection and try again.";
  }
  if (error is PlatformException) {
    // Camera/permission platform failures — keep it generic, never show the code.
    final m = (error.message ?? '').toLowerCase();
    if (m.contains('permission') || m.contains('denied')) {
      return "Permission is required to continue. Enable it in your device settings and try again.";
    }
    if (m.contains('camera')) {
      return "The camera isn't available right now. Close other apps using it and try again.";
    }
    return fallback;
  }

  return _fromString(error?.toString() ?? '', fallback);
}

String _grpc(GrpcError e, String fallback) {
  switch (e.code) {
    case StatusCode.unavailable:
      return "You appear to be offline, or the service is temporarily unavailable. Try again shortly.";
    case StatusCode.deadlineExceeded:
      return "The request timed out. Check your connection and try again.";
    case StatusCode.unauthenticated:
      return "Your session has expired. Please sign in again.";
    case StatusCode.permissionDenied:
      return "You don't have permission to do that.";
    case StatusCode.notFound:
      return "We couldn't find what you were looking for.";
    case StatusCode.alreadyExists:
      return _clean(e.message) ?? "That already exists.";
    case StatusCode.resourceExhausted:
      return "You've made too many attempts. Please wait a moment and try again.";
    case StatusCode.invalidArgument:
    case StatusCode.failedPrecondition:
    case StatusCode.outOfRange:
      // Business-rule messages from the backend are written for the worker —
      // show them when they read as human, otherwise fall back.
      return _clean(e.message) ?? "Please check your details and try again.";
    case StatusCode.cancelled:
      return "The request was cancelled. Please try again.";
    default:
      return _clean(e.message) ?? fallback;
  }
}

/// A raw error string (often `Exception: <inner>`). Show it only if it reads as
/// a human sentence; anything technical collapses to the fallback.
String _fromString(String raw, String fallback) {
  return _clean(raw) ?? fallback;
}

/// Strips wrapper noise and returns the message only if it looks human-readable.
/// Returns null when the text is technical (so the caller uses a friendly fallback).
String? _clean(String? input) {
  if (input == null) return null;
  var s = input.trim();
  // Peel nested "Exception:" / "Error:" prefixes.
  final prefix = RegExp(r'^(Exception|Error|GrpcError|StateError)\s*:?\s*',
      caseSensitive: false);
  while (prefix.hasMatch(s)) {
    s = s.replaceFirst(prefix, '').trim();
  }
  if (s.isEmpty) return null;

  final low = s.toLowerCase();
  const technical = [
    'grpc', 'statuscode', 'socketexception', 'errno', 'os error',
    'handshake', 'null check', "type '", 'stacktrace', 'trailers',
    'rawresponse', '#0', 'connection refused', 'connection reset',
    'failed host lookup', 'xmlhttprequest', 'clientexception', 'code=',
    'code:', 'unimplemented', 'internal error', '<asynchronous',
  ];
  for (final t in technical) {
    if (low.contains(t)) return null;
  }
  // Overly long strings are almost always a dumped stack/detail — reject.
  if (s.length > 160) return null;
  return s;
}
