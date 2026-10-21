import 'package:cypurge_mobile/generated/biometric/v1/biometric.pb.dart';
import 'package:cypurge_mobile/screens/face_liveness_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('live but a different face than the document says so, no score', () {
    // The real case: passport of another person, match -0.031.
    final msg = livenessRejectMessage(LivenessResult(
      verdict: 'REJECT',
      livenessPassed: true,
      spoofClassification: 'real',
      matchScore: -0.031,
      matchReason: 'below_threshold',
    ));
    expect(msg, contains('does not match the photo on your identity document'));
    expect(msg, isNot(contains('0.')));
  });

  test('a photo or screen is named as not live', () {
    final msg = livenessRejectMessage(LivenessResult(
        verdict: 'REJECT', livenessPassed: false, spoofClassification: 'spoof_2d'));
    expect(msg, contains('not a photo, a screen or a mask'));
  });

  test('not live without a spoof label asks for better conditions', () {
    final msg = livenessRejectMessage(
        LivenessResult(verdict: 'REJECT', livenessPassed: false));
    expect(msg, contains('good light'));
  });
}
