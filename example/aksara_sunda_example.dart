import '../lib/aksara_sunda.dart';
import '../lib/sunda_3.dart';

void main(List<String> args) {
  var teks = AksaraSunda().sundaToLatin('ᮠᮜ᮪ ᮓᮥᮔ᮪');
  SundaTranslator translator = SundaTranslator();
  String hasil = translator.latin2Sunda("Sunda ngaran abdi 123");
  String teks1 = 'ini perubahan 1';

  print(hasil);

  print(teks);
}
