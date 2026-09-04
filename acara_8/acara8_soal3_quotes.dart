import 'dart:io';

void main() {
  print("=========================================");
  print("      ACARA 8 - SOAL 3 (QUOTES HARIAN)   ");
  print("=========================================");

  stdout.write("Masukkan Hari (Senin - Minggu): ");
  String hari = stdin.readLineSync()!;

  print("");

  // Evaluasi input hari menggunakan Switch Case
  switch (hari.toLowerCase()) {
    case 'senin':
      print("Segala sesuatu memiliki kesudahan, yang sudah berakhir biarlah berlalu dan yakinlah semua akan baik-baik saja.");
      break;
    case 'selasa':
      print("Setiap detik sangatlah berharga karena waktu diputar kembali dan meragukan akan membuang waktu.");
      break;
    case 'rabu':
      print("Jika kamu tak menemukan buku yang kamu cari di rak, maka tulislah sendiri.");
      break;
    case 'kamis':
      print("Jika kamu bisa bermimpi, kamu bisa mewujudkannya.");
      break;
    case 'jumat':
      print("Senyuman adalah cara terbaik untuk menghadapi setiap masalah, menghancurkan setiap rasa takut dan menyembunyikan setiap rasa sakit.");
      break;
    case 'sabtu':
      print("Rumah bukan hanya tempat bersandar, tapi tempat di mana kita bisa kembali.");
      break;
    case 'minggu':
      print("Hanya satu hal yang membuat impian tidak mungkin dicapai: ketakutan akan kegagalan.");
      break;
    default:
      print("Hari yang kamu masukkan tidak valid!");
  }

  print("=========================================");
}