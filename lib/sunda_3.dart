class SundaTranslator {
  static final Map<String, String> latinToSunda = {
    'a': '\u1B83',
    'i': '\u1B84',
    'u': '\u1B85',
    '\u00E9': '\u1B86',
    'e': '\u1BA8',
    'eu': '\u1BA9',
    'o': '\u1B87',
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
  };

  static final Map<String, String> sundaToLatin = {
    '\u1B8A': 'k',
    '\u1B8B': 'q',
    '\u1B8C': 'g',
    '\u1B8D': 'ng',
    '\u1B8E': 'c',
    '\u1B8F': 'j',
    '\u1B90': 'z',
    '\u1B91': 'ny',
    '\u1B92': 't',
    '\u1B93': 'd',
    '\u1B94': 'n',
    '\u1B95': 'p',
    '\u1B96': 'f',
    '\u1B97': 'v',
    '\u1B98': 'b',
    '\u1B99': 'm',
    '\u1B9A': 'y',
    '\u1B9B': 'r',
    '\u1B9C': 'l',
    '\u1B9D': 'w',
    '\u1B9E': 's',
    '\u1B9F': 'x',
    '\u1BA0': 'h',
    '\u1BAE': 'kh',
    '\u1BAF': 'sy',
    '\u1BA4': 'i',
    '\u1BA5': 'u',
    '\u1BA6': '\u00E9',
    '\u1BA7': 'o',
    '\u1BA8': 'e',
    '\u1BA9': 'eu',
    '\u1B83': 'a',
    '\u1B84': 'i',
    '\u1B85': 'u',
    '\u1B86': '\u00E9',
    '\u1B87': 'o',
    '\u1B88': 'e',
    '\u1B89': 'eu',
    '\u1BA1': 'y',
    '\u1BA2': 'r',
    '\u1BA3': 'l',
    '\u1B80': 'ng',
    '\u1B81': 'r',
    '\u1B82': 'h',
    '\u1BB0': '0',
    '\u1BB1': '1',
    '\u1BB2': '2',
    '\u1BB3': '3',
    '\u1BB4': '4',
    '\u1BB5': '5',
    '\u1BB6': '6',
    '\u1BB7': '7',
    '\u1BB8': '8',
    '\u1BB9': '9',
  };

  int PAT_V = 1;
  int PAT_VK = 2;
  int PAT_KV = 3;
  int PAT_KVK = 4;
  int PAT_KRV = 5;
  int PAT_KRVK = 6;
  int PAT_SILABA = 7;
  int PAT_LAIN = 0;
  String latin2Sunda(String iStr) {
    var sunda = '';

    iStr = iStr.toLowerCase();

    var iLength = iStr.length;
    var idx = 0;
    var jump = 0;

    var tStr = '';
    var oStr = '';
    var r, silaba, suku;
    var polasuku = PAT_LAIN;

    var KONS = 'kh|sy|[b-df-hj-mp-tv-z]|ng|ny|n';
    var VOK = "[aiuo\u00E9]|eu|e";
    //VOK  = '[aiuo�]|eu|e';
    var REP = '[yrl]';
    var SILABA = '^';
    SILABA += '(' + KONS + ')?'; // group(1), K
    SILABA += '(' + REP + ')?'; // group(2), R
    SILABA += '(' + VOK + ')'; // group(3), V
    SILABA += '(' + KONS + ')?'; // group(4), K
    SILABA += '(' + VOK + '|' + REP + ')?';

    var KONSONAN = '^(' + KONS + ')';
    var DIGIT = '^([0-9]+)';

    while (idx < iLength) {
      suku = '';
      r = iStr.matchAsPrefix(SILABA);

      if (r != null) {
        if (r[1]) {
          // != undefined) {
          if (r[4]) {
            // != undefined) {
            if (r[2]) {
              // != undefined) {
              if (r[5]) {
                // != undefined) {
                polasuku = PAT_KRV;
              } else {
                polasuku = PAT_KRVK;
              }
            } else {
              if (r[5]) {
                // != undefined) {
                polasuku = PAT_KV;
              } else {
                polasuku = PAT_KVK;
              }
            }
          } else {
            if (r[2]) {
              // != undefined) {
              polasuku = PAT_KRV;
            } else {
              polasuku = PAT_KV;
            }
          }
        } else {
          if (r[4]) {
            // != undefined) {
            if (r[5]) {
              // != undefined) {
              polasuku = PAT_V;
            } else {
              polasuku = PAT_VK;
            }
          } else {
            polasuku = PAT_V;
          }
        }


        if (polasuku == PAT_KRVK) {
                suku = r[1] + r[2] + r[3] + r[4];
                silaba  = latinToSunda[r[1]];
                silaba += latinToSunda['+' + r[2] + 'a'];
                silaba += latinToSunda[r[3]];
                silaba += sundaahir(r[4]);
            } else if (polasuku == PAT_KRV) {
                suku = r[1] + r[2] + r[3];
                silaba  = latinToSunda[r[1]];
                silaba += latinToSunda['+' + r[2] + 'a'];
                silaba += latinToSunda[r[3]];
            } else if (polasuku == PAT_KVK) {
                suku = r[1] + r[3] + r[4];
                silaba  = latinToSunda[r[1]];
                silaba += latinToSunda[r[3]];
                silaba += sundaahir(r[4]);
            } else if (polasuku == PAT_KV) {
                suku = r[1] + r[3];
                silaba  = latinToSunda[r[1]];
                silaba += latinToSunda[r[3]];
            } else if (polasuku == PAT_VK) {
                suku = r[3] + r[4];
                silaba  = latinToSunda[r[3].toUpperCase()];
                silaba += sundaahir(r[4]);
            } else {
                suku = r[3];
                silaba = latinToSunda[suku.toUpperCase()];
            } // end if
            oStr += silaba //+ ':'
            tStr += suku + '(' + polasuku + '):';
            polasuku = PAT_SILABA;
        } else {
            r = iStr.matchAsPrefix(KONSONAN);
            if (r != null) {
                suku   = r[1];
                if (polasuku == PAT_SILABA)
                {
                    silaba = sundaahir(suku);
                } else {
                    silaba = latinToSunda[suku]! + latinToSunda['+O']!;
                }
                oStr += silaba;
                tStr += suku + ";";
            } else {
                r = iStr.matchAsPrefix(DIGIT);
                if (r != null) {
                    silaba = '|';
                    suku = r[1];
                   int l = suku.length;
                   int i = 0;
                    while (i<l) {
                        silaba += latinToSunda[suku.subString(i,1)];
                        i += 1;
                    } //end while
                    silaba += '|';
                    oStr += silaba;
                } else {
                    suku = iStr.substring(0,1);
                    silaba = suku;
                    oStr += suku;
                }
                //end if
                tStr += suku + '(?)';
            } // end if
            polasuku = PAT_LAIN;
        }// end if
        iStr = iStr.substring(suku.length);
        idx += suku.length;
    
    }// end while
 
    //return tStr + '&&' + oStr
    return oStr;
    //return tStr
}
  }

   String sunda2Latin(String iStr) {
    int iLength = iStr.length;
    int idx = 0;

    String oStr = '';

    String ngalagena = r'([\u1B8A-\u1BA0\u1BAE\u1BAF])';
    String vokalMandiri = r'([\u1B83-\u1B89])';
    String subjoin = r'([\u1BA1-\u1BA3])?';
    String vokal = r'([\u1BA4-\u1BAA])?';
    String tungtung = r'([\u1B80-\u1B82])?';
    String angka = r'([\u1BB0-\u1BB9])';

    RegExp krv0k = RegExp('^' + ngalagena + subjoin + vokal + tungtung);
    RegExp vk = RegExp('^' + vokalMandiri + tungtung);
    RegExp angkaRegex = RegExp('^(\\|)?' + angka + '(\\|)?');

    while (idx < iLength) {
      String suku = '';
      String silaba = '';

      RegExpMatch? r = krv0k.firstMatch(iStr);
      if (r != null) {
        suku += r[1]!;
        silaba += sundaToLatin[r[1]!] ?? '';
        if (r[2] != null) {
          suku += r[2]!;
          silaba += sundaToLatin[r[2]!] ?? '';
        }
        if (r[3] != null) {
          suku += r[3]!;
          silaba += sundaToLatin[r[3]!] ?? 'a';
        }
        if (r[4] != null) {
          suku += r[4]!;
          silaba += sundaToLatin[r[4]!] ?? '';
        }
        oStr += silaba;
      } else {
        r = vk.firstMatch(iStr);
        if (r != null) {
          suku += r[1]!;
          silaba += sundaToLatin[r[1]!] ?? '';
          if (r[2] != null) {
            suku += r[2]!;
            silaba += sundaToLatin[r[2]!] ?? '';
          }
          oStr += silaba;
        } else {
          r = angkaRegex.firstMatch(iStr);
          if (r != null) {
            suku += r[2]!;
            oStr += sundaToLatin[r[2]!] ?? '';
          } else {
            suku += iStr[0];
            oStr += suku;
          }
        }
      }
      iStr = iStr.subStringing(suku.length);
      idx += suku.length;
    }

    return oStr;
  }
}

void main(List<String> args) {
  String hasilLatinKeSunda =
      SundaTranslator.latin2Sunda("Sunda ngaran abdi 123");
  String hasilSundaKeLatin =
      SundaTranslator.sunda2Latin("ᮞᮥᮔ᮪ᮓ ᮍᮁᮃᮔ᮪ ᮃᮘ᮪ᮓᮤ ᮱᮲᮳");

  print(hasilLatinKeSunda);
  print(hasilSundaKeLatin);
}
