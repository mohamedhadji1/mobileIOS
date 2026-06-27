import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pointycastle/export.dart';

/// Device signing identity per the Telemetry Ingestion spec (Part 2 & 3).
///
/// Holds a P-256 (secp256r1) keypair in secure storage. The PUBLIC key is
/// registered with the backend (PEM/SPKI); telemetry + security-event payloads
/// are signed locally so the backend can verify them against that key.
///
/// Signature = DER(ECDSA-SHA256(canonicalJson(payload))) hex-encoded.
class DeviceKeyService {
  static final DeviceKeyService _instance = DeviceKeyService._();
  factory DeviceKeyService() => _instance;
  DeviceKeyService._();

  static const _privKeyStorageKey = 'device_ec_priv_d_hex';
  static final _domain = ECDomainParameters('secp256r1');
  final _storage = const FlutterSecureStorage();

  ECPrivateKey? _cachedPriv;

  // ── Public API ────────────────────────────────────────────────────────────

  /// Canonical JSON: keys sorted alphabetically (recursively), compact (no
  /// spaces — `jsonEncode` default).
  ///
  /// ponytail: cross-language number formatting must match the backend's
  /// serializer byte-for-byte (e.g. `0` vs `0.0`). Verify with one real
  /// IngestTelemetry round-trip; if the backend returns INVALID_ARGUMENT,
  /// align number formatting here to the backend before anything else.
  static String canonicalJson(Object? value) => jsonEncode(_sortKeys(value));

  /// Signs [payload] and returns the hex-encoded DER ECDSA signature.
  Future<String> signCanonicalHex(Map<String, dynamic> payload) async {
    final priv = await _ensurePrivateKey();
    final bytes = Uint8List.fromList(utf8.encode(canonicalJson(payload)));
    final signer = Signer('SHA-256/DET-ECDSA') as ECDSASigner;
    signer.init(true, PrivateKeyParameter<ECPrivateKey>(priv));
    final sig = signer.generateSignature(bytes) as ECSignature;
    return _toHex(_derEncode(sig.r, sig.s));
  }

  /// PEM-encoded SPKI public key (`-----BEGIN PUBLIC KEY-----`). Send this to
  /// RegisterDevice.
  Future<String> publicKeyPem() async {
    final priv = await _ensurePrivateKey();
    final q = (_domain.G * priv.d)!; // public point
    final x = _bigIntTo32(q.x!.toBigInteger()!);
    final y = _bigIntTo32(q.y!.toBigInteger()!);
    // Fixed SPKI prefix for id-ecPublicKey + prime256v1, then 0x04||X||Y.
    final prefix = _fromHex(
        '3059301306072a8648ce3d020106082a8648ce3d03010703420004');
    final der = Uint8List.fromList([...prefix, ...x, ...y]);
    final b64 = base64.encode(der);
    final lines = <String>['-----BEGIN PUBLIC KEY-----'];
    for (var i = 0; i < b64.length; i += 64) {
      lines.add(b64.substring(i, min(i + 64, b64.length)));
    }
    lines.add('-----END PUBLIC KEY-----');
    return lines.join('\n');
  }

  // ── Key material ──────────────────────────────────────────────────────────

  Future<ECPrivateKey> _ensurePrivateKey() async {
    if (_cachedPriv != null) return _cachedPriv!;
    final stored = await _storage.read(key: _privKeyStorageKey);
    if (stored != null && stored.isNotEmpty) {
      _cachedPriv = ECPrivateKey(BigInt.parse(stored, radix: 16), _domain);
      return _cachedPriv!;
    }
    final pair = _generateKeyPair();
    final priv = pair.privateKey as ECPrivateKey;
    await _storage.write(
        key: _privKeyStorageKey, value: priv.d!.toRadixString(16));
    _cachedPriv = priv;
    return priv;
  }

  AsymmetricKeyPair<PublicKey, PrivateKey> _generateKeyPair() {
    final seed = Uint8List.fromList(
        List<int>.generate(32, (_) => Random.secure().nextInt(256)));
    final rng = FortunaRandom()..seed(KeyParameter(seed));
    final gen = ECKeyGenerator()
      ..init(ParametersWithRandom(ECKeyGeneratorParameters(_domain), rng));
    return gen.generateKeyPair();
  }

  // ── Encoding helpers ──────────────────────────────────────────────────────

  static Object? _sortKeys(Object? value) {
    if (value is Map) {
      final sorted = <String, Object?>{};
      for (final k in value.keys.map((e) => e.toString()).toList()..sort()) {
        sorted[k] = _sortKeys(value[k]);
      }
      return sorted;
    }
    if (value is List) return value.map(_sortKeys).toList();
    return value;
  }

  /// ASN.1 DER `SEQUENCE { INTEGER r, INTEGER s }`.
  static Uint8List _derEncode(BigInt r, BigInt s) {
    final rb = _derInt(r);
    final sb = _derInt(s);
    final body = <int>[...rb, ...sb];
    return Uint8List.fromList([0x30, ..._derLen(body.length), ...body]);
  }

  static List<int> _derInt(BigInt v) {
    var bytes = _bigIntToBytes(v);
    if (bytes.isEmpty) bytes = [0];
    if (bytes[0] & 0x80 != 0) bytes = [0, ...bytes]; // keep it positive
    return [0x02, ..._derLen(bytes.length), ...bytes];
  }

  static List<int> _derLen(int len) {
    if (len < 0x80) return [len];
    final out = <int>[];
    var l = len;
    while (l > 0) {
      out.insert(0, l & 0xff);
      l >>= 8;
    }
    return [0x80 | out.length, ...out];
  }

  static List<int> _bigIntToBytes(BigInt v) {
    if (v == BigInt.zero) return [0];
    final out = <int>[];
    var n = v;
    while (n > BigInt.zero) {
      out.insert(0, (n & BigInt.from(0xff)).toInt());
      n >>= 8;
    }
    return out;
  }

  static Uint8List _bigIntTo32(BigInt v) {
    final raw = _bigIntToBytes(v);
    final out = Uint8List(32);
    final start = 32 - raw.length;
    for (var i = 0; i < raw.length; i++) {
      out[start + i] = raw[i];
    }
    return out;
  }

  static String _toHex(List<int> bytes) =>
      bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();

  static Uint8List _fromHex(String hex) {
    final out = Uint8List(hex.length ~/ 2);
    for (var i = 0; i < out.length; i++) {
      out[i] = int.parse(hex.substring(i * 2, i * 2 + 2), radix: 16);
    }
    return out;
  }
}
