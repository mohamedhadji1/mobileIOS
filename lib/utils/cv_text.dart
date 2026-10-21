/// Reads the jobs and schools a CV lists out of the text ParseCv returns.
///
/// The ML gateway groups a CV into sections and hands the backend the entries
/// it recognised, but it ends a section at any line that looks like a heading —
/// and an indented detail line ending in a colon ("Responsibilities included:")
/// looks exactly like one. The jobs below that line land in sections the
/// backend does not read, so a five-job CV can arrive as one job. Education
/// written year-first ("2025 Engineering Diploma") never anchors at all and
/// arrives empty.
///
/// Those sections do not cross the wire: ParseCv answers with jobs,
/// qualifications, raw_text, links and contact, and the document service's
/// GetDocumentExtraction is not proxied by the gateway. The whole page text is
/// in raw_text though, so it is read here and merged with what the server sent
/// (mergeCvJobs / mergeCvSchools in services/work_history_service.dart).
///
/// Everything this file produces is a suggestion for the worker to confirm,
/// never a fact: the caller marks it needsCheck.
library;

import 'package:flutter/foundation.dart';

/// One job read off the page.
@immutable
class CvTextJob {
  const CvTextJob({
    required this.title,
    required this.employer,
    this.description = '',
    this.start,
    this.end,
  });

  final String title;
  final String employer;
  final String description;
  final DateTime? start;

  /// Null when the job is ongoing or the CV gave no end.
  final DateTime? end;
}

/// One school or degree read off the page.
@immutable
class CvTextSchool {
  const CvTextSchool({required this.title, required this.institution});

  final String title;
  final String institution;

  /// DEGREE, DIPLOMA, CERTIFICATION, LICENSE, APPRENTICESHIP, or '' when no
  /// keyword gives it away. Matches the backend's own qualification types.
  String get type => cvQualificationType('$title $institution');
}

/// Same ceiling as the backend's own cvMaxEntries: a CV listing more than
/// this is not a CV.
const cvMaxEntries = 50;

/// A section heading is a short line. Longer than this and it is prose.
const _maxHeadingChars = 40;

/// …unless the page has two columns, where the heading arrives with its
/// neighbour's text stuck to it. Past this it is prose again.
const _maxGluedHeadingChars = 90;

/// An employer or a school printed alone on its row.
const _maxNameChars = 70;

/// A header this short is the tail of a line that wrapped, not a whole title.
const _wrappedTailChars = 20;

/// What a title, an employer or a school name is cut to — the backend's own
/// cvMaxHeaderRunes, and the width of the column that stores the position.
const _maxFieldRunes = 255;

/// …and a description, matching the backend's maxReferenceDescriptionRunes.
const _maxDescriptionRunes = 2000;

/// A line longer than this is prose, never a header, so it is not worth
/// running the date patterns over. raw_text arrives capped at 50,000 runes but
/// nothing promises it has newlines in it, and the work here is on the UI
/// isolate.
const _maxScannedLineChars = 1000;

final _letter = RegExp(r'[a-z]');
final _bullet = RegExp(r'^[\s•·▪▫◦‣∗*●○■□►▸➢✓✔\-–—]+');
final _bulletGlyph = RegExp(r'^\s*[•·▪▫◦‣∗*●○■□►▸➢✓✔\-–—]');
final _spaces = RegExp(r'\s+');

/// A line that is only a page number: "2", "- 2 -", "2/3", "Page 2 of 3".
final _pageOnly = RegExp(
  r'^\W*(?:(?:page|p\.?)\s*)?\d{1,3}(?:\s*(?:/|of|sur|de)\s*\d{1,3})?\W*$',
  caseSensitive: false,
);

const _monthWord =
    r'(?:jan|f[eé]v|feb|mar|avr|apr|ma[iy]|juin|juil|jun|jul|ao[uû]t|aug|sept|sep|oct|nov|d[eé]c)[a-zà-ÿ]*\.?';
const _yearMonth =
    '(?:$_monthWord[\\s.]+|\\d{1,2}\\s*[/.-]\\s*)?(?:19|20)\\d{2}';
const _ongoing =
    r"(?:present|pr[eé]sente?|current(?:ly)?|now|today|ongoing|aujourd['’]hui|en cours|ce jour)";

