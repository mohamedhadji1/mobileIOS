import 'dart:math' as math;
import 'dart:ui';

/// Real-world proportions (width / height) of the documents the app captures.
///
/// ISO/IEC 7810 ID-1 card 85.60 × 53.98 mm (national ID, driving licence, work
/// permit); ID-3 passport data page 125 × 88 mm (passport, visa sticker);
/// A4 210 × 297 mm held portrait (certificates, education licences).
const double kAspectId1 = 85.60 / 53.98; // 1.586
const double kAspectId3 = 125 / 88; // 1.420
const double kAspectA4 = 210 / 297; // 0.707

/// Aspect for a wire document type (see `_wireDocType` in the capture screen).
double docAspectFor(String wireDocType) {
  switch (wireDocType) {
    case 'PASSPORT':
    case 'VISA':
      return kAspectId3;
    case 'QUALIFICATION_CERT':
    case 'LICENSE':
    case 'DOCUMENT':
      return kAspectA4;
    default: // NATIONAL_ID, Driving License (Back), WORK_PERMIT …
      return kAspectId1;
  }
}

/// The guide frame on screen: full width minus margins at the document's
/// aspect, capped in height so a portrait A4 frame still leaves room for the
/// header and the shutter. The painter and the crop both call this, so what
/// the worker sees in the window is exactly what gets saved.
Rect frameRectFor(
  Size screen,
  double aspect, {
  double margin = 24,
  double maxHeightFraction = 0.58,
}) {
  double w = screen.width - margin * 2;
  double h = w / aspect;
  final maxH = screen.height * maxHeightFraction;
  if (h > maxH) {
    h = maxH;
    w = h * aspect;
  }
  return Rect.fromLTWH((screen.width - w) / 2, (screen.height - h) / 2, w, h);
}

/// `BoxFit.cover` of a [content]-sized picture into a [box]: one scale, centred.
class CoverFit {
  CoverFit(this._content, this._box)
      : scale = math.max(
            _box.width / _content.width, _box.height / _content.height);

  final Size _content;
  final Size _box;
  final double scale;

  double get dx => (_box.width - _content.width * scale) / 2;
  double get dy => (_box.height - _content.height * scale) / 2;

  Offset toContent(Offset p) => Offset((p.dx - dx) / scale, (p.dy - dy) / scale);

  Rect rectToContent(Rect r) => Rect.fromLTWH(
      (r.left - dx) / scale, (r.top - dy) / scale, r.width / scale, r.height / scale);
}

/// Where the on-screen [frame] lands in the still image, in pixels.
///
/// The still (upright, [stillW] × [stillH]) can be a wider aspect than the
/// preview — a 4:3 sensor at max resolution behind a 16:9 preview is the usual
/// case. The preview shows the centre crop of the still at [previewAspect]
/// (portrait width / height), and that crop is cover-fitted to [screen]. Walk
/// the frame back through both steps, then clamp to the still.
Rect frameInStill({
  required Size screen,
  required Rect frame,
  required int stillW,
  required int stillH,
  required double previewAspect,
}) {
  final stillAspect = stillW / stillH;
  final double regionW;
  final double regionH;
  if (stillAspect > previewAspect) {
    regionH = stillH.toDouble();
    regionW = regionH * previewAspect;
  } else {
    regionW = stillW.toDouble();
    regionH = regionW / previewAspect;
  }
  final rx = (stillW - regionW) / 2;
  final ry = (stillH - regionH) / 2;

  final r = CoverFit(Size(regionW, regionH), screen)
      .rectToContent(frame)
      .shift(Offset(rx, ry));

  final left = r.left.clamp(0.0, stillW - 1.0);
  final top = r.top.clamp(0.0, stillH - 1.0);
  final right = r.right.clamp(left + 1, stillW.toDouble());
  final bottom = r.bottom.clamp(top + 1, stillH.toDouble());
  return Rect.fromLTRB(left, top, right, bottom);
}
