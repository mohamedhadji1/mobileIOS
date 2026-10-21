import 'package:cypurge_mobile/utils/countries.dart';
import 'package:flutter_test/flutter_test.dart';

List<String> names(List<MapEntry<String, String>> list) =>
    list.map((c) => c.key).toList();

void main() {
  test('keeps every nationality spelling EnrollWorker has already stored', () {
    // The backend dedupes workers on nationality: renaming one of these would
    // split existing workers from new ones.
    const legacy = [
      'Algeria', 'France', 'United Kingdom', 'United States', 'Spain',
      'Italy', 'Germany', 'Canada', 'Japan', 'China', 'Brazil', 'Morocco',
      'Tunisia', 'Senegal', 'Panama', 'Liberia', 'Marshall Islands',
      'Singapore', 'Norway', 'Greece', 'Philippines', 'India',
    ];
    for (final name in legacy) {
      expect(kCountries.containsKey(name), isTrue, reason: name);
    }
  });

  test('243 countries, no duplicate code', () {
    expect(kCountries.length, 243);
    expect(kCountries.values.toSet().length, kCountries.length);
  });

  test('empty query lists everything alphabetically, accents included', () {
    final all = searchCountries('  ');
    expect(all.length, kCountries.length);
    expect(names(all).take(3), ['Afghanistan', 'Åland Islands', 'Albania']);
    expect(all.last.key, 'Zimbabwe');
  });

  test('search ignores case, accents and punctuation', () {
    expect(names(searchCountries('COTE')), contains("Côte d'Ivoire"));
    expect(names(searchCountries("cote d'ivoire")), ["Côte d'Ivoire"]);
    expect(names(searchCountries('sao tome')), ['São Tomé and Príncipe']);
    expect(names(searchCountries('timor leste')), ['Timor-Leste']);
  });

  test('prefix and word-start matches come before substring matches', () {
    expect(names(searchCountries('in')).take(2), ['India', 'Indonesia']);
    expect(names(searchCountries('korea')), ['North Korea', 'South Korea']);
  });

  test('ISO codes and common other names find the country', () {
    expect(searchCountries('tn').first.key, 'Tunisia');
    expect(names(searchCountries('turkey')), ['Türkiye']);
    expect(names(searchCountries('uk')), contains('United Kingdom'));
    expect(names(searchCountries('ivory coast')), ["Côte d'Ivoire"]);
  });

  test('no match is an empty list', () {
    expect(searchCountries('zzzz'), isEmpty);
  });

  test('flags: two regional indicators, none for Kosovo', () {
    expect(countryFlag('TN').runes.length, 2);
    expect(countryFlag('XK'), '');
    expect(countryFlag(''), '');
  });
}
