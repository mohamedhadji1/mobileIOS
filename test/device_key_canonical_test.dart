import 'package:flutter_test/flutter_test.dart';
import 'package:cypurge_mobile/services/device_key_service.dart';

void main() {
  test('canonicalJson sorts keys alphabetically, compact, recursive', () {
    final out = DeviceKeyService.canonicalJson({
      'os_version': 'Android 14',
      'device_model': 'Pixel 7',
      'timestamp': 1718700000000,
      'changes': [
        {'to': '67890', 'field': 'sim_serial', 'from': '12345'},
      ],
    });
    expect(
      out,
      '{"changes":[{"field":"sim_serial","from":"12345","to":"67890"}],'
      '"device_model":"Pixel 7","os_version":"Android 14",'
      '"timestamp":1718700000000}',
    );
  });
}
