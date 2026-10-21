import 'package:cypurge_mobile/utils/cv_text.dart';
import 'package:flutter_test/flutter_test.dart';

/// The two page layouts that cost us entries, written with invented people and
/// companies — a real CV's contents never go in a fixture.
///
/// Layout A: bullet headers carrying "Title - Employer  dates", indented
/// detail lines, one of them ending in a colon, and education written
/// year-first with the school on the next line.
const _layoutA = '''
Dana Okonkwo
Summary
Backend engineer with eight years on payment systems.
Education
2025 Engineering Diploma in Computer Science
Northgate Institute, Lagos
Specialization: Distributed Systems
2021 Bachelor's Degree in Communication
Harbour College of Media, Lagos
Professional Experience
• Payments Engineer - Brightline Systems 01/2025 - 11/2025
– Built and ran the settlement service.
– Responsibilities included:
∗ Ledger reconciliation.
∗ Dispute handling.
• Backend Intern - Vela Logistics 07/2024 - 08/2024
– Implemented the dispatch API, including:
∗ Route planning endpoints.
• Backend Intern - Marrow & Finch 07/2023 - 07/2023
– Wrote the invoice importer.
• Support Engineer - Castleton Mills 02/2020 - 06/2020
– Kept the warehouse terminals running.
Projects
• Tidepool
A side project for tracking tides.
Skills
• Languages: Go, Dart, SQL.
Languages
English: Native French: B2
''';

/// Layout B: a wrapped title whose tail carries the dates, the employer alone
/// on the next line, month words in French, and education with the year last.
const _layoutB = '''
Imani Serrano
Expériences
Chef de projet - conception et déploiement d'une plateforme de
réservation Déc. 2025 – Juin 2026
Lanterne Technologies
— Encadré une équipe de six personnes.
— Livré la plateforme en six mois.
Analyste de données Juin 2025 – Juil. 2025
Pergola Analytics
— Construit les tableaux de bord opérationnels.
Stage en développement applicatif Juil. 2024 – Sep. 2024
Verdigris Studio
— Développé une application de gestion de stock.
Formation
Northgate Institute – École Supérieure de Technologie 2022 – 2026
Diplôme d'Ingénieur en Informatique
Harbour College 2019 – 2022
Certifications
Attestation de secourisme
''';

