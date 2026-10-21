import 'package:flutter_test/flutter_test.dart';
import 'package:cypurge_mobile/screens/device_status_screen.dart';
import 'package:cypurge_mobile/screens/re_verify_screen.dart';
import 'package:cypurge_mobile/services/device_identity_service.dart';

void main() {
  test('only the bound phone, or a backend that cannot say, opens the app', () {
    expect(screenFor(DeviceState.active), isNull);
    expect(screenFor(DeviceState.unknown), isNull);
    expect(screenFor(DeviceState.pending), DeviceScreen.pending);
    expect(screenFor(DeviceState.none), DeviceScreen.pending);
    expect(screenFor(DeviceState.rejected), DeviceScreen.rejected);
    expect(screenFor(DeviceState.replaced), DeviceScreen.replaced);
  });

  test('GetMyDeviceStatus strings map to states', () {
    final byName = DeviceState.values.asNameMap();
    for (final s in ['ACTIVE', 'PENDING', 'REJECTED', 'REPLACED', 'NONE']) {
      expect(byName[s.toLowerCase()], isNotNull, reason: s);
    }
  });

  test('a spot-check deadline counts minutes, not hours', () {
    expect(timeLeft(const Duration(minutes: 8)), '8 min');
    expect(timeLeft(const Duration(minutes: -3)), '0 min');
    expect(timeLeft(const Duration(hours: 5, minutes: 10)), '5h');
  });
}
