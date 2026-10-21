import 'package:cypurge_mobile/services/document_check.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('every doc type we upload has a check button; back sides do not', () {
    // An unmapped type would never be checked, and the backend deletes an
    // unchecked upload after 30 minutes.
    const types = {
      'PASSPORT': 'passport',
      'NATIONAL_ID': 'national_id',
      'DRIVING_LICENSE': 'driving_licence',
      'WORK_PERMIT': 'work_permit',
      'VISA': 'visa',
      'CV': 'cv',
      'QUALIFICATION_CERT': 'diploma',
      'LICENSE': 'certificate',
      'DOCUMENT': 'certificate',
    };
    types.forEach((docType, expected) {
      expect(expectedTypeFor(docType), expected, reason: docType);
    });
    expect(expectedTypeFor('National ID (Back)'), isNull);
    expect(expectedTypeFor('Driving License (Back)'), isNull);
  });

  test('only ID cards and driving licences carry a back side', () {
    expect(isTwoSided('national_id'), isTrue);
    expect(isTwoSided('driving_licence'), isTrue);
    expect(isTwoSided('passport'), isFalse);
  });

  test('refusal text names both documents, and never blames an outage', () {
    expect(refusalText('passport', 'wrong_type', 'cv'),
        'This looks like a CV, not a passport. Please upload your passport.');
    expect(refusalText('diploma', 'unreadable', ''),
        contains("couldn't recognise this as a diploma"));
    expect(refusalText('passport', 'unreadable', ''), contains('two lines'));
  });

  // The selfie rides only on checks of documents that carry a photo, so the
  // ML compares ID photo with selfie. Past the backend's 5 MB cap the whole
  // check would fail, so an oversized selfie is left out instead.
  test('a selfie goes only with passports and ID cards, and only under 5 MB',
      () {
    const selfie = [1, 2, 3];
    for (final id in ['passport', 'national_id', 'driving_licence']) {
      expect(selfieFor(id, selfie), selfie, reason: id);
    }
    for (final other in ['work_permit', 'visa', 'cv', 'diploma', 'certificate']) {
      expect(selfieFor(other, selfie), isNull, reason: other);
    }
    expect(selfieFor('passport', null), isNull);
    expect(selfieFor('passport', const []), isNull);
    expect(selfieFor('passport', List.filled(maxCheckSelfieBytes, 0)), isNotNull);
    expect(selfieFor('passport', List.filled(maxCheckSelfieBytes + 1, 0)), isNull);
  });
}