void main() {
  group('jobsFromCvText, bullet headers with indented details', () {
    final jobs = jobsFromCvText(_layoutA);

    test('finds every job, not only the one above the first colon line', () {
      expect(jobs.length, 4);
    });

    test('splits the title from the employer on the header line', () {
      expect(jobs[0].title, 'Payments Engineer');
      expect(jobs[0].employer, 'Brightline Systems');
      expect(jobs[3].title, 'Support Engineer');
      expect(jobs[3].employer, 'Castleton Mills');
    });

    test('reads the dates on the header line', () {
      expect(jobs[0].start, DateTime(2025, 1));
      expect(jobs[0].end, DateTime(2025, 11));
      expect(jobs[1].start, DateTime(2024, 7));
      expect(jobs[1].end, DateTime(2024, 8));
    });

    test('keeps the detail lines as the description, bullets stripped', () {
      expect(
          jobs[0].description, contains('Built and ran the settlement service.'));
      expect(jobs[0].description, contains('Ledger reconciliation.'));
      expect(jobs[0].description, isNot(contains('∗')));
    });

    test('stops at the next section rather than reading projects as jobs', () {
      expect(jobs.map((j) => j.employer), isNot(contains('Tidepool')));
    });
  });

  group('jobsFromCvText, employer on its own line', () {
    final jobs = jobsFromCvText(_layoutB);

    test('finds every job', () {
      expect(jobs.length, 3);
    });

    test('rejoins a title that wrapped onto the date line', () {
      expect(jobs[0].title, startsWith('Chef de projet'));
      expect(jobs[0].title, endsWith('réservation'));
      expect(jobs[0].employer, 'Lanterne Technologies');
    });

    test('takes the employer from the line under the title', () {
      expect(jobs[1].title, 'Analyste de données');
      expect(jobs[1].employer, 'Pergola Analytics');
      expect(jobs[2].employer, 'Verdigris Studio');
    });

    test('reads French month words', () {
      expect(jobs[0].start, DateTime(2025, 12));
      expect(jobs[0].end, DateTime(2026, 6));
      expect(jobs[1].start, DateTime(2025, 6));
      expect(jobs[1].end, DateTime(2025, 7));
    });
  });

  group('schoolsFromCvText', () {
    test('reads year-first education, school from the line below', () {
      final schools = schoolsFromCvText(_layoutA);
      expect(schools.length, 2);
      expect(schools[0].title, 'Engineering Diploma in Computer Science');
      expect(schools[0].institution, 'Northgate Institute');
      expect(schools[0].type, 'DIPLOMA');
      expect(schools[1].institution, 'Harbour College of Media');
      expect(schools[1].type, 'DEGREE');
    });

    test('reads year-last education, degree from the line below', () {
      final schools = schoolsFromCvText(_layoutB);
      expect(schools.length, 2);
      expect(schools[0].institution, 'Northgate Institute');
      expect(schools[0].title, "Diplôme d'Ingénieur en Informatique");
      expect(schools[1].institution, 'Harbour College');
    });

    test('drops the place printed after the school, whatever the separator', () {
      // The backend builds verify@<institution>.edu from this name when the
      // worker gave no address; "Northgate Institute | Lagos" made an address
      // no mail server would accept.
      final schools = schoolsFromCvText('''
Education
Diploma in Computer Engineering 2025
Northgate Institute | Lagos
Bachelor in Communication 2021
Harbour College – Lagos
''');
      expect(schools.map((s) => s.institution),
          ['Northgate Institute', 'Harbour College']);
    });

    test('leaves the certifications section to the backend', () {
      final schools = schoolsFromCvText(_layoutB);
      expect(
        schools.map((s) => s.institution),
        isNot(contains('Attestation de secourisme')),
      );
    });
  });

  /// Layout C: a two-column page. The text layer reads left to right across
  /// both columns, so each section name arrives with the neighbouring column's
  /// text stuck to it, and the entries are interleaved with skills.
  const layoutC = '''
Imani Serrano
Profile
Data engineer, two years on agricultural pipelines.
Compétences
Formation Languages : Python, Dart, C/C++, Java,
JavaScript, PHP, HTML/CSS
Ingénieur en Informatique de sept. 2024 à ce jour
Frameworks : Flutter, FastAPI,
Northgate Institute of Technology (NIT), Campus Lagos
React.js, Node.js, Express, LangChain
Cycle préparatoire en math-physique
de sept. 2022 à juin 2024
MySQL
Institut préparatoire de Harbour
Baccalauréat scientifique
Langues
Harbour College de sept. 2021 à juin 2022
Arabe| Maternelle
''';

  group('two columns glue the section name to its neighbour', () {
    final schools = schoolsFromCvText(layoutC);

    test('a line starting with a known name still opens its section', () {
      expect(schools.length, 2);
    });

    test('pairs the qualification with the school beside it', () {
      expect(schools[0].title, 'Ingénieur en Informatique');
      expect(schools[0].institution, 'Northgate Institute of Technology (NIT)');
    });

    test('drops the date words the dates left behind', () {
      // "de sept. 2022 à juin 2024" strips to "de", which names nothing.
      expect(schools[1].institution, 'Institut préparatoire de Harbour');
      expect(schools[1].title, isNot('de'));
    });

    test('still stops at the next known name', () {
      expect(
        schools.map((s) => s.institution),
        isNot(contains('Harbour College')),
      );
    });
  });

  group('edge cases', () {
    test('empty text gives nothing rather than throwing', () {
      expect(jobsFromCvText(''), isEmpty);
      expect(schoolsFromCvText(''), isEmpty);
    });

    test('a CV with no section headings gives nothing', () {
      expect(jobsFromCvText('Dana Okonkwo\n01/2025 - 11/2025\n'), isEmpty);
    });

    test('an ongoing job has no end date', () {
      final jobs = jobsFromCvText(
        'Experience\n• Site Manager - Castleton Mills 03/2024 - Present\n',
      );
      expect(jobs.single.start, DateTime(2024, 3));
      expect(jobs.single.end, isNull);
    });

    test('page-number lines never become an entry', () {
      final jobs = jobsFromCvText(
        'Experience\n• Site Manager - Castleton Mills 03/2024 - 04/2024\n1\n',
      );
      expect(jobs.single.description, isEmpty);
    });
  });

  group('a CV is a document someone else wrote', () {
    test('cuts a title and an employer to what the record holds', () {
      final long = 'A' * 400;
      final jobs = jobsFromCvText(
        'Experience\n• $long - $long 03/2024 - 04/2024\n',
      );
      expect(jobs.single.title.length, 255);
      expect(jobs.single.employer.length, 255);
    });

    test('cuts a description to what a reference record holds', () {
      final bullet = '– ${'word ' * 60}thing.\n';
      final jobs = jobsFromCvText(
        'Experience\n• Site Manager - Castleton Mills 03/2024 - 04/2024\n${bullet * 20}',
      );
      expect(jobs.single.description.length, lessThanOrEqualTo(2000));
    });

    test('cuts a school name too', () {
      final long = 'B' * 400;
      final schools = schoolsFromCvText('Education\n2024 Diploma\n$long University\n');
      expect(schools.single.institution.length, lessThanOrEqualTo(255));
    });

    test('leaves a page of text with no newlines alone instead of scanning it',
        () {
      final wall = 'Experience\n${'lorem ipsum ' * 500}03/2024 - 04/2024\n';
      expect(jobsFromCvText(wall), isEmpty);
    });
  });

  group('cvQualificationType', () {
    test('matches the backend classification', () {
      expect(cvQualificationType('Bachelor of Science'), 'DEGREE');
      expect(cvQualificationType('Engineering Diploma'), 'DIPLOMA');
      expect(cvQualificationType('First aid certificate'), 'CERTIFICATION');
      expect(cvQualificationType('Apprenticeship in joinery'), 'APPRENTICESHIP');
      expect(cvQualificationType('Driving licence'), 'LICENSE');
    });

    test('says nothing when no keyword gives it away', () {
      expect(cvQualificationType('Northgate Institute'), '');
    });
  });
}
