import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../theme/app_widgets.dart';
import '../theme/platform.dart';
import '../utils/error_humanizer.dart';
import '../utils/pdf_pages.dart';
import '../utils/worker_files.dart';

/// Full-screen preview of one of the worker's own files: a picture opens with
/// pinch-zoom; a PDF (a CV) shows its pages, each opening zoomable on a tap.
class WorkerFileViewerScreen extends StatefulWidget {
  const WorkerFileViewerScreen({
    super.key,
    required this.file,
    required this.fetch,
    this.renderPdf = renderPdfPages,
  });

  final WorkerFile file;
  final WorkerFileFetcher fetch;
  final PdfPageRenderer renderPdf;

  @override
  State<WorkerFileViewerScreen> createState() => _WorkerFileViewerScreenState();
}

class _WorkerFileViewerScreenState extends State<WorkerFileViewerScreen> {
  late Future<WorkerFileBytes> _bytes = widget.fetch(widget.file);

  void _retry() => setState(() => _bytes = widget.fetch(widget.file));

  @override
  Widget build(BuildContext context) {
    return WTPage(
      appBar: AppBar(title: Text(widget.file.typeLabel)),
      content: SafeArea(
        top: false,
        child: FutureBuilder<WorkerFileBytes>(
          future: _bytes,
          builder: (context, snap) {
            if (snap.connectionState != ConnectionState.done) {
              return const Center(child: WTSpinner());
            }
            final data = snap.data;
            if (snap.hasError || data == null) {
              return _Message(
                icon: Icons.cloud_off_rounded,
                title: 'Couldn’t open this file',
                body: humanizeError(snap.error, action: 'open this file'),
                action: WTButton(
                  label: 'Try again',
                  icon: Icons.refresh_rounded,
                  onPressed: _retry,
                ),
              );
            }
            if (data.isPdf) {
              return _PdfPages(
                  pdf: data.bytes,
                  render: widget.renderPdf,
                  title: widget.file.typeLabel);
            }
            return _ZoomableImage(
              bytes: data.bytes,
              semanticLabel: 'Your ${widget.file.typeLabel}, '
                  '${widget.file.statusInfo.label}. Pinch to zoom.',
            );
          },
        ),
      ),
    );
  }
}

/// A PDF's pages, top to bottom like a document. Pinch-zoom lives on each
/// page's own screen: inside a scrolling list it would fight the scroll.
class _PdfPages extends StatefulWidget {
  const _PdfPages(
      {required this.pdf, required this.render, required this.title});

  final Uint8List pdf;
  final PdfPageRenderer render;
  final String title;

  @override
  State<_PdfPages> createState() => _PdfPagesState();
}

class _PdfPagesState extends State<_PdfPages> {
  Future<PdfPreview?>? _preview;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Rendered once, at the screen's own pixel width: sharp, and no larger.
    _preview ??= widget.render(widget.pdf,
        width: (MediaQuery.sizeOf(context).width *
                MediaQuery.devicePixelRatioOf(context))
            .round()
            .clamp(400, 1600));
  }

  void _zoom(PdfPreview preview, int i) {
    final label = 'Page ${i + 1} of ${preview.total}';
    Navigator.of(context).push(platformRoute<void>(
      builder: (_) => WTPage(
        appBar: AppBar(title: Text('${widget.title} · $label')),
        content: SafeArea(
          top: false,
          child: _ZoomableImage(
            bytes: preview.pages[i],
            semanticLabel: '${widget.title}, $label. Pinch to zoom.',
          ),
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PdfPreview?>(
      future: _preview,
      builder: (context, snap) {
        if (snap.connectionState != ConnectionState.done) {
          return const Center(child: WTSpinner());
        }
        if (snap.hasError) {
          return const _Message(
            icon: Icons.broken_image_rounded,
            title: 'This file can’t be shown',
            body: 'It may be damaged or locked with a password. Your file is '
                'safe, and HR can see it.',
          );
        }
        final preview = snap.data;
        if (preview == null || preview.pages.isEmpty) {
          return const _Message(
            icon: Icons.picture_as_pdf_rounded,
            title: 'This file is a PDF',
            body: 'This phone can’t show PDF files in the app yet. Your file '
                'is safe, and HR can see it.',
          );
        }
        final cut = preview.total > preview.pages.length;
        final decodeWidth = (MediaQuery.sizeOf(context).width *
                MediaQuery.devicePixelRatioOf(context))
            .round();
        return ListView.builder(
          padding: const EdgeInsets.all(AppTheme.s4),
          itemCount: preview.pages.length + (cut ? 1 : 0),
          itemBuilder: (context, i) {
            if (i == preview.pages.length) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: AppTheme.s3),
                child: Text(
                  'Showing the first ${preview.pages.length} of '
                  '${preview.total} pages.',
                  textAlign: TextAlign.center,
                  style: AppTheme.caption,
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.only(bottom: AppTheme.s3),
              child: Semantics(
                button: true,
                label: 'Page ${i + 1} of ${preview.total}, double-tap to zoom',
                onTap: () => _zoom(preview, i),
                excludeSemantics: true,
                child: GestureDetector(
                  onTap: () => _zoom(preview, i),
                  child: DecoratedBox(
                    // A page is white paper in both themes.
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: AppTheme.border),
                      boxShadow: AppTheme.cardShadow,
                    ),
                    child: Image.memory(preview.pages[i],
                        cacheWidth: decodeWidth,
                        fit: BoxFit.fitWidth,
                        gaplessPlayback: true),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _ZoomableImage extends StatelessWidget {
  const _ZoomableImage({required this.bytes, required this.semanticLabel});

  final Uint8List bytes;
  final String semanticLabel;

  @override
  Widget build(BuildContext context) {
    // Decode at up to twice the screen's pixel width — sharp enough to zoom
    // into, without holding a full camera frame in memory. `fit` never
    // upscales a smaller file.
    final decodeWidth = (MediaQuery.sizeOf(context).width *
            MediaQuery.devicePixelRatioOf(context) *
            2)
        .round();
    return InteractiveViewer(
      minScale: 1,
      maxScale: 5,
      child: Center(
        child: Image(
          image: ResizeImage(MemoryImage(bytes),
              width: decodeWidth, policy: ResizeImagePolicy.fit),
          fit: BoxFit.contain,
          semanticLabel: semanticLabel,
          errorBuilder: (_, __, ___) => const _Message(
            icon: Icons.broken_image_rounded,
            title: 'This file can’t be shown',
            body: 'It is not a picture the app can read. Your file is safe, '
                'and HR can see it.',
          ),
        ),
      ),
    );
  }
}

class _Message extends StatelessWidget {
  const _Message({
    required this.icon,
    required this.title,
    required this.body,
    this.action,
  });

  final IconData icon;
  final String title;
  final String body;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppTheme.s6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 36, color: AppTheme.faint),
            const SizedBox(height: AppTheme.s4),
            Text(title, textAlign: TextAlign.center, style: AppTheme.h2),
            const SizedBox(height: AppTheme.s2),
            Semantics(
              liveRegion: true,
              child: Text(body,
                  textAlign: TextAlign.center, style: AppTheme.bodyMuted),
            ),
            if (action != null) ...[
              const SizedBox(height: AppTheme.s5),
              action!,
            ],
          ],
        ),
      ),
    );
  }
}
