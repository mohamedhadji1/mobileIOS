import 'dart:math';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image/image.dart' as img;
import 'package:tflite_flutter/tflite_flutter.dart';
import '../utils/error_logger.dart';

/// Extracts a 192-dimensional face embedding using MobileFaceNet TFLite model.
/// Uses ML Kit to detect and crop the face before running inference,
/// ensuring consistent embeddings regardless of head position in frame.
class FaceEmbeddingService {
  static Interpreter? _interpreter;
  static FaceDetector? _cropDetector;
  static const int _inputSize = 112; // MobileFaceNet expects 112x112
  static const double _cropPadding = 0.35; // 35% padding around face box

  /// Initialize the TFLite interpreter
  static Future<void> initialize() async {
    if (_interpreter != null) return;
    _interpreter = await Interpreter.fromAsset('assets/mobilefacenet.tflite');
    _cropDetector = FaceDetector(
      options: FaceDetectorOptions(
        performanceMode: FaceDetectorMode.accurate,
      ),
    );
    debugPrint('MobileFaceNet loaded: input=${_interpreter!.getInputTensors()}, output=${_interpreter!.getOutputTensors()}');
  }

  /// Extract face embedding from a camera image file path.
  /// Returns a 192-dimensional float list (the face "fingerprint").
  static Future<List<double>> extractEmbedding(String imagePath) async {
    await initialize();

    // Load the image
    final bytes = await XFile(imagePath).readAsBytes();
    img.Image? image = img.decodeImage(bytes);
    if (image == null) throw Exception('Cannot decode image');

    // Detect face and crop to face region for consistent embeddings
    image = await _cropFaceRegion(image, imagePath);

    // Resize to 112x112
    final resized = img.copyResize(image, width: _inputSize, height: _inputSize);

    // Convert to float32 normalized input [1, 112, 112, 3]
    final input = _imageToFloat32List(resized);

    // Run inference
    final output = List.filled(192, 0.0).reshape([1, 192]);
    _interpreter!.run(input, output);

    // Normalize the embedding (L2 normalization)
    final embedding = (output[0] as List).cast<double>();
    final norm = sqrt(embedding.fold<double>(0.0, (sum, v) => sum + v * v));
    if (norm > 0) {
      for (int i = 0; i < embedding.length; i++) {
        embedding[i] /= norm;
      }
    }

    debugPrint('Extracted ${embedding.length}-dim face embedding');
    return embedding;
  }

  /// Detect the face in the image and crop to just the face region with padding.
  /// This ensures MobileFaceNet always gets a tightly-framed face regardless
  /// of where the person is positioned in the camera frame.
  static Future<img.Image> _cropFaceRegion(img.Image image, String imagePath) async {
    try {
      // Use ML Kit to detect face bounding box in the captured photo
      final inputImage = InputImage.fromFilePath(imagePath);
      final faces = await _cropDetector!.processImage(inputImage);

      if (faces.isEmpty) {
        debugPrint('No face detected for cropping, using full image');
        return image;
      }

      final face = faces.first;
      final box = face.boundingBox;

      // Add padding around the face (35% on each side)
      final padW = (box.width * _cropPadding).toInt();
      final padH = (box.height * _cropPadding).toInt();

      // Calculate crop rectangle, clamped to image bounds
      final x = (box.left.toInt() - padW).clamp(0, image.width - 1);
      final y = (box.top.toInt() - padH).clamp(0, image.height - 1);
      final w = (box.width.toInt() + padW * 2).clamp(1, image.width - x);
      final h = (box.height.toInt() + padH * 2).clamp(1, image.height - y);

      debugPrint('Face crop: x=$x, y=$y, w=$w, h=$h (image: ${image.width}x${image.height})');

      // Make the crop square (MobileFaceNet expects square input). Cap the
      // square to the smaller image dimension so it never exceeds the bounds —
      // otherwise (image.width - size) goes negative and clamp(0, <0) throws.
      final size = min(max(w, h), min(image.width, image.height));
      final cx = x + w ~/ 2;
      final cy = y + h ~/ 2;
      final sx = (cx - size ~/ 2).clamp(0, image.width - size);
      final sy = (cy - size ~/ 2).clamp(0, image.height - size);
      final finalSize = min(size, min(image.width - sx, image.height - sy));
      
      if (finalSize <= 0) {
        debugPrint('Calculated finalSize is <= 0, returning original image');
        return image;
      }

      return img.copyCrop(image, x: sx, y: sy, width: finalSize, height: finalSize);
    } catch (e, stack) {
      ErrorLogger.log('Face Embedding Service - Bounding Box Crop', e, stack);
      return image;
    }
  }

  /// Converts an img.Image to normalized float32 input for MobileFaceNet.
  /// Input range: [-1, 1] (standard for MobileFaceNet)
  static List _imageToFloat32List(img.Image image) {
    final input = Float32List(1 * _inputSize * _inputSize * 3);
    int idx = 0;
    for (int y = 0; y < _inputSize; y++) {
      for (int x = 0; x < _inputSize; x++) {
        final pixel = image.getPixel(x, y);
        input[idx++] = (pixel.r.toDouble() - 127.5) / 128.0;
        input[idx++] = (pixel.g.toDouble() - 127.5) / 128.0;
        input[idx++] = (pixel.b.toDouble() - 127.5) / 128.0;
      }
    }
    return input.reshape([1, _inputSize, _inputSize, 3]);
  }

  static void dispose() {
    _interpreter?.close();
    _interpreter = null;
    _cropDetector?.close();
    _cropDetector = null;
  }
}
