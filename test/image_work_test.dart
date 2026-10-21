import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:cypurge_mobile/utils/image_work.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;

void main() {
  late Directory dir;

  setUp(() => dir = Directory.systemTemp.createTempSync('image_work_'));
  tearDown(() => dir.deleteSync(recursive: true));

  Uint8List jpeg(int w, int h) =>
      Uint8List.fromList(img.encodeJpg(img.Image(width: w, height: h)));

  test('downscaleSelfie shrinks tall stills to 720px high', () async {
    final out = await downscaleSelfie(jpeg(960, 1280));
    expect(img.decodeImage(out)!.height, 720);
  });

  test('downscaleSelfie keeps the raw bytes when they are not an image',
      () async {
    final raw = Uint8List.fromList(List.filled(64, 7));
    expect(await downscaleSelfie(raw), raw);
  });

  test('cropStillToFrame writes a smaller _crop.jpg off the UI isolate',
      () async {
    final src = File('${dir.path}/still.jpg')..writeAsBytesSync(jpeg(800, 600));
    final out = await cropStillToFrame(
      path: src.path,
      box: const Size(360, 640),
      docAspect: 1.586,
      previewAspect: 0.5625,
    );
    expect(out, endsWith('still_crop.jpg'));
    final cropped = img.decodeImage(File(out).readAsBytesSync())!;
    expect(cropped.width, lessThan(800));
    expect(cropped.height, lessThan(600));
  });

  test('cropStillToFrame returns the path for an undecodable file', () async {
    final src = File('${dir.path}/bad.jpg')
      ..writeAsBytesSync(List.filled(64, 7));
    final out = await cropStillToFrame(
      path: src.path,
      box: null,
      docAspect: 1.5,
      previewAspect: 0.5625,
    );
    expect(out, src.path);
  });
}
