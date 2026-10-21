import 'package:flutter_test/flutter_test.dart';
import 'package:cypurge_mobile/services/background_signal_service.dart';

/// The server (worker service `telemetryFreshnessWindow`) rejects any signed
/// telemetry batch more than 5 minutes from its clock. A buffered batch cannot
/// be re-signed with a fresh time, so the flush path must drop stale batches
/// instead of retrying them forever behind a stopped flush.
void main() {
  const nowMs = 1750000000000;
  Map<String, dynamic> batchAt(int ts) => {
        'payload': {'timestamp': ts, 'device_model': 'ExampleModel'},
        'signature': 'deadbeef',
        'timestamp': ts,
      };

  test('keeps a batch captured just now', () {
    expect(BackgroundSignalService.isSendable(batchAt(nowMs), nowMs), isTrue);
  });

  test('keeps a batch inside the 5-minute window', () {
    final fourMinAgo = nowMs - const Duration(minutes: 4).inMilliseconds;
    expect(
        BackgroundSignalService.isSendable(batchAt(fourMinAgo), nowMs), isTrue);
  });

  test('drops a batch past the 5-minute window', () {
    final sixMinAgo = nowMs - const Duration(minutes: 6).inMilliseconds;
    expect(
        BackgroundSignalService.isSendable(batchAt(sixMinAgo), nowMs), isFalse);
  });

  test('drops a batch whose clock ran ahead of the server', () {
    final sixMinAhead = nowMs + const Duration(minutes: 6).inMilliseconds;
    expect(BackgroundSignalService.isSendable(batchAt(sixMinAhead), nowMs),
        isFalse);
  });

  test('drops a batch with a missing or malformed timestamp', () {
    expect(
      BackgroundSignalService.isSendable({
        'payload': {'device_model': 'ExampleModel'},
        'signature': 'deadbeef',
      }, nowMs),
      isFalse,
    );
    expect(
      BackgroundSignalService.isSendable({
        'payload': {'timestamp': 'not-a-number'},
        'signature': 'deadbeef',
      }, nowMs),
      isFalse,
    );
  });

  // GPS movement triggers a collection, but the 500 m distance filter alone
  // would fire every ~18 s in a vehicle at 100 km/h. The cooldown is what keeps
  // that from becoming ~200 batches an hour.
  group('GPS move trigger cooldown', () {
    final now = DateTime.utc(2026, 8, 6, 12, 0, 0);

    test('fires when nothing has triggered yet', () {
      expect(BackgroundSignalService.shouldTriggerOnMove(null, now), isTrue);
    });

    test('suppresses a second move inside the cooldown', () {
      final justNow = now.subtract(const Duration(seconds: 30));
      expect(BackgroundSignalService.shouldTriggerOnMove(justNow, now), isFalse);
    });

    test('fires again once the cooldown has elapsed', () {
      final threeMinAgo = now.subtract(const Duration(minutes: 3));
      expect(
          BackgroundSignalService.shouldTriggerOnMove(threeMinAgo, now), isTrue);
    });

    test('fires exactly on the cooldown boundary', () {
      final twoMinAgo = now.subtract(const Duration(minutes: 2));
      expect(
          BackgroundSignalService.shouldTriggerOnMove(twoMinAgo, now), isTrue);
    });
  });
}
