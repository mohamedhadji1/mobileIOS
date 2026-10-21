import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grpc/grpc.dart';

import 'package:cypurge_mobile/generated/document/v1/document.pb.dart';
import 'package:cypurge_mobile/screens/worker_file_viewer_screen.dart';
import 'package:cypurge_mobile/screens/worker_files_screen.dart';
import 'package:cypurge_mobile/theme/app_theme.dart';
import 'package:cypurge_mobile/theme/app_widgets.dart';
import 'package:cypurge_mobile/utils/file_keys.dart';
import 'package:cypurge_mobile/utils/pdf_pages.dart';
import 'package:cypurge_mobile/utils/worker_files.dart';

/// "Your files": the worker's own documents as the server holds them. All data
/// here is synthetic.
void main() {
  // 1x1 transparent PNG.
  final png = base64Decode(
      'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mNkYAAAAAYAAjCB0C8AAAAASUVORK5CYII=');

  const passport = WorkerFile(
    id: 'doc-0001',
    docType: 'PASSPORT',
    status: 'VERIFIED',
  );
  const expired = WorkerFile(
    id: 'doc-0002',
    docType: 'National ID (Back)',
    status: 'UPLOAD_EXPIRED',
    storedPath: 'tenant-x/worker-y/sample-back.jpg',
  );

  group('documentTypeLabel', () {
    test('maps every wire spelling to the upload screens\' names', () {
      expect(documentTypeLabel('PASSPORT'), 'Passport');
      expect(documentTypeLabel('passport'), 'Passport');
      expect(documentTypeLabel('NATIONAL_ID'), 'National ID (Front)');
      expect(documentTypeLabel('id_front'), 'National ID (Front)');
      expect(documentTypeLabel('National ID (Back)'), 'National ID (Back)');
      expect(documentTypeLabel('DRIVING_LICENSE'), "Driver's License (Front)");
      expect(documentTypeLabel('Driving License (Back)'),
          "Driver's License (Back)");
      expect(documentTypeLabel('WORK_PERMIT'), 'Work Permit');
      expect(documentTypeLabel('QUALIFICATION_CERT'), 'Diploma or certificate');
      expect(documentTypeLabel('LICENSE'), 'Education License');
      expect(documentTypeLabel('CV'), 'CV');
      expect(documentTypeLabel('DOCUMENT'), 'Other Supporting Document');
    });

    test('tidies an unknown type instead of dropping it', () {
      expect(documentTypeLabel('LEASE_AGREEMENT'), 'Lease agreement');
      expect(documentTypeLabel('  '), 'Document');
    });
  });

  group('fileStatusFor', () {
    test('every status has words and an icon, not colour alone', () {
      for (final s in [
        'VERIFIED',
        'NEEDS_REVIEW',
        'AWAITING_CHECK',
        'PENDING_OCR',
        'PROCESSING',
        'REUPLOAD_REQUESTED',
        'UPLOAD_EXPIRED',
        'AWAITING_UPLOAD',
        'REFUSED',
        'REJECTED',
      ]) {
        final info = fileStatusFor(s);
        expect(info.label, isNotEmpty, reason: s);
        expect(info.description, isNotEmpty, reason: s);
      }
      expect(fileStatusFor('VERIFIED').kind, WTTagKind.green);
      expect(fileStatusFor('REJECTED').kind, WTTagKind.red);
    });

    test('an expired upload never reads as deleted', () {
      final info = fileStatusFor('UPLOAD_EXPIRED');
      expect(info.label, 'Not checked');
      expect('${info.label} ${info.description}'.toLowerCase(),
          isNot(anyOf(contains('deleted'), contains('gone'))));
    });

    test('an unknown status is shown in words', () {
      final info = fileStatusFor('ON_HOLD');
      expect(info.label, 'On hold');
      expect(info.kind, WTTagKind.neutral);
    });
  });

  group('WorkerFile.fromProto', () {
    test('reads type, status, expiry and the HR message', () {
      final f = WorkerFile.fromProto(TenantDocument(
        id: 'doc-0003',
        docType: 'CV',
        status: 'REUPLOAD_REQUESTED',
        expiryDate: '2031-01-15',
        reviewMessage: ' Please send a clearer copy. ',
      ));
      expect(f.typeLabel, 'CV');
      expect(f.statusInfo.label, 'Upload again');
      expect(f.expiresOn, DateTime(2031, 1, 15));
      expect(f.reviewMessage, 'Please send a clearer copy.');
      expect(f.uploadedAt, isNull);
      expect(f.storedPath, isEmpty);
    });

    test('reads uploaded_at and the server\'s stored_path', () {
      // Through the wire, as ListWorkerDocuments sends it.
      final wire = TenantDocument(
        id: 'doc-0004',
        docType: 'PASSPORT',
        uploadedAt: '2026-10-03T09:30:00Z',
        storedPath: ' tenant-x/worker-y/passport.jpg ',
      ).writeToBuffer();
      final f = WorkerFile.fromProto(TenantDocument.fromBuffer(wire));
      expect(f.uploadedAt, DateTime.utc(2026, 10, 3, 9, 30).toLocal());
      expect(f.storedPath, 'tenant-x/worker-y/passport.jpg');
    });

    test('an unreadable uploaded_at reads as unknown', () {
      final f = WorkerFile.fromProto(
          TenantDocument(id: 'doc-0006', uploadedAt: 'yesterday'));
      expect(f.uploadedAt, isNull);
    });
  });

  test('row semantics name the type, date, status and the action', () {
    final f = WorkerFile(
      id: 'doc-0005',
      docType: 'PASSPORT',
      status: 'VERIFIED',
      uploadedAt: DateTime(2026, 10, 3),
    );
    String date(DateTime d) => '${d.day} Oct';
    expect(workerFileSemantics(f, date, canOpen: true),
        'Passport, uploaded 3 Oct, Verified, double-tap to open');
    expect(workerFileSemantics(f, date, canOpen: false),
        endsWith('preview not available in the app yet'));
  });

  // Every press of "Upload and continue" on the CV step used to send another
  // copy, so one worker had seven identical "CV · Verified" rows.
  List<WorkerFile> cvCopies(int n) => [
        for (var i = 0; i < n; i++)
          WorkerFile(id: 'cv-$i', docType: 'CV', status: 'VERIFIED'),
      ];

  group('groupWorkerFiles', () {
    test('one group per type, newest copy first, earlier copies kept', () {
      final groups = groupWorkerFiles([
        ...cvCopies(3),
        passport,
        const WorkerFile(id: 'p-old', docType: 'passport', status: 'REFUSED'),
      ]);
      expect(groups.map((g) => g.latest.id), ['cv-0', 'doc-0001']);
      expect(groups[0].earlier.map((f) => f.id), ['cv-1', 'cv-2']);
      // 'PASSPORT' and 'passport' are the same document type.
      expect(groups[1].earlier.map((f) => f.id), ['p-old']);
    });

    test('a single copy has no earlier ones', () {
      final groups = groupWorkerFiles(const [passport, expired]);
      expect(groups, hasLength(2));
      expect(groups.every((g) => g.earlier.isEmpty), isTrue);
    });
  });

  group('WorkerFilesScreen', () {
    Future<void> pump(WidgetTester tester, Widget screen) async {
      tester.view.physicalSize = const Size(390, 1400);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);
      await tester
          .pumpWidget(MaterialApp(theme: AppTheme.theme(), home: screen));
    }

    /// Lets the staggered entrances start and finish.
    Future<void> settle(WidgetTester tester) async {
      await tester.pump(const Duration(milliseconds: 500));
      await tester.pumpAndSettle();
    }

    testWidgets('shows a skeleton while loading', (tester) async {
      final pending = Completer<List<WorkerFile>>();
      await pump(tester, WorkerFilesScreen(loadFiles: () => pending.future));
      await tester.pump();
      expect(find.byType(WTSkeletonList), findsOneWidget);
      pending.complete(const []);
      await settle(tester);
    });

    testWidgets('empty: says so and offers an upload', (tester) async {
      var uploads = 0;
      await pump(
          tester,
          WorkerFilesScreen(
            loadFiles: () async => const [],
            onUpload: () => uploads++,
          ));
      await settle(tester);
      expect(find.text('No files yet'), findsOneWidget);
      await tester.tap(find.text('Upload a document'));
      expect(uploads, 1);
    });

    testWidgets('error: human message, and Retry loads again', (tester) async {
      var calls = 0;
      await pump(tester, WorkerFilesScreen(loadFiles: () async {
        calls++;
        if (calls == 1) throw const GrpcError.unavailable('socket closed');
        return const [passport];
      }));
      await settle(tester);
      expect(find.text('Couldn’t load your files'), findsOneWidget);
      expect(find.textContaining('socket'), findsNothing);
      await tester.tap(find.text('Try again'));
      await settle(tester);
      expect(calls, 2);
      expect(find.text('Passport'), findsOneWidget);
    });

    testWidgets('rows: type, status words, and why preview is unavailable',
        (tester) async {
      final semantics = tester.ensureSemantics();
      await pump(tester,
          WorkerFilesScreen(loadFiles: () async => const [passport, expired]));
      await settle(tester);
      expect(find.text('2 DOCUMENTS ON RECORD'), findsOneWidget);
      expect(find.text('Passport'), findsOneWidget);
      expect(find.text('Verified'), findsOneWidget);
      expect(find.text('National ID (Back)'), findsOneWidget);
      expect(find.text('Not checked'), findsOneWidget);
      // No fetcher in the app yet: every row says so, none is hidden.
      expect(
          find.text('Preview not available in the app yet'), findsNWidgets(2));
      expect(
          find.bySemanticsLabel(
              'Passport, Verified, preview not available in the app yet'),
          findsOneWidget);
      await tester.tap(find.text('Passport'));
      await tester.pump();
      expect(find.text('Preview not available yet'), findsOneWidget);
      semantics.dispose();
    });

    testWidgets('repeat copies fold under the newest, and open on demand',
        (tester) async {
      final semantics = tester.ensureSemantics();
      await pump(tester, WorkerFilesScreen(loadFiles: () async => cvCopies(7)));
      await settle(tester);
      expect(find.text('1 DOCUMENT ON RECORD'), findsOneWidget);
      expect(find.text('CV'), findsOneWidget);
      expect(find.text('6 earlier copies'), findsOneWidget);
      expect(
          tester.getSemantics(find.bySemanticsLabel('6 earlier copies of CV')),
          matchesSemantics(
            label: '6 earlier copies of CV',
            isButton: true,
            hasTapAction: true,
            hasExpandedState: true,
            isExpanded: false,
          ));

      await tester.tap(find.text('6 earlier copies'));
      await tester.pumpAndSettle();
      expect(find.text('CV'), findsNWidgets(7), reason: 'none is dropped');

      await tester.tap(find.text('6 earlier copies'));
      await tester.pumpAndSettle();
      expect(find.text('CV'), findsOneWidget);
      semantics.dispose();
    });

    testWidgets('an expired upload still offers Open and opens the preview',
        (tester) async {
      WorkerFile? fetched;
      await pump(
          tester,
          WorkerFilesScreen(
            loadFiles: () async => const [expired],
            fetchFile: (f) async {
              fetched = f;
              return (bytes: png, isPdf: false);
            },
          ));
      await settle(tester);
      expect(find.text('Open'), findsOneWidget);
      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();
      expect(fetched?.id, 'doc-0002');
      expect(find.byType(WorkerFileViewerScreen), findsOneWidget);
      expect(find.byType(InteractiveViewer), findsOneWidget);
    });
  });

  testWidgets('viewer: a phone with no PDF renderer says so', (tester) async {
    await tester.pumpWidget(MaterialApp(
      theme: AppTheme.theme(),
      home: WorkerFileViewerScreen(
        file:
            const WorkerFile(id: 'doc-0006', docType: 'CV', status: 'VERIFIED'),
        fetch: (_) async =>
            (bytes: Uint8List.fromList(utf8.encode('%PDF-1.7')), isPdf: true),
        // What renderPdfPages answers where no renderer exists (iOS today).
        renderPdf: (_, {required width}) async => null,
      ),
    ));
    await tester.pumpAndSettle();
    expect(find.text('This file is a PDF'), findsOneWidget);
    expect(find.byType(InteractiveViewer), findsNothing);
  });

  group('viewer: a PDF', () {
    const cv = WorkerFile(id: 'doc-0006', docType: 'CV', status: 'VERIFIED');
    final pdf = Uint8List.fromList(utf8.encode('%PDF-1.7 synthetic'));

    Future<void> open(WidgetTester tester, PdfPageRenderer render) async {
      tester.view.physicalSize = const Size(390, 1400);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);
      await tester.pumpWidget(MaterialApp(
        theme: AppTheme.theme(),
        home: WorkerFileViewerScreen(
          file: cv,
          fetch: (_) async => (bytes: pdf, isPdf: true),
          renderPdf: render,
        ),
      ));
      await tester.pumpAndSettle();
    }

    testWidgets('shows its pages, and a page opens zoomable', (tester) async {
      final semantics = tester.ensureSemantics();
      Uint8List? asked;
      await open(tester, (bytes, {required width}) async {
        asked = bytes;
        return PdfPreview([png, png], 3);
      });
      expect(asked, pdf, reason: 'the downloaded file is what is rendered');
      expect(find.byType(Image), findsNWidgets(2));
      expect(find.text('Showing the first 2 of 3 pages.'), findsOneWidget);
      expect(find.bySemanticsLabel('Page 1 of 3, double-tap to zoom'),
          findsOneWidget);

      // Through the page's accessibility tap, the one a screen reader uses:
      // these 1x1 test pictures have no size until decoded.
      tester.semantics
          .tap(find.semantics.byLabel('Page 1 of 3, double-tap to zoom'));
      await tester.pumpAndSettle();
      expect(find.text('CV · Page 1 of 3'), findsOneWidget);
      expect(find.byType(InteractiveViewer), findsOneWidget);
      semantics.dispose();
    });

    testWidgets('a damaged or locked file says so', (tester) async {
      await open(tester, (_, {required width}) async {
        throw PlatformException(code: 'render_failed');
      });
      expect(find.text('This file can’t be shown'), findsOneWidget);
    });
  });

  group('remembered storage keys', () {
    test('fill only the listed rows the server left without a key', () {
      final files = withRememberedKeys(const [
        WorkerFile(id: 'doc-a', docType: 'CV', status: 'VERIFIED'),
        WorkerFile(
            id: 'doc-b',
            docType: 'PASSPORT',
            status: 'VERIFIED',
            storedPath: 'tenant-x/worker-y/from-server.jpg'),
        WorkerFile(id: 'doc-c', docType: 'VISA', status: 'VERIFIED'),
      ], const {
        'doc-a': 'tenant-x/worker-y/remembered.pdf',
        'doc-b': 'tenant-x/worker-y/stale.jpg',
        'doc-z': 'tenant-x/worker-other/not-listed.jpg',
      });
      expect(files.map((f) => f.storedPath), [
        'tenant-x/worker-y/remembered.pdf',
        'tenant-x/worker-y/from-server.jpg', // the server's key wins
        '', // nothing remembered: still not openable
      ]);
    });

    test('are kept across reads, newest replacing an old entry', () async {
      FlutterSecureStorage.setMockInitialValues({});
      await FileKeyStore.remember(documentId: 'doc-a', objectKey: 'k1');
      await FileKeyStore.remember(documentId: 'doc-b', objectKey: 'k2');
      await FileKeyStore.remember(documentId: 'doc-a', objectKey: 'k3');
      expect(await FileKeyStore.all(), {'doc-b': 'k2', 'doc-a': 'k3'});
    });

    test('drop the oldest past the cap', () async {
      FlutterSecureStorage.setMockInitialValues({
        FileKeyStore.storageKey: jsonEncode({
          for (var i = 0; i < FileKeyStore.maxEntries; i++) 'doc-$i': 'k$i',
        }),
      });
      await FileKeyStore.remember(documentId: 'doc-new', objectKey: 'k-new');
      final keys = await FileKeyStore.all();
      expect(keys, hasLength(FileKeyStore.maxEntries));
      expect(keys.containsKey('doc-0'), isFalse);
      expect(keys['doc-new'], 'k-new');
    });

    test('an unreadable stored value reads as nothing', () async {
      FlutterSecureStorage.setMockInitialValues(
          {FileKeyStore.storageKey: 'not json'});
      expect(await FileKeyStore.all(), isEmpty);
    });
  });

  test('looksLikePdf reads the file signature', () {
    expect(looksLikePdf(Uint8List.fromList(utf8.encode('%PDF-1.4'))), isTrue);
    expect(looksLikePdf(Uint8List.fromList(png)), isFalse);
  });

  group('isPdfFile', () {
    final pdf = Uint8List.fromList(utf8.encode('%PDF-1.7'));
    final image = Uint8List.fromList(png);

    test('follows the server\'s content type when it names PDF or image', () {
      expect(isPdfFile('application/pdf', image), isTrue);
      expect(isPdfFile('Application/PDF; charset=binary', image), isTrue);
      expect(isPdfFile('image/jpeg', pdf), isFalse);
      expect(isPdfFile('image/png', image), isFalse);
    });

    test('reads the signature when the type is missing or generic', () {
      expect(isPdfFile('', pdf), isTrue);
      expect(isPdfFile('', image), isFalse);
      expect(isPdfFile('application/octet-stream', pdf), isTrue);
      expect(isPdfFile('application/octet-stream', image), isFalse);
    });
  });
}
