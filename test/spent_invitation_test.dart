import 'package:flutter_test/flutter_test.dart';
import 'package:grpc/grpc.dart';
import 'package:cypurge_mobile/screens/enrollment_qr_screen.dart';

/// Guards the one string contract between the QR screen and the worker service:
/// if ValidateInvitation's rejection message is reworded past these tokens, the
/// screen silently stops offering "Go to sign in" and dead-ends the worker again.
void main() {
  group('isSpentInvitation', () {
    test('matches the live ValidateInvitation rejection', () {
      const e = GrpcError.unknown(
          'invitation already accepted or invalid status: ACCEPTED');
      expect(isSpentInvitation(e), isTrue);
    });

    test('matches regardless of case', () {
      expect(
          isSpentInvitation(Exception('Invitation Already Accepted')), isTrue);
    });

    test('does not match an expired invitation', () {
      expect(isSpentInvitation(const GrpcError.unknown('invitation expired')),
          isFalse);
    });

    test('does not match a missing invitation', () {
      expect(isSpentInvitation(const GrpcError.unknown('invitation not found')),
          isFalse);
    });

    test('does not match a transport failure', () {
      expect(
          isSpentInvitation(const GrpcError.unavailable('connection refused')),
          isFalse);
    });
  });
}
