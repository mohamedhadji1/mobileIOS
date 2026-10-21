import 'package:cypurge_mobile/utils/decision_note.dart';
import 'package:cypurge_mobile/utils/resubmission_message.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('decisionNoteAction', () {
    test('saves the reason from a block push', () {
      expect(
        decisionNoteAction('ENROLLMENT_REJECTED',
            {'reason': 'Document photo does not match your face.'}),
        DecisionNoteAction.save,
      );
      expect(
        decisionNoteAction(
            'TRUST_STATUS_CHANGED', {'colour': 'red', 'reason': 'Sanctions hit'}),
        DecisionNoteAction.save,
      );
    });

    test('clears an older reason when a new block arrives without one', () {
      expect(decisionNoteAction('ENROLLMENT_REJECTED', {'reason': '  '}),
          DecisionNoteAction.clear);
    });

    test('clears the reason once the worker is reinstated', () {
      expect(decisionNoteAction('ENROLLMENT_APPROVED', const {}),
          DecisionNoteAction.clear);
      expect(decisionNoteAction('TRUST_STATUS_CHANGED', {'colour': 'GREEN'}),
          DecisionNoteAction.clear);
    });

    test('leaves the note alone for unrelated notifications', () {
      expect(decisionNoteAction('REVERIFICATION_DUE', {'reason': 'x'}),
          DecisionNoteAction.ignore);
      expect(decisionNoteAction(null, const {}), DecisionNoteAction.ignore);
    });
  });

  group('isBlockDecision', () {
    test('is true only for a block, so only a block is raised to urgent', () {
      expect(isBlockDecision('ENROLLMENT_REJECTED', const {}), isTrue);
      expect(isBlockDecision('TRUST_STATUS_CHANGED', {'colour': 'RED'}), isTrue);
      expect(
          isBlockDecision('TRUST_STATUS_CHANGED', {'colour': 'YELLOW'}), isFalse);
      expect(isBlockDecision('DOCUMENT_EXPIRING', const {}), isFalse);
    });
  });

  group('resubmissionNote', () {
    test('keeps the analyst\'s words and drops the document list', () {
      expect(
        resubmissionNote(
            'Re-upload: Passport, Work permit. HR needs it for site access.'),
        'HR needs it for site access.',
      );
    });

    test('is empty when the message was only the list', () {
      expect(resubmissionNote('Re-upload: Passport.'), '');
    });

    test('returns plain text untouched', () {
      expect(resubmissionNote('  Wrong side scanned.  '), 'Wrong side scanned.');
    });

    test('still parses the same text into rows', () {
      expect(
        parseFlaggedDocuments(
            "Re-upload: Driver's licence (back), Work permit. Blurry."),
        ["Driver's licence (back)", 'Work permit'],
      );
    });
  });
}