/// "01/2025 - 11/2025", "Déc. 2025 – Juin 2026", "2022 – 2026", "Jan 2025 – Present".
final _dateRange = RegExp(
  "($_yearMonth)\\s*(?:[-–—]|to|à|au|jusqu['’]?(?:au|à)?)\\s*($_yearMonth|$_ongoing)",
  caseSensitive: false,
);
final _anyYear = RegExp(r'(?:19|20)\d{2}');

/// The separators a "Title - Employer" header is written with, in the order
/// the backend tries them.
final _headerSeparators = <RegExp>[
  RegExp(r'\s+at\s+', caseSensitive: false),
  RegExp(r'\s+chez\s+', caseSensitive: false),
  RegExp(r'\s+@\s+'),
  RegExp(r'\s+[-–—|]\s+'),
  RegExp(r',\s+'),
];

/// Cuts a school line into its parts.
final _segmentSplit =
    RegExp(r'\s+(?:at|chez|@|[-–—|])\s+|,\s+', caseSensitive: false);

final _institutionWords = RegExp(
  r'\b(?:university|universite|univ|faculty|faculte|institute|institut|ecole|school|college|academy|academie|lycee|iset|enit|insat|esprit|isamm|polytechnique|centre de formation|center|centre|ihec|isg)\b',
);
final _degreeWords = RegExp(
  r'\b(?:bachelor|master|masters|mastere|maitrise|licence|phd|ph\.d|doctorat|doctorate|mba|msc|bsc|ingenieur|engineering degree|deug|degree)\b',
);
final _diplomaWords = RegExp(
  r'\b(?:diploma|diplome|baccalaureat|bac|bts|dut|cap|high school)\b',
);
final _certificationWords = RegExp(
  r'\b(?:certificate|certification|certified|certifie|certificat|attestation)\b',
);
final _apprenticeshipWords = RegExp(
  r'\b(?:apprenticeship|apprentissage|alternance|apprenti)\b',
);
final _licenseWords = RegExp(
  r"\bdriving licen[cs]e\b|\bdriver'?s? licen[cs]e\b|\bpermis\b|\blicense\b",
);

/// Headings that open the block we read jobs from.
const _experienceHeadings = [
  'experience',
  'emploi',
  'parcours professionnel',
  'career history',
  'work history',
];

/// …and the block we read schools from.
const _educationHeadings = [
  'education',
  'formation',
  'etudes',
  'academic',
  'scolarite',
  'diplomes',
  'qualifications',
];

/// Headings that close either block. A CV's other sections are not ours: the
/// backend already reads a "certifications" section, and projects, skills and
/// languages are not employment history.
const _otherHeadings = [
  'project',
  'projet',
  'skill',
  'competence',
  'certification',
  'langue',
  'language',
  'interest',
  'hobb',
  'reference',
  'summary',
  'resume',
  'profil',
  'contact',
  'award',
  'publication',
  'benevol',
  'volunteer',
  'activite',
];

enum _Block { none, experience, education, other }

/// Every job the page lists, in the order it lists them.
List<CvTextJob> jobsFromCvText(String raw) {
  final block = _blockOf(raw, _Block.experience);
  final headers = <int>[];
  for (var i = 0; i < block.length; i++) {
    if (_scannable(block[i]) && _dateRange.hasMatch(block[i])) headers.add(i);
  }

  final jobs = <CvTextJob>[];
  for (var h = 0; h < headers.length && jobs.length < cvMaxEntries; h++) {
    final i = headers[h];
    final line = block[i];
    final match = _dateRange.firstMatch(line)!;
    var text = _clean(line.replaceRange(match.start, match.end, ' '));
    var wrapped = false;

    // A header whose text is short, or missing entirely, is the tail of a line
    // that wrapped: the title above it belongs to the same job.
    if (text.length < _wrappedTailChars &&
        i > 0 &&
        !headers.contains(i - 1) &&
        _isNameLine(block[i - 1], allowLong: true)) {
      text = _clean('${_clean(block[i - 1])} $text');
      wrapped = true;
    }

    var title = text;
    var employer = '';
    // A wrapped title is one sentence; splitting it at its first dash would cut
    // the title in half rather than find an employer.
    if (!wrapped) {
      final split = _splitHeader(text);
      if (split != null) {
        title = split.$1;
        employer = split.$2;
      }
    }

    final next = h + 1 < headers.length ? headers[h + 1] : block.length;
    if (employer.isEmpty) {
      // The employer printed on its own line under the title.
      for (var j = i + 1; j < next && j < i + 3; j++) {
        if (_isNameLine(block[j])) {
          employer = _clean(block[j]);
          break;
        }
      }
    }

    if (title.isEmpty && employer.isEmpty) continue;
    jobs.add(CvTextJob(
      title: _cut(title, _maxFieldRunes),
      employer: _cut(employer, _maxFieldRunes),
      description: _cut(
        _descriptionOf(block, i + 1, next, title, employer),
        _maxDescriptionRunes,
      ),
      start: _dateOf(match.group(1)!),
      end: _isOngoing(match.group(2)!) ? null : _dateOf(match.group(2)!),
    ));
  }
  return jobs;
}

