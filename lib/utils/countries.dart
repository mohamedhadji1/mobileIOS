/// Every country a worker can hold the nationality of, English short name ->
/// ISO 3166-1 alpha-2 code.
///
/// ISO 3166-1 minus the seven uninhabited territories nobody is a national of
/// (AQ, BV, HM, UM, TF, GS, IO), plus Kosovo (XK: user-assigned, but printed on
/// real passports). Written in code order so a gap is easy to spot; the picker
/// reads [kCountryList], which is sorted by name.
///
/// The NAME is what EnrollWorker stores, and the backend dedupes workers on
/// (surname, given names, nationality). Renaming an entry would split workers
/// already enrolled under the old spelling from new ones, so spellings stay put.
const Map<String, String> kCountries = {
  'Andorra': 'AD',
  'United Arab Emirates': 'AE',
  'Afghanistan': 'AF',
  'Antigua and Barbuda': 'AG',
  'Anguilla': 'AI',
  'Albania': 'AL',
  'Armenia': 'AM',
  'Angola': 'AO',
  'Argentina': 'AR',
  'American Samoa': 'AS',
  'Austria': 'AT',
  'Australia': 'AU',
  'Aruba': 'AW',
  'Åland Islands': 'AX',
  'Azerbaijan': 'AZ',
  'Bosnia and Herzegovina': 'BA',
  'Barbados': 'BB',
  'Bangladesh': 'BD',
  'Belgium': 'BE',
  'Burkina Faso': 'BF',
  'Bulgaria': 'BG',
  'Bahrain': 'BH',
  'Burundi': 'BI',
  'Benin': 'BJ',
  'Saint Barthélemy': 'BL',
  'Bermuda': 'BM',
  'Brunei': 'BN',
  'Bolivia': 'BO',
  'Caribbean Netherlands': 'BQ',
  'Brazil': 'BR',
  'Bahamas': 'BS',
  'Bhutan': 'BT',
  'Botswana': 'BW',
  'Belarus': 'BY',
  'Belize': 'BZ',
  'Canada': 'CA',
  'Cocos (Keeling) Islands': 'CC',
  'Democratic Republic of the Congo': 'CD',
  'Central African Republic': 'CF',
  'Republic of the Congo': 'CG',
  'Switzerland': 'CH',
  "Côte d'Ivoire": 'CI',
  'Cook Islands': 'CK',
  'Chile': 'CL',
  'Cameroon': 'CM',
  'China': 'CN',
  'Colombia': 'CO',
  'Costa Rica': 'CR',
  'Cuba': 'CU',
  'Cape Verde': 'CV',
  'Curaçao': 'CW',
  'Christmas Island': 'CX',
  'Cyprus': 'CY',
  'Czechia': 'CZ',
  'Germany': 'DE',
  'Djibouti': 'DJ',
  'Denmark': 'DK',
  'Dominica': 'DM',
  'Dominican Republic': 'DO',
  'Algeria': 'DZ',
  'Ecuador': 'EC',
  'Estonia': 'EE',
  'Egypt': 'EG',
  'Western Sahara': 'EH',
  'Eritrea': 'ER',
  'Spain': 'ES',
  'Ethiopia': 'ET',
  'Finland': 'FI',
  'Fiji': 'FJ',
  'Falkland Islands': 'FK',
  'Micronesia': 'FM',
  'Faroe Islands': 'FO',
  'France': 'FR',
  'Gabon': 'GA',
  'United Kingdom': 'GB',
  'Grenada': 'GD',
  'Georgia': 'GE',
  'French Guiana': 'GF',
  'Guernsey': 'GG',
  'Ghana': 'GH',
  'Gibraltar': 'GI',
  'Greenland': 'GL',
  'Gambia': 'GM',
  'Guinea': 'GN',
  'Guadeloupe': 'GP',
  'Equatorial Guinea': 'GQ',
  'Greece': 'GR',
  'Guatemala': 'GT',
  'Guam': 'GU',
  'Guinea-Bissau': 'GW',
  'Guyana': 'GY',
  'Hong Kong': 'HK',
  'Honduras': 'HN',
  'Croatia': 'HR',
  'Haiti': 'HT',
  'Hungary': 'HU',
  'Indonesia': 'ID',
  'Ireland': 'IE',
  'Israel': 'IL',
  'Isle of Man': 'IM',
  'India': 'IN',
  'Iraq': 'IQ',
  'Iran': 'IR',
  'Iceland': 'IS',
  'Italy': 'IT',
  'Jersey': 'JE',
  'Jamaica': 'JM',
  'Jordan': 'JO',
  'Japan': 'JP',
  'Kenya': 'KE',
  'Kyrgyzstan': 'KG',
  'Cambodia': 'KH',
  'Kiribati': 'KI',
  'Comoros': 'KM',
  'Saint Kitts and Nevis': 'KN',
  'North Korea': 'KP',
  'South Korea': 'KR',
  'Kuwait': 'KW',
  'Cayman Islands': 'KY',
  'Kazakhstan': 'KZ',
  'Laos': 'LA',
  'Lebanon': 'LB',
  'Saint Lucia': 'LC',
  'Liechtenstein': 'LI',
  'Sri Lanka': 'LK',
  'Liberia': 'LR',
  'Lesotho': 'LS',
  'Lithuania': 'LT',
  'Luxembourg': 'LU',
  'Latvia': 'LV',
  'Libya': 'LY',
  'Morocco': 'MA',
  'Monaco': 'MC',
  'Moldova': 'MD',
  'Montenegro': 'ME',
  'Saint Martin': 'MF',
  'Madagascar': 'MG',
  'Marshall Islands': 'MH',
  'North Macedonia': 'MK',
  'Mali': 'ML',
  'Myanmar': 'MM',
  'Mongolia': 'MN',
  'Macao': 'MO',
  'Northern Mariana Islands': 'MP',
  'Martinique': 'MQ',
  'Mauritania': 'MR',
  'Montserrat': 'MS',
  'Malta': 'MT',
  'Mauritius': 'MU',
  'Maldives': 'MV',
  'Malawi': 'MW',
  'Mexico': 'MX',
  'Malaysia': 'MY',
  'Mozambique': 'MZ',
  'Namibia': 'NA',
  'New Caledonia': 'NC',
  'Niger': 'NE',
  'Norfolk Island': 'NF',
  'Nigeria': 'NG',
  'Nicaragua': 'NI',
  'Netherlands': 'NL',
  'Norway': 'NO',
  'Nepal': 'NP',
  'Nauru': 'NR',
  'Niue': 'NU',
  'New Zealand': 'NZ',
  'Oman': 'OM',
  'Panama': 'PA',
  'Peru': 'PE',
  'French Polynesia': 'PF',
  'Papua New Guinea': 'PG',
  'Philippines': 'PH',
  'Pakistan': 'PK',
  'Poland': 'PL',
  'Saint Pierre and Miquelon': 'PM',
  'Pitcairn Islands': 'PN',
  'Puerto Rico': 'PR',
  'Palestine': 'PS',
  'Portugal': 'PT',
  'Palau': 'PW',
  'Paraguay': 'PY',
  'Qatar': 'QA',
  'Réunion': 'RE',
  'Romania': 'RO',
  'Serbia': 'RS',
  'Russia': 'RU',
  'Rwanda': 'RW',
  'Saudi Arabia': 'SA',
  'Solomon Islands': 'SB',
  'Seychelles': 'SC',
  'Sudan': 'SD',
  'Sweden': 'SE',
  'Singapore': 'SG',
  'Saint Helena': 'SH',
  'Slovenia': 'SI',
  'Svalbard and Jan Mayen': 'SJ',
  'Slovakia': 'SK',
  'Sierra Leone': 'SL',
  'San Marino': 'SM',
  'Senegal': 'SN',
  'Somalia': 'SO',
  'Suriname': 'SR',
  'South Sudan': 'SS',
  'São Tomé and Príncipe': 'ST',
  'El Salvador': 'SV',
  'Sint Maarten': 'SX',
  'Syria': 'SY',
  'Eswatini': 'SZ',
  'Turks and Caicos Islands': 'TC',
  'Chad': 'TD',
  'Togo': 'TG',
  'Thailand': 'TH',
  'Tajikistan': 'TJ',
  'Tokelau': 'TK',
  'Timor-Leste': 'TL',
  'Turkmenistan': 'TM',
  'Tunisia': 'TN',
  'Tonga': 'TO',
  'Türkiye': 'TR',
  'Trinidad and Tobago': 'TT',
  'Tuvalu': 'TV',
  'Taiwan': 'TW',
  'Tanzania': 'TZ',
  'Ukraine': 'UA',
  'Uganda': 'UG',
  'United States': 'US',
  'Uruguay': 'UY',
  'Uzbekistan': 'UZ',
  'Vatican City': 'VA',
  'Saint Vincent and the Grenadines': 'VC',
  'Venezuela': 'VE',
  'British Virgin Islands': 'VG',
  'U.S. Virgin Islands': 'VI',
  'Vietnam': 'VN',
  'Vanuatu': 'VU',
  'Wallis and Futuna': 'WF',
  'Samoa': 'WS',
  'Kosovo': 'XK',
  'Yemen': 'YE',
  'Mayotte': 'YT',
  'South Africa': 'ZA',
  'Zambia': 'ZM',
  'Zimbabwe': 'ZW',
};

