class AksaraSunda {
  // Transliterasi Latin ke Sunda
  String latinToSunda(String text) {
    String result = text;

    // Replace diacritics and special consonants first
    sundaConsonantsWithPamaeh.forEach((latin, sunda) {
      result = result.replaceAll(latin, sunda);
    });

    // Handle final consonants with pamaéh first
    latinToPamaeh.forEach((latin, sunda) {
      result = result.replaceAll(latin, sunda);
    });

    // Handle consonants
    latinToSundaConsonants.forEach((latin, sunda) {
      result = result.replaceAll(latin, sunda);
    });

    // Handle vowels
    latinToSundaVowels.forEach((latin, sunda) {
      result = result.replaceAll(latin, sunda);
    });

    return result;
  }

  // Transliterasi Sunda ke Latin
  String sundaToLatin(String text) {
    String result = text;

    // Handle Sundanese consonants to Latin
    sundaConsonantsToLatin.forEach((sunda, latin) {
      result = result.replaceAll(sunda, latin);
    });

    // Handle Sundanese vowels to Latin
    sundaVowelsToLatin.forEach((sunda, latin) {
      result = result.replaceAll(sunda, latin);
    });

    // Handle pamaéh diacritics
    sundaVowelMarksToLatin.forEach((sunda, latin) {
      result = result.replaceAll(sunda, latin);
    });

    return result;
  }
}

// Mapping dari Latin ke Aksara Sunda (Vokal)
const Map<String, String> latinToSundaVowels = {
  'a': 'ᮃ',
  'i': 'ᮄ',
  'u': 'ᮅ',
  'é': 'ᮆ',
  'o': 'ᮇ',
  'e': 'ᮈ',
  'eu': 'ᮉ'
};

// Mapping dari Aksara Sunda ke Latin (Vokal)
const Map<String, String> sundaVowelsToLatin = {
  'ᮃ': 'a',
  'ᮄ': 'i',
  'ᮅ': 'u',
  'ᮆ': 'é',
  'ᮇ': 'o',
  'ᮈ': 'e',
  'ᮉ': 'eu'
};

// Mapping dari Latin ke Aksara Sunda (Konsonan)
const Map<String, String> latinToSundaConsonants = {
  'ka': 'ᮊ',
  'ga': 'ᮌ',
  'nga': 'ᮍ',
  'ca': 'ᮎ',
  'ja': 'ᮏ',
  'nya': 'ᮑ',
  'ta': 'ᮒ',
  'da': 'ᮓ',
  'na': 'ᮔ',
  'pa': 'ᮕ',
  'ba': 'ᮘ',
  'ma': 'ᮙ',
  'ya': 'ᮚ',
  'ra': 'ᮛ',
  'la': 'ᮜ',
  'wa': 'ᮝ',
  'sa': 'ᮞ',
  'ha': 'ᮠ'
};

// Mapping dari Aksara Sunda ke Latin (Konsonan)
const Map<String, String> sundaConsonantsToLatin = {
  'ᮊ': 'ka',
  'ᮌ': 'ga',
  'ᮍ': 'nga',
  'ᮎ': 'ca',
  'ᮏ': 'ja',
  'ᮑ': 'nya',
  'ᮒ': 'ta',
  'ᮓ': 'da',
  'ᮔ': 'na',
  'ᮕ': 'pa',
  'ᮘ': 'ba',
  'ᮙ': 'ma',
  'ᮚ': 'ya',
  'ᮛ': 'ra',
  'ᮜ': 'la',
  'ᮝ': 'wa',
  'ᮞ': 'sa',
  'ᮠ': 'ha'
};

// Pamaéh (Tanda Penghilang Vokal) di Aksara Sunda
const Map<String, String> latinToPamaeh = {
  'm': 'ᮙ᮪',
  'b': 'ᮘ᮪',
  'n': 'ᮔ᮪',
  'g': 'ᮌ᮪',
  'd': 'ᮓ᮪',
  'r': 'ᮛ᮪'
};

// Tanda khusus (kombinasi) konsonan pamaéh
const Map<String, String> sundaConsonantsWithPamaeh = {
  'mb': 'ᮙ᮪ᮘ',
  'nd': 'ᮔ᮪ᮓ',
  'ng': 'ᮍ᮪',
  'nt': 'ᮔ᮪ᮒ',
  'ns': 'ᮔ᮪ᮞ',
  'rm': 'ᮛ᮪ᮙ',
  'rn': 'ᮛ᮪ᮔ',
  'rs': 'ᮛ᮪ᮞ'
};

// Mapping dari Aksara Sunda ke Latin (Pamaéh dan diakritik)
const Map<String, String> sundaVowelMarksToLatin = {
  'ᮧ': 'o',
  'ᮩ': 'e',
  '᮫': 'eu',
  'ᮨ': 'é',
  'ᮁ': 'r',
  'ᮂ': 'ng',
  '᮪': '' // pamaéh cancels vowel
};
