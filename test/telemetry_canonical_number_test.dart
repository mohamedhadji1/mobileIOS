import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:cypurge_mobile/services/background_signal_service.dart';

/// The backend verifies the telemetry ECDSA signature over Go's `json.Marshal`
/// of the same values, so every number this app signs must serialise to the
/// exact bytes Go produces. One mismatched character makes IngestTelemetry
/// answer UNAUTHENTICATED and the batch is dropped permanently.
///
/// Each case below is a value Dart and Go format differently.
void main() {
  String enc(double v) => jsonEncode(canonicalTelemetryNumber(v));

  group('canonicalTelemetryNumber matches Go json.Marshal', () {
    test('collapses -0.0, which Go prints as -0', () {
      expect(enc(-0.0), '0');
    });

    test('whole values serialise as ints, like a whole float64 in Go', () {
      expect(enc(20.0), '20');
      expect(enc(0.0), '0');
      expect(enc(-3.0), '-3');
    });

    test('values below 1e-6 collapse to 0 rather than Go exponent form', () {
      // Go emits 1.1920928955078125e-07 (padded exponent); Dart would emit
      // 1.1920928955078125e-7. Rounding removes the disagreement entirely.
      expect(enc(1.1920928955078125e-7), '0');
      expect(enc(-4.9e-7), '0');
    });

    test('keeps real sensor precision to 6dp', () {
      expect(enc(9.806650161743164), '9.80665');
      expect(enc(36.8064972), '36.806497');
    });

    test('never emits exponent form or negative zero', () {
      const samples = <double>[
        -0.0,
        1e-9,
        5e-7,
        1e-6,
        9.806650161743164,
        -0.0000004,
        1234.5678901,
      ];
      for (final v in samples) {
        final out = enc(v);
        expect(out.contains('e'), isFalse, reason: 'exponent in "$out" for $v');
        expect(out, isNot('-0'), reason: 'negative zero for $v');
      }
    });

    test('non-finite values become 0 instead of breaking jsonEncode', () {
      // NaN/Infinity are not valid JSON — jsonEncode would throw mid-signing.
      expect(enc(double.nan), '0');
      expect(enc(double.infinity), '0');
      expect(enc(double.negativeInfinity), '0');
    });
  });
}
