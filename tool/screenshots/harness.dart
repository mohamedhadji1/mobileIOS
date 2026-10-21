// Rendering plumbing for the screenshot harness: real fonts, a network guard,
// error collection and PNG capture. See README.md in this folder.
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

/// Where PNGs land. `flutter test` runs with the project root as cwd.
final Directory outputDir = Directory('build/screenshots');

/// Wraps the whole MaterialApp, so a capture includes app bar, nav and any
/// dialog or snackbar in the Navigator's overlay.
const captureBoundaryKey = ValueKey<String>('screenshot-boundary');

/// Fallback when neither FLUTTER_ROOT nor the tester binary's path finds it.
const _defaultMaterialFonts =
    r'C:\flutterSDK\flutter\bin\cache\artifacts\material_fonts';

/// What an Android phone draws text in when its style names no family.
const _platformDefaultFamily = 'Roboto';

// ── Fonts ───────────────────────────────────────────────────────────────────

/// Replaces the test font (every glyph a box) with the real faces: Roboto and
/// MaterialIcons from the SDK, plus every family declared in pubspec.yaml.
/// Read from disk, so it does not depend on the test asset bundle.
Future<void> loadRealFonts() async {
  final material = _materialFontsDir();
  final roboto = _read(material
      .listSync()
      .whereType<File>()
      .where((f) => _basename(f.path).startsWith('roboto-')));
  await _loadFamily(_platformDefaultFamily, roboto);
  await _loadFamily('MaterialIcons',
      _read([File('${material.path}/materialicons-regular.otf')]));

  final declared = pubspecFonts(File('pubspec.yaml').readAsStringSync());
  for (final MapEntry(key: family, value: assets) in declared.entries) {
    await _loadFamily(family, _read([for (final asset in assets) File(asset)]));
  }
}

List<Uint8List> _read(Iterable<File> files) => [
      for (final file in files)
        if (file.existsSync())
          file.readAsBytesSync()
        else
          throw StateError('Font file not found: ${file.path}'),
    ];

Future<void> _loadFamily(String family, List<Uint8List> fonts) async {
  if (fonts.isEmpty) throw StateError('No font files found for "$family"');
  final loader = FontLoader(family);
  for (final font in fonts) {
    loader.addFont(Future.value(ByteData.sublistView(font)));
  }
  await loader.load();
}

/// Text whose style names no family at all — a bare RichText, a nav-rail
/// label — asks the engine for family "". A phone answers with its system
/// face (Roboto on Android), but under `flutter test` the box font claims ""
/// and nothing a test can load outranks it: FontLoader cannot register "",
/// and DirectWrite refuses a font whose own family name is blank. So, just
/// before capture, each such paragraph inherits Roboto from a wrapper span.
/// Spans that name a family keep it. Paragraphs with inline widgets are left
/// alone, since their placeholder children must line up.
void _usePlatformDefaultFont(WidgetTester tester) {
  for (final element in find.byType(RichText, skipOffstage: false).evaluate()) {
    final paragraph = element.renderObject;
    if (paragraph is! RenderParagraph) continue;
    final text = paragraph.text;
    if (text.style?.fontFamily != null || _hasPlaceholder(text)) continue;
    paragraph.text = TextSpan(
      style: const TextStyle(fontFamily: _platformDefaultFamily),
      children: [text],
    );
  }
  // Lay out and paint without a frame: a frame could rebuild an animating
  // RichText and put its original span back.
  tester.binding.rootPipelineOwner
    ..flushLayout()
    ..flushCompositingBits()
    ..flushPaint();
}

bool _hasPlaceholder(InlineSpan span) {
  var found = false;
  span.visitChildren((child) {
    found = child is PlaceholderSpan;
    return !found;
  });
  return found;
}

/// `family -> [asset paths]` from pubspec.yaml's `fonts:` section. A line scan
/// rather than a YAML parser, since `yaml` is not a declared dependency.
Map<String, List<String>> pubspecFonts(String pubspec) {
  final fonts = <String, List<String>>{};
  final family = RegExp(r'^-?\s*family:\s*(.+)$');
  final asset = RegExp(r'^-?\s*asset:\s*(.+)$');
  String? current;
  for (final raw in pubspec.split('\n')) {
    final line = raw.split(' #').first.trim();
    final f = family.firstMatch(line);
    if (f != null) {
      current = _unquote(f[1]!);
      fonts[current] = [];
      continue;
    }
    final a = asset.firstMatch(line);
    if (a != null && current != null) fonts[current]!.add(_unquote(a[1]!));
  }
  return fonts;
}

String _unquote(String s) {
  final t = s.trim();
  final quoted = t.length >= 2 &&
      ((t.startsWith('"') && t.endsWith('"')) ||
          (t.startsWith("'") && t.endsWith("'")));
  return quoted ? t.substring(1, t.length - 1) : t;
}

String _basename(String path) => path.split(RegExp(r'[\\/]')).last;

