import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// The pages of a PDF as pictures, drawn by the platform (Android's own
/// PdfRenderer, see PdfPages.kt), so a CV shows without a bundled PDF engine.
@immutable
class PdfPreview {
  const PdfPreview(this.pages, this.total);

  /// PNG bytes, one per page, at most [maxPreviewPages].
  final List<Uint8List> pages;

  /// Pages in the file: more than [pages] when the file is longer than the cap.
  final int total;
}

typedef PdfPageRenderer = Future<PdfPreview?> Function(Uint8List pdf,
    {required int width});

/// A CV runs to a few pages; past this the preview says how many it left out.
const maxPreviewPages = 20;

const _channel = MethodChannel('com.cypurge.app/pdf');

/// Renders [pdf] at [width] pixels per page. Null when the platform has no
/// renderer (iOS today), so the viewer can say it cannot show the file.
/// Throws a [PlatformException] for a damaged or password-protected file.
Future<PdfPreview?> renderPdfPages(Uint8List pdf, {required int width}) async {
  try {
    final res = await _channel.invokeMapMethod<String, Object?>('render', {
      'bytes': pdf,
      'width': width,
      'maxPages': maxPreviewPages,
    });
    if (res == null) return null;
    final pages =
        (res['pages'] as List? ?? const []).whereType<Uint8List>().toList();
    return PdfPreview(
        List.unmodifiable(pages), (res['total'] as int?) ?? pages.length);
  } on MissingPluginException {
    return null;
  }
}
