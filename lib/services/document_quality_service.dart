import 'dart:io';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:image/image.dart' as img;

/// Result of analysing a captured document image (US-013-1).
class DocumentQuality {
  const DocumentQuality({
    required this.width,
    required this.height,
    required this.blurScore,
    required this.brightness,
    required this.sha256Hash,
  });

  /// Original image width in pixels.
  final int width;

  /// Original image height in pixels.
  final int height;

  /// Laplacian variance — higher means sharper, lower means blurrier.
  final double blurScore;

  /// Mean luma across the image, 0–255.
  final double brightness;

  /// SHA-256 of the original file bytes (matches the server-side hash).
  final String sha256Hash;

  // ── Thresholds (tunable) ──
  static const int minWidth = 720; // US-013-1: reject below 720px wide
  static const double minBlurScore = 100.0; // below this = too blurry
  static const double minBrightness = 50.0; // below this = too dark
  static const double maxBrightness = 205.0; // above this = overexposed

  bool get resolutionOk => width >= minWidth;
  bool get sharpnessOk => blurScore >= minBlurScore;
  bool get brightnessOk =>
      brightness >= minBrightness && brightness <= maxBrightness;

  /// Resolution restriction removed — submission is always allowed; quality
  /// metrics remain informational only.
  bool get canSubmit => true;

  /// Whether every quality check passes (drives the green indicator).
  bool get isGood => resolutionOk && sharpnessOk && brightnessOk;

  String get brightnessLabel {
    if (brightness < minBrightness) return 'Too dark';
    if (brightness > maxBrightness) return 'Overexposed';
    return 'Good lighting';
  }

  String get sharpnessLabel => sharpnessOk ? 'In focus' : 'Too blurry';

  String get resolutionLabel =>
      resolutionOk ? '${width}px wide' : 'Too low (${width}px)';

  String get shortHash =>
      sha256Hash.length > 16 ? '${sha256Hash.substring(0, 16)}…' : sha256Hash;
}

/// Computes on-device quality metrics for a captured document image.
///
/// Runs entirely locally using the `image` package — no network call. Used by
/// the document capture screen to warn the worker about blur/lighting and to
/// block submission of images below the minimum resolution (US-013-1).
class DocumentQualityService {
  static Future<DocumentQuality> analyze(String imagePath) async {
    final bytes = await File(imagePath).readAsBytes();
    final hash = sha256.convert(bytes).toString();

    final decoded = img.decodeImage(bytes);
    if (decoded == null) {
      throw Exception('Unable to decode captured image');
    }

    final originalWidth = decoded.width;
    final originalHeight = decoded.height;

    // Downscale for fast CPU analysis while preserving the sharpness signal.
    final analysis =
        decoded.width > 640 ? img.copyResize(decoded, width: 640) : decoded;
    final w = analysis.width;
    final h = analysis.height;

    // Build a luma matrix once and reuse it for both metrics.
    final luma = Float64List(w * h);
    double lumaSum = 0;
    for (int y = 0; y < h; y++) {
      for (int x = 0; x < w; x++) {
        final p = analysis.getPixel(x, y);
        final l = 0.299 * p.r + 0.587 * p.g + 0.114 * p.b;
        luma[y * w + x] = l;
        lumaSum += l;
      }
    }
    final brightness = lumaSum / (w * h);

    // Laplacian variance for sharpness (kernel: centre -4, 4-neighbours +1).
    double lapSum = 0;
    double lapSumSq = 0;
    int count = 0;
    for (int y = 1; y < h - 1; y++) {
      for (int x = 1; x < w - 1; x++) {
        final lap = luma[(y - 1) * w + x] +
            luma[(y + 1) * w + x] +
            luma[y * w + (x - 1)] +
            luma[y * w + (x + 1)] -
            4 * luma[y * w + x];
        lapSum += lap;
        lapSumSq += lap * lap;
        count++;
      }
    }
    final mean = count > 0 ? lapSum / count : 0.0;
    final variance = count > 0 ? (lapSumSq / count) - (mean * mean) : 0.0;

    return DocumentQuality(
      width: originalWidth,
      height: originalHeight,
      blurScore: variance,
      brightness: brightness,
      sha256Hash: hash,
    );
  }
}
