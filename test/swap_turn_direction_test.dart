import 'package:flutter_test/flutter_test.dart';
import 'package:cypurge_mobile/screens/face_liveness_screen.dart';

/// Pins the head-turn prompt relabelling.
///
/// The worker watches a mirrored front-camera preview, so M5's camera-relative
/// "turn your head LEFT" reads backwards to them. These tests guard the two
/// things that are easy to break: the single-pass swap (two sequential
/// replaceAll calls would cancel out and silently do nothing), and the scoping
/// that leaves non-turn steps such as the eye-cover prompt untouched.
void main() {
  group('swapTurnDirection', () {
    test('swaps LEFT to RIGHT in an M5 head-turn sentence', () {
      expect(swapTurnDirection('Turn your head LEFT'), 'Turn your head RIGHT');
    });

    test('swaps RIGHT to LEFT in an M5 head-turn sentence', () {
      expect(swapTurnDirection('Turn your head RIGHT'), 'Turn your head LEFT');
    });

    test('swaps both directions in one pass without cancelling out', () {
      // The regression this guards: replaceAll('left','right') followed by
      // replaceAll('right','left') collapses every direction to "left".
      expect(
        swapTurnDirection('Turn left, then turn right'),
        'Turn right, then turn left',
      );
    });

    test('preserves the original casing of the direction word', () {
      expect(swapTurnDirection('Turn head Left'), 'Turn head Right');
      expect(swapTurnDirection('turn head left'), 'turn head right');
      expect(swapTurnDirection('TURN HEAD LEFT'), 'TURN HEAD RIGHT');
    });

    test('leaves non-turn steps alone', () {
      // Eye/hand steps are not mirrored by this relabelling.
      expect(swapTurnDirection('Cover your RIGHT eye'), 'Cover your RIGHT eye');
      expect(swapTurnDirection('Touch your nose'), 'Touch your nose');
      expect(swapTurnDirection('Look up'), 'Look up');
    });

    test('leaves a turn prompt with no direction word unchanged', () {
      expect(swapTurnDirection('Turn slowly'), 'Turn slowly');
    });

    test('does not swap direction words embedded in longer words', () {
      // \b guards this: "rightful" must survive intact.
      expect(swapTurnDirection('Turn to the rightful owner'),
          'Turn to the rightful owner');
    });
  });
}
