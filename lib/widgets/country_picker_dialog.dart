import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../theme/app_widgets.dart';
import '../utils/countries.dart';

/// Opens the country picker: every country, a search box on top. Resolves to
/// the chosen country's name, or null on Cancel.
///
/// A modal rather than a flyout under the field: the flyout rendered into the
/// keyboard and could not be reached (see SignUpFormScreen._pickNationality).
Future<String?> showCountryPicker(BuildContext context, {String? selected}) {
  // A text field above may still hold focus; its keyboard would cover the
  // bottom of the dialog before the worker ever touches the search box.
  FocusManager.instance.primaryFocus?.unfocus();
  return showDialog<String>(
    context: context,
    builder: (_) => _CountryPickerDialog(selected: selected),
  );
}

class _CountryPickerDialog extends StatefulWidget {
  const _CountryPickerDialog({this.selected});

  final String? selected;

  @override
  State<_CountryPickerDialog> createState() => _CountryPickerDialogState();
}

class _CountryPickerDialogState extends State<_CountryPickerDialog> {
  String _query = '';
  List<MapEntry<String, String>> _results = kCountryList;

  void _search(String query) => setState(() {
        _query = query;
        _results = searchCountries(query);
      });

  @override
  Widget build(BuildContext context) {
    // The dialog moves up for the keyboard the search box raises, and the
    // Flexible list gives up whatever height that costs.
    return AlertDialog(
      constraints: const BoxConstraints(maxWidth: 420, maxHeight: 560),
      title: const Text('Select nationality'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          WTFloatField(
            label: 'Search country',
            icon: Icons.search_rounded,
            onChanged: _search,
            textInputAction: TextInputAction.search,
            // One match left: the keyboard's search key picks it.
            onFieldSubmitted: (_) {
              if (_results.length == 1) {
                Navigator.pop(context, _results.first.key);
              }
            },
          ),
          const SizedBox(height: 8),
          Flexible(
            child: SizedBox(
              // A fixed width answers AlertDialog's intrinsic-width question
              // without asking the ListView, which cannot. The dialog's
              // maxWidth then caps it.
              width: double.maxFinite,
              height: 380,
              child: _results.isEmpty
                  ? Center(
                      child: Text(
                        'No country matches "${_query.trim()}"',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppTheme.muted),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _results.length,
                      itemBuilder: (_, i) => _row(_results[i]),
                    ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
      ],
    );
  }

  Widget _row(MapEntry<String, String> country) {
    final isSelected = widget.selected == country.key;
    return MergeSemantics(
        child: Semantics(
            button: true,
            selected: isSelected,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => Navigator.pop(context, country.key),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppTheme.accent.withValues(alpha: 0.10)
                      : null,
                  borderRadius: BorderRadius.circular(AppTheme.rSm),
                ),
                child: Row(
                  children: [
                    // Fixed slot: a country without a flag (Kosovo) keeps its name
                    // aligned with the rest.
                    SizedBox(
                      width: 30,
                      child: Text(countryFlag(country.value),
                          style: const TextStyle(fontSize: 18)),
                    ),
                    Expanded(
                      child: Text(
                        country.key,
                        style: TextStyle(
                          color: AppTheme.ink,
                          fontWeight:
                              isSelected ? FontWeight.w600 : FontWeight.normal,
                        ),
                      ),
                    ),
                    if (isSelected)
                      Icon(Icons.check_rounded,
                          color: AppTheme.accent, size: 14),
                  ],
                ),
              ),
            )));
  }
}
