class SundaTranslator {
  // Peta konversi Latin ke Aksara Sunda Unicode
  final Map<String, String> UNISUNDA = {
    '+ng': '\u1B80',
    '+r': '\u1B81',
    '+h': '\u1B82',
    '+O': '\u1BAA',
    'A': '\u1B83',
    'I': '\u1B84',
    'U': '\u1B85',
    '\u00C9': '\u1B86',
    'O': '\u1B87',
    'E': '\u1B88',
    'EU': '\u1B89',
    'k': '\u1B8A',
    'q': '\u1B8B',
    'g': '\u1B8C',
    'ng': '\u1B8D',
    'c': '\u1B8E',
    'j': '\u1B8F',
    'z': '\u1B90',
    'ny': '\u1B91',
    't': '\u1B92',
    'd': '\u1B93',
    'n': '\u1B94',
    'p': '\u1B95',
    'f': '\u1B96',
    'v': '\u1B97',
    'b': '\u1B98',
    'm': '\u1B99',
    'y': '\u1B9A',
    'r': '\u1B9B',
    'l': '\u1B9C',
    'w': '\u1B9D',
    's': '\u1B9E',
    'x': '\u1B9F',
    'h': '\u1BA0',
    'kh': '\u1BAE',
    'sy': '\u1BAF',
    '+ya': '\u1BA1',
    '+ra': '\u1BA2',
    '+la': '\u1BA3',
    'a': '',
    'i': '\u1BA4',
    'u': '\u1BA5',
    '\u00E9': '\u1BA6',
    'o': '\u1BA7',
    'e': '\u1BA8',
    'eu': '\u1BA9',
    '0': '\u1BB0',
    '1': '\u1BB1',
    '2': '\u1BB2',
    '3': '\u1BB3',
    '4': '\u1BB4',
    '5': '\u1BB5',
    '6': '\u1BB6',
    '7': '\u1BB7',
    '8': '\u1BB8',
    '9': '\u1BB9',
  };

  final String KONS = r'kh|sy|[b-df-hj-mp-tv-z]|ng|ny|n';
  final String VOK = r'[aiuo\u00E9]|eu|e';
  final String REP = r'[yrl]';
  final String DIGIT = r'^([0-9]+)';

  String sundaAkhir(String huruf) {
    if (huruf == 'h' || huruf == 'r' || huruf == 'ng') {
      return UNISUNDA['+' + huruf]!;
    } else {
      return UNISUNDA[huruf]! + UNISUNDA['+O']!;
    }
  }

  String latin2Sunda(String iStr) {
    iStr = iStr.toLowerCase();
    String oStr = '';
    RegExp silabaExp = RegExp(
        '^($KONS)?($REP)?($VOK)($KONS)?($VOK|$REP)?'); // Regex pattern

    while (iStr.isNotEmpty) {
      String suku = '';
      RegExpMatch? match = silabaExp.firstMatch(iStr);

      if (match != null) {
        String? group1 = match.group(1); // K
        String? group2 = match.group(2); // R
        String? group3 = match.group(3); // V
        String? group4 = match.group(4); // K
        String? group5 = match.group(5); // V|R

        // Proses berdasarkan pola suku
        if (group1 != null && group4 != null && group2 != null && group5 != null) {
          suku = group1 + group2 + group3! + group4;
          oStr += UNISUNDA[group1]! + UNISUNDA['+' + group2 + 'a']! + UNISUNDA[group3]! + sundaAkhir(group4);
        } else if (group1 != null && group2 != null) {
          suku = group1 + group2 + group3!;
          oStr += UNISUNDA[group1]! + UNISUNDA['+' + group2 + 'a']! + UNISUNDA[group3]!;
        } else if (group1 != null && group4 != null) {
          suku = group1 + group3! + group4;
          oStr += UNISUNDA[group1]! + UNISUNDA[group3]! + sundaAkhir(group4);
        } else if (group1 != null) {
          suku = group1 + group3!;
          oStr += UNISUNDA[group1]! + UNISUNDA[group3]!;
        } else if (group4 != null) {
          suku = group3! + group4;
          oStr += UNISUNDA[group3.toUpperCase()]! + sundaAkhir(group4);
        } else {
          suku = group3!;
          oStr += UNISUNDA[suku.toUpperCase()]!;
        }

        iStr = iStr.substring(suku.length);
      } else {
        // Cek jika ada digit
        final digitMatch = RegExp(DIGIT).firstMatch(iStr);
        if (digitMatch != null) {
          suku = digitMatch.group(1)!;
          for (int i = 0; i < suku.length; i++) {
            oStr += UNISUNDA[suku[i]]!;
          }
          iStr = iStr.substring(suku.length);
        } else {
          // Karakter lain (spasi, tanda baca, dll)
          oStr += iStr[0];
          iStr = iStr.substring(1);
        }
      }
    }

    return oStr;
  }
}

void main() {
  SundaTranslator translator = SundaTranslator();
  String hasil = translator.latin2Sunda("hidup dewasa itu tidak menyenangkan");
  print(hasil);
}