/// SDK's material_fonts: FLUTTER_ROOT if set, else found from the
/// flutter_tester binary (<sdk>/bin/cache/artifacts/engine/<platform>/).
Directory _materialFontsDir() {
  final candidates = <String>[
    if (Platform.environment['FLUTTER_ROOT'] case final root?)
      '$root/bin/cache/artifacts/material_fonts',
    if (_ancestorNamed(File(Platform.resolvedExecutable).parent, 'cache')
        case final cache?)
      '${cache.path}/artifacts/material_fonts',
    _defaultMaterialFonts,
  ];
  for (final path in candidates) {
    final dir = Directory(path);
    if (dir.existsSync()) return dir;
  }
  throw StateError('material_fonts not found; tried $candidates');
}

Directory? _ancestorNamed(Directory start, String name) {
  var dir = start;
  while (dir.parent.path != dir.path) {
    if (_basename(dir.path) == name) return dir;
    dir = dir.parent;
  }
  return null;
}

// ── Network guard ───────────────────────────────────────────────────────────

/// flutter_test already answers every HttpClient request with a 400, but gRPC
/// dials raw sockets. This refuses those too, so a screenshot run can never
/// reach a real backend with synthetic data.
final class NoNetworkOverrides extends IOOverrides {
  static Future<T> _refuse<T>(Object? host, int port) => Future<T>.error(
      SocketException('Network is disabled in the screenshot harness '
          '($host:$port)'));

  @override
  Future<Socket> socketConnect(host, int port,
          {sourceAddress, int sourcePort = 0, Duration? timeout}) =>
      _refuse(host, port);

  @override
  Future<ConnectionTask<Socket>> socketStartConnect(host, int port,
          {sourceAddress, int sourcePort = 0}) =>
      _refuse(host, port);
}

// ── Pumping, capture, errors ────────────────────────────────────────────────

/// Bounded settle: advances fake time without pumpAndSettle, which never
/// returns while a spinner or pulse repeats forever. 5 x 600ms covers the
/// staggered entrance (<= 240ms delay + 360ms) with room for async loads.
Future<void> settle(WidgetTester tester, {int frames = 5}) async {
  for (var i = 0; i < frames; i++) {
    await tester.pump(const Duration(milliseconds: 600));
  }
}

/// One turn of the real event loop, then image decoding (real async I/O that
/// fake time never completes). The turn also delivers callbacks queued on
/// futures that live outside this test's fake zone — e.g. a singleton's
/// cached load future awaited from a screen.
Future<void> runRealAsyncWork(WidgetTester tester) async {
  final elements = find.byType(Image).evaluate().toList();
  await tester.runAsync(() async {
    await Future<void>.delayed(const Duration(milliseconds: 20));
    await Future.wait([
      for (final element in elements)
        precacheImage((element.widget as Image).image, element),
    ]);
  });
}

/// Rasterises the boundary at the view's device pixel ratio and writes
/// `<outputDir>/<name>.png`.
Future<File> capturePng(WidgetTester tester, String name) async {
  _usePlatformDefaultFont(tester);
  final boundary = tester
      .renderObject<RenderRepaintBoundary>(find.byKey(captureBoundaryKey));
  final file = File('${outputDir.path}/$name.png');
  await tester.runAsync(() async {
    final image =
        await boundary.toImage(pixelRatio: tester.view.devicePixelRatio);
    try {
      final png = await image.toByteData(format: ui.ImageByteFormat.png);
      if (png == null) throw StateError('PNG encoding failed for $name');
      await file.writeAsBytes(png.buffer.asUint8List(), flush: true);
    } finally {
      image.dispose();
    }
  });
  if (!file.existsSync()) throw StateError('No PNG written for $name');
  return file;
}

/// Runs [body] with framework errors (overflow, build exceptions) collected
/// instead of failing the test, and real shadows drawn — flutter_test turns
/// shadows off by default. Both globals are restored before returning, which
/// the test binding checks.
Future<List<String>> collectingErrors(
    WidgetTester tester, Future<void> Function() body) async {
  final problems = <String>[];
  final previousOnError = FlutterError.onError;
  final previousShadows = debugDisableShadows;
  FlutterError.onError =
      (details) => problems.add(_firstLine(details.exceptionAsString()));
  debugDisableShadows = false;
  try {
    await body();
  } finally {
    debugDisableShadows = previousShadows;
    FlutterError.onError = previousOnError;
  }
  final pending = tester.takeException();
  if (pending != null) problems.add(_firstLine('$pending'));
  return problems;
}

String _firstLine(String s) => s.trim().split('\n').first;

/// One line per capture, written to `<outputDir>/report.txt`.
class CaptureReport {
  final _lines = <String>[];

  void ok(String name, List<String> problems) => _lines.add(problems.isEmpty
      ? 'OK      $name.png'
      : 'WARN    $name.png  (${problems.toSet().join(' | ')})');

  void failed(String name, Object error) =>
      _lines.add('FAILED  $name  (${_firstLine('$error')})');

  void write() {
    final text = (_lines..sort()).join('\n');
    File('${outputDir.path}/report.txt').writeAsStringSync('$text\n');
    debugPrint('Screenshot report (${outputDir.path}/report.txt):\n$text');
  }
}