/// Every school the page lists. A degree and its school are often on separate
/// lines, in either order, so the line carrying the year anchors the entry and
/// the missing half is taken from the line beside it.
List<CvTextSchool> schoolsFromCvText(String raw) {
  final block = _blockOf(raw, _Block.education);
  final used = <int>{};
  final schools = <CvTextSchool>[];

  for (var i = 0; i < block.length && schools.length < cvMaxEntries; i++) {
    if (!_scannable(block[i]) || !_anyYear.hasMatch(block[i])) continue;
    final text =
        _clean(block[i].replaceAll(_dateRange, ' ').replaceAll(_anyYear, ' '));
    used.add(i);

    var title = '';
    var institution = '';
    // "de sept. 2022 à juin 2024" leaves "de" behind once the dates are gone.
    // What is left of a date label names nothing.
    if (text.isNotEmpty && !_isDateFiller(text)) {
      final parts = _splitSchoolLine(text);
      title = _trimTrailingFiller(parts.$1);
      institution = _trimTrailingFiller(parts.$2);
    }
    if (institution.isEmpty) {
      institution = _lookAround(block, i, used, _looksLikeInstitution);
    }
    if (title.isEmpty) {
      title = _lookAround(block, i, used, _looksLikeDegree);
    }
    if (title.isEmpty && institution.isEmpty) continue;
    schools.add(CvTextSchool(
      title: _cut(title, _maxFieldRunes),
      institution: _cut(_withoutPlace(institution), _maxFieldRunes),
    ));
  }
  return schools;
}

/// The backend's own classification, so a suggestion read here lands on the
/// same type as one the server sent.
String cvQualificationType(String text) {
  final folded = _fold(text);
  if (_apprenticeshipWords.hasMatch(folded)) return 'APPRENTICESHIP';
  if (_licenseWords.hasMatch(folded)) return 'LICENSE';
  if (_degreeWords.hasMatch(folded)) return 'DEGREE';
  if (_diplomaWords.hasMatch(folded)) return 'DIPLOMA';
  if (_certificationWords.hasMatch(folded)) return 'CERTIFICATION';
  return '';
}

/// The lines under every heading of the kind asked for. Heading lines
/// themselves are dropped, and a block ends at the next heading of any kind.
List<String> _blockOf(String raw, _Block want) {
  final out = <String>[];
  var inside = false;
  for (final line in raw.split('\n')) {
    if (_pageOnly.hasMatch(line.trim())) continue;
    final kind = _headingOf(line);
    if (kind != _Block.none) {
      inside = kind == want;
      continue;
    }
    if (inside) out.add(line);
  }
  return out;
}

/// Which block a line opens, if any.
///
/// Only a name we know opens a section; anything else is content, however much
/// it looks like a heading. A line carrying dates is an entry, never a heading
/// — that mistake is what this whole file exists to undo.
_Block _headingOf(String raw) {
  if (!_scannable(raw)) return _Block.none;
  final line = _clean(raw);
  if (line.isEmpty || line.endsWith('.') || _dateRange.hasMatch(line)) {
    return _Block.none;
  }
  final folded = _fold(line);
  if (line.length <= _maxHeadingChars) {
    if (_experienceHeadings.any(folded.contains)) return _Block.experience;
    if (_educationHeadings.any(folded.contains)) return _Block.education;
    if (_otherHeadings.any(folded.contains)) return _Block.other;
    return _Block.none;
  }
  // A two-column page reads left to right across both columns, so a heading
  // arrives glued to the column beside it ("Formation Languages : Python…").
  // It still opens its section when the line *starts* with the name.
  if (line.length > _maxGluedHeadingChars) return _Block.none;
  if (_experienceHeadings.any((name) => _opensWith(folded, name))) {
    return _Block.experience;
  }
  if (_educationHeadings.any((name) => _opensWith(folded, name))) {
    return _Block.education;
  }
  if (_otherHeadings.any((name) => _opensWith(folded, name))) {
    return _Block.other;
  }
  return _Block.none;
}

