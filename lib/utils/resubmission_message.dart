/// The dashboard ↔ app contract for "which documents to re-upload".
///
/// `REVERIFICATION_DUE` push data carries no document list (and an older
/// backend's `ReverificationRequest` neither), so the dashboard writes it into
/// the message text in one fixed shape:
///
///     Re-upload: Driving License (Back), PASSPORT. Photo is blurred.
///
/// NextJs/src/components/HRPortal/sendBack.ts writes it; this parses it. Change
/// both or neither. The list ends at the first ". " (or a trailing "."), so
/// document labels must not contain ". ".
///
/// ponytail: text-encoded doc list. ReverificationRequest now carries
/// flagged_documents (preferred by ReVerifyService); drop this once the push
/// payload carries it too.
const kResubmitPrefix = 'Re-upload: ';

/// The analyst's own words from [text], without the leading document list.
///
/// The list is already drawn as rows on the re-upload screen; repeating it as
/// "Re-upload: Passport, Work permit." above those rows reads like a wire format.
/// Text without the prefix comes back trimmed and otherwise untouched.
String resubmissionNote(String text) {
  final t = text.trim();
  if (!t.startsWith(kResubmitPrefix)) return t;
  final rest = t.substring(kResubmitPrefix.length);
  final end = rest.indexOf(RegExp(r'\.(\s|$)'));
  return end < 0 ? '' : rest.substring(end + 1).trim();
}

/// Document labels named in [text], or empty when it does not carry the prefix.
List<String> parseFlaggedDocuments(String text) {
  final t = text.trimLeft();
  if (!t.startsWith(kResubmitPrefix)) return const [];
  final rest = t.substring(kResubmitPrefix.length);
  final end = rest.indexOf(RegExp(r'\.(\s|$)'));
  final listPart = end < 0 ? rest : rest.substring(0, end);
  return listPart
      .split(',')
      .map((s) => s.trim())
      .where((s) => s.isNotEmpty)
      .toList(growable: false);
}