/// Names people actually type that the list spells differently, by ISO code.
/// Already folded (see [foldCountry]).
const Map<String, List<String>> _aliases = {
  'US': ['usa', 'america', 'united states of america'],
  'GB': ['uk', 'britain', 'great britain', 'england', 'scotland', 'wales'],
  'AE': ['uae', 'emirates'],
  'CD': ['drc', 'congo kinshasa', 'zaire'],
  'CG': ['congo brazzaville'],
  'CI': ['ivory coast'],
  'CV': ['cabo verde'],
  'CZ': ['czech republic'],
  'MM': ['burma'],
  'NL': ['holland'],
  'SZ': ['swaziland'],
  'TL': ['east timor'],
  'TR': ['turkey'],
  'VA': ['holy see'],
  'VN': ['viet nam'],
};

const _accented = 'àáâãäåçèéêëìíîïñòóôõöùúûüýÿ';
const _plain = 'aaaaaaceeeeiiiinooooouuuuyy';

/// Lowercase, accents stripped, hyphens as spaces, other punctuation dropped:
/// "Côte d'Ivoire" -> "cote divoire", "Timor-Leste" -> "timor leste".
/// Workers type on phone keyboards and rarely reach for an accent.
String foldCountry(String s) {
  final buf = StringBuffer();
  for (final ch in s.toLowerCase().split('')) {
    final i = _accented.indexOf(ch);
    buf.write(i >= 0 ? _plain[i] : ch);
  }
  return buf
      .toString()
      .replaceAll('-', ' ')
      .replaceAll(RegExp(r'[^a-z0-9 ]'), '')
      .replaceAll(RegExp(r' +'), ' ')
      .trim();
}

