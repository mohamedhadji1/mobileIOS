import 'package:cypurge_mobile/screens/face_liveness_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('gestureTip explains the gestures M5 is strict about, only those', () {
    expect(gestureTip('Cover your RIGHT eye'), contains("wink doesn't count"));
    // The wink step says "eye" too — it must not get the "no winks" tip.
    expect(gestureTip('Wink — close your LEFT eye'), contains('Close only'));
    expect(gestureTip('Show 3 fingers BESIDE your face'),
        contains('next to your face'));
    expect(gestureTip('Touch your nose'), isNotNull);
    expect(gestureTip('Turn your head LEFT'), isNull);
    expect(gestureTip('Look straight at the camera'), isNull);
  });
}
