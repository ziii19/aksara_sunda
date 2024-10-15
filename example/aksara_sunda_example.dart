import 'package:aksara_sunda/aksara_sunda.dart';
import 'package:aksara_sunda/aksara_sunda_2.dart';

void main(List<String> args) {
  var teks = AksaraSunda().sundaToLatin('ᮠᮜ᮪ ᮓᮥᮔ᮪');
  SundaTranslator translator = SundaTranslator();
  String hasil = translator.latin2Sunda("Sunda ngaran abdi 123");
  String teks11 = 'ini perubahan ku';
  String teks12 = 'ini perubahan ku';
  String teks13 = 'ini perubahan ku';

  print(hasil);

  print(teks);
}
