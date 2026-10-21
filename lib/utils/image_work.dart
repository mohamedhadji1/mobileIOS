import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';
import 'dart:ui';

import 'package:image/image.dart' as img;

import 'capture_geometry.dart';

/// Heavy pixel work for the capture screens. Decoding and re-encoding a
/// full-sensor JPEG takes hundreds of ms, which freezes the UI isolate (and
/// every animation on it) if done inline, so each helper runs in a short-lived
/// isolate. Only paths, bytes and plain numbers cross the boundary.

/// Crops the still at [path] to the guide frame and returns the new file's
/// path. Returns [path] unchanged when the still cannot be decoded. Errors are
/// rethrown for the caller to log.
Future<String> cropStillToFrame({
  required String path,
  required Size? box,
  required double docAspect,
  required double previewAspect,
}) =>
    Isolate.run(() => cropStillToFrameSync(
          path: path,
          box: box,
          docAspect: docAspect,
          previewAspect: previewAspect,
        ));

/// Synchronous body of [cropStillToFrame]; exposed for tests.
String cropStillToFrameSync({
  required String path,
  required Size? box,
  required double docAspect,
  required double previewAspect,
}) {
  final decoded = img.decodeImage(File(path).readAsBytesSync());
  if (decoded == null) return path;
  // Upright pixels first: the still carries EXIF orientation while the
  // preview is drawn upright, so the frame maths must run on upright data.
  final upright = img.bakeOrientation(decoded);
  final Rect r;
  if (box == null) {
    // Only a sane centre crop for the (impossible) no-layout case.
    final w = upright.width.toDouble();
    final h = upright.height.toDouble();
    double cw = w * 0.92;
    double ch = cw / docAspect;
    if (ch > h) {
      ch = h * 0.92;
      cw = ch * docAspect;
    }
    r = Rect.fromLTWH((w - cw) / 2, (h - ch) / 2, cw, ch);
  } else {
    r = frameInStill(
      screen: box,
      frame: frameRectFor(box, docAspect),
      stillW: upright.width,
      stillH: upright.height,
      previewAspect: previewAspect,
    );
  }
  final x = r.left.round();
  final y = r.top.round();
  final cropped = img.copyCrop(
    upright,
    x: x,
    y: y,
    width: r.width.round().clamp(1, upright.width - x),
    height: r.height.round().clamp(1, upright.height - y),
  );
  final out = path.replaceFirst(RegExp(r'(\.\w+)?$'), '_crop.jpg');
  File(out).writeAsBytesSync(img.encodeJpg(cropped, quality: 92));
  return out;
}

/// Downscales a selfie still to 720p / q90 (keeps the skin texture M5 needs
/// while staying far below the 2MB payload cap). Falls back to the raw bytes
/// when they cannot be decoded.
Future<Uint8List> downscaleSelfie(Uint8List raw) =>
    Isolate.run(() => downscaleSelfieSync(raw));

/// Synchronous body of [downscaleSelfie]; exposed for tests.
Uint8List downscaleSelfieSync(Uint8List raw) {
  final decoded = img.decodeImage(raw);
  if (decoded == null) return raw;
  return Uint8List.fromList(img.encodeJpg(
    decoded.height > 720 ? img.copyResize(decoded, height: 720) : decoded,
    quality: 90,
  ));
}
