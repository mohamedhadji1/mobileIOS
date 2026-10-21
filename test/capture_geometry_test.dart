import 'dart:ui';

import 'package:cypurge_mobile/utils/capture_geometry.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('frame maps onto the still centre at the still/screen scale', () {
    const screen = Size(400, 800);
    final frame = frameRectFor(screen, kAspectId1);
    // 4:3 still behind a 16:9 preview: preview region is 2250 px wide,
    // cover-fitted to 400×800 at scale 0.2 → 1 screen px = 5 still px.
    final r = frameInStill(
      screen: screen,
      frame: frame,
      stillW: 3000,
      stillH: 4000,
      previewAspect: 9 / 16,
    );
    expect(r.center.dx, closeTo(1500, 1));
    expect(r.center.dy, closeTo(2000, 1));
    expect(r.width, closeTo(frame.width * 5, 1));
    expect(r.width / r.height, closeTo(kAspectId1, 0.01));
  });

  test('frame never leaves the still', () {
    const screen = Size(400, 800);
    final r = frameInStill(
      screen: screen,
      frame: frameRectFor(screen, kAspectA4),
      stillW: 600,
      stillH: 800,
      previewAspect: 3 / 4,
    );
    expect(r.left, greaterThanOrEqualTo(0));
    expect(r.top, greaterThanOrEqualTo(0));
    expect(r.right, lessThanOrEqualTo(600));
    expect(r.bottom, lessThanOrEqualTo(800));
  });

  test('portrait A4 frame is capped so header and shutter stay visible', () {
    final r = frameRectFor(const Size(400, 800), kAspectA4);
    expect(r.height, lessThanOrEqualTo(800 * 0.58 + 0.01));
    expect(r.width / r.height, closeTo(kAspectA4, 0.01));
  });

  test('document type picks its real-world aspect', () {
    expect(docAspectFor('PASSPORT'), kAspectId3);
    expect(docAspectFor('VISA'), kAspectId3);
    expect(docAspectFor('NATIONAL_ID'), kAspectId1);
    expect(docAspectFor('Driving License (Back)'), kAspectId1);
    expect(docAspectFor('WORK_PERMIT'), kAspectId1);
    expect(docAspectFor('QUALIFICATION_CERT'), kAspectA4);
  });
}