/// Whether a line begins with a section name, as a whole word.
bool _opensWith(String folded, String name) =>
    folded.startsWith(name) &&
    (folded.length == name.length || !_letter.hasMatch(folded[name.length]));

/// Splits "Title - Employer" at the first separator that leaves both halves.
(String, String)? _splitHeader(String header) {
  for (final separator in _headerSeparators) {
    final at = separator.firstMatch(header);
    if (at == null) continue;
    final title = _clean(header.substring(0, at.start));
    final employer = _clean(header.substring(at.end));
    if (title.isNotEmpty && employer.isNotEmpty) return (title, employer);
  }
  return null;
}

/// Separates a school line into the qualification and who awarded it.
(String, String) _splitSchoolLine(String line) {
  final segments = line
      .split(_segmentSplit)
      .map(_clean)
      .where((s) => s.isNotEmpty)
      .toList(growable: false);
  if (segments.isEmpty) return ('', '');
  if (segments.length == 1) {
    final one = segments.first;
    if (cvQualificationType(one).isNotEmpty) return (one, '');
    return ('', one);
  }

  // The school is the part naming one and claiming no qualification.
  var pick = segments.indexWhere(
      (s) => _looksLikeInstitution(s) && cvQualificationType(s).isEmpty);
  if (pick < 0) pick = segments.indexWhere(_looksLikeInstitution);
  if (pick < 0) return (segments.join(' - '), '');

  final rest = [...segments.sublist(0, pick), ...segments.sublist(pick + 1)]
      // A second school name is the same school written out in full, not the
      // qualification; only a part that reads as a qualification is the title.
      .where((s) => cvQualificationType(s).isNotEmpty)
      .join(' - ');
  return (rest, segments[pick]);
}

/// Looks one line after, then one before, then two after, for the half the
/// year line did not carry. A line already spent on another entry is skipped.
String _lookAround(
  List<String> block,
  int index,
  Set<int> used,
  bool Function(String) wanted,
) {
  for (final at in [index + 1, index - 1, index + 2]) {
    if (at < 0 || at >= block.length || used.contains(at)) continue;
    final line = block[at];
    if (_anyYear.hasMatch(line) || !_isNameLine(line, allowLong: true)) continue;
    if (!wanted(line)) continue;
    used.add(at);
    return _clean(line);
  }
  return '';
}

/// A school's name without the place printed after it: "Esprit | Tunisia",
/// "Northgate University, Lagos", "ISAMM – Tunis". The place is not part of
/// the name — and the name is what the backend builds the university's
/// verification address from when the worker gave none.
String _withoutPlace(String school) {
  final parts = school
      .split(_segmentSplit)
      .map(_clean)
      .where((p) => p.isNotEmpty)
      .toList(growable: false);
  if (parts.length < 2) return _clean(school);
  return parts.firstWhere(_looksLikeInstitution, orElse: () => parts.first);
}

/// An entry's remaining lines, bullets and page numbers removed, without the
/// lines that only repeat its header.
String _descriptionOf(
  List<String> block,
  int from,
  int to,
  String title,
  String employer,
) {
  final header = {_fold(title), _fold(employer)}..remove('');
  final kept = <String>[];
  for (var i = from; i < to; i++) {
    final line = _clean(block[i]);
    if (line.isEmpty || _pageOnly.hasMatch(line)) continue;
    if (header.contains(_fold(line))) continue;
    kept.add(line);
  }
  return kept.join('\n');
}

/// Whether a line can stand as an employer or a school name: no bullet, not a
/// sentence, not a heading, no dates.
bool _isNameLine(String raw, {bool allowLong = false}) {
  if (_bulletGlyph.hasMatch(raw)) return false;
  final line = _clean(raw);
  if (line.isEmpty) return false;
  if (!allowLong && line.length > _maxNameChars) return false;
  if (line.endsWith('.') || line.endsWith(':')) return false;
  if (_dateRange.hasMatch(line) || _pageOnly.hasMatch(line)) return false;
  return _headingOf(raw) == _Block.none;
}

