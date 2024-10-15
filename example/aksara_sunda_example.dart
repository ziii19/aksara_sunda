// import '../lib/aksara_sunda.dart';
// import '../lib/sunda_3.dart';

// void main(List<String> args) {
//   var teks = AksaraSunda().sundaToLatin('ᮠᮜ᮪ ᮓᮥᮔ᮪');
//   SundaTranslator translator = SundaTranslator();
//   String hasil = translator.latin2Sunda("Sunda ngaran abdi 123");
//   String teks1 = 'ini perubahan 1';

//   print(hasil);

//   print(teks);
// }

import 'dart:convert'; // Untuk decoding JSON
import 'package:http/http.dart' as http; // Tambahkan package http

const String baseUrl = 'https://api-transliterasi.vercel.app';

// Fungsi untuk memanggil API Latin ke Aksara Sunda
Future<void> latinToSunda(String text) async {
  final url = Uri.parse('$baseUrl/latin-to-sunda?text=$text');

  try {
    // Mengirim request GET ke API
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // Jika berhasil, ambil hasil JSON dan decode
      final data = jsonDecode(response.body);
      sundaToLatin(data['converted']); // Hasil konversi ke Latin
      print('Original Text: ${data['original']}'); // Teks asli
      print(
          'Converted Text: ${data['converted']}'); // Hasil konversi ke Aksara Sunda
    } else {
      print(response.body);
      // Jika error
      throw Exception('Failed to load data');
    }
  } catch (e) {
    print('Error: $e');
  }
}

Future<void> sundaToLatin(String text) async {
  final url = Uri.parse('$baseUrl/sunda-to-latin?text=$text');

  try {
    // Mengirim request GET ke API
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // Jika berhasil, ambil hasil JSON dan decode
      final data = jsonDecode(response.body);
      print('Original Text: ${data['original']}'); // Teks asli
      print(
          'Converted Text: ${data['converted']}'); // Hasil konversi ke Aksara Sunda
    } else {
      print(response.body);
      // Jika error
      throw Exception('Failed to load data');
    }
  } catch (e) {
    print('Error: $e');
  }
}

void main() async {
  // Teks Latin yang ingin dikonversi
  String text = 'aku juga manusia biasa yang bisa melakukan kesalahan, aku bukan manusia sempurna';

  // Memanggil fungsi untuk mengonversi teks
  await latinToSunda(text);
}