/// [kCountries] in alphabetical order. Sorted on the folded name, so "Åland
/// Islands" sits next to "Albania" instead of after "Zimbabwe".
final List<MapEntry<String, String>> kCountryList = List.unmodifiable(
  kCountries.entries.toList()
    ..sort((a, b) => foldCountry(a.key).compareTo(foldCountry(b.key))),
);

/// Search terms per ISO code, folded once rather than on every keystroke.
final Map<String, List<String>> _terms = {
  for (final c in kCountryList)
    c.value: [foldCountry(c.key), ...?_aliases[c.value]],
};

/// Countries matching [query], best matches first.
///
/// First: the ISO code typed exactly ("tn"), or a name or alias with a word
/// starting with the query ("korea" -> North Korea, South Korea). Then any
/// name containing it. Alphabetical within each group. Empty query -> all.
List<MapEntry<String, String>> searchCountries(String query) {
  final q = foldCountry(query);
  if (q.isEmpty) return kCountryList;
  final strong = <MapEntry<String, String>>[];
  final weak = <MapEntry<String, String>>[];
  for (final c in kCountryList) {
    final terms = _terms[c.value]!;
    if (c.value.toLowerCase() == q ||
        terms.any((t) => t.startsWith(q) || t.contains(' $q'))) {
      strong.add(c);
    } else if (terms.any((t) => t.contains(q))) {
      weak.add(c);
    }
  }
  return [...strong, ...weak];
}

/// Flag emoji from an ISO alpha-2 code ("TN" -> regional indicators T + N).
/// Composed at runtime so no emoji literals sit in source (they corrupt on
/// save). Kosovo gets none: XK is not a standard flag emoji, and phones draw it
/// as two boxed letters.
String countryFlag(String iso2) => iso2.length != 2 || iso2 == 'XK'
    ? ''
    : iso2
        .toUpperCase()
        .codeUnits
        .map((c) => String.fromCharCode(0x1F1E6 + c - 0x41))
        .join();