/// Whether a line is short enough to be worth running the date patterns over.
/// A header never runs to a thousand characters; a wall of text can, and
/// scanning it would only cost the frame.
bool _scannable(String line) => line.length <= _maxScannedLineChars;

/// The words a date label is made of: what is left of "de sept. 2022 à juin
/// 2024" once the dates are taken out. They name nothing on their own.
const _dateWords = {
  'a', 'au', 'ce', 'cours', 'courant', 'd', 'date', 'de', 'depuis', 'du',
  'en', 'from', 'hui', 'jour', 'jusqu', 'l', 'la', 'le', 'maintenant', 'now',
  'ongoing', 'present', 'presente', 'since', 'till', 'to', 'today', 'until',
  'actuel', 'actuelle', 'actuellement', 'aujourd', 'current', 'currently',
};

/// Whether a line says nothing but a date label.
bool _isDateFiller(String line) {
  final words = _fold(line).split(RegExp(r'[^a-z]+')).where((w) => w.isNotEmpty);
  return words.isEmpty || words.every(_dateWords.contains);
}

/// Drops the date words left dangling on the end of a value — "Ingénieur en
/// Informatique de". Only the end: a name can legitimately open with one
/// ("La Tunisienne d'Entreprise Générale").
String _trimTrailingFiller(String s) {
  final words = s.split(' ');
  while (words.length > 1 && _isDateFiller(words.last)) {
    words.removeLast();
  }
  final kept = words.join(' ');
  return _isDateFiller(kept) ? '' : kept;
}

bool _looksLikeInstitution(String s) => _institutionWords.hasMatch(_fold(s));

bool _looksLikeDegree(String s) => cvQualificationType(s).isNotEmpty;

bool _isOngoing(String token) => _anyYear.firstMatch(token) == null;

/// "01/2025", "Juil. 2024", "2022" → the first of that month.
DateTime? _dateOf(String token) {
  final year = _anyYear.firstMatch(token);
  if (year == null) return null;
  final month = _monthOf(token);
  return DateTime(
      int.parse(year.group(0)!), month < 1 || month > 12 ? 1 : month);
}

int _monthOf(String token) {
  final numeric =
      RegExp(r'(\d{1,2})\s*[/.-]\s*(?:19|20)\d{2}').firstMatch(token);
  if (numeric != null) return int.parse(numeric.group(1)!);
  final word = _fold(token).replaceAll(RegExp(r'[^a-z]'), '');
  if (word.startsWith('juil') || word.startsWith('jul')) return 7;
  if (word.startsWith('juin') || word.startsWith('jun')) return 6;
  const months = {
    'jan': 1,
    'fev': 2,
    'feb': 2,
    'mar': 3,
    'avr': 4,
    'apr': 4,
    'mai': 5,
    'may': 5,
    'aou': 8,
    'aug': 8,
    'sep': 9,
    'oct': 10,
    'nov': 11,
    'dec': 12,
  };
  for (final entry in months.entries) {
    if (word.startsWith(entry.key)) return entry.value;
  }
  return 1;
}

/// Cuts a value to what the record that stores it holds. A CV is a document
/// someone else wrote: nothing read out of it is sent on at whatever length it
/// happened to be.
String _cut(String s, int runes) {
  final r = s.runes.toList(growable: false);
  return r.length <= runes ? s : String.fromCharCodes(r.take(runes));
}

/// Trims a line, drops its bullet glyph and collapses inner spaces.
String _clean(String s) =>
    s.replaceFirst(_bullet, '').trim().replaceAll(_spaces, ' ');

/// Lower-cases and strips accents, for keyword matching only.
String _fold(String s) {
  const from = 'àáâãäåçèéêëìíîïñòóôõöùúûüýÿ';
  const to = 'aaaaaaceeeeiiiinooooouuuuyy';
  final buffer = StringBuffer();
  for (final rune in s.toLowerCase().runes) {
    final ch = String.fromCharCode(rune);
    final at = from.indexOf(ch);
    buffer.write(at < 0 ? ch : to[at]);
  }
  return buffer.toString().replaceAll('’', "'");
}
