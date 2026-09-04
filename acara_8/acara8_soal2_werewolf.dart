import 'dart:io';

void main() {
  print("ACARA 8 - SOAL 2 (GAME WEREWOLF)");

  stdout.write("Masukkan Nama  : ");
  String nama = stdin.readLineSync()!;

  stdout.write("Masukkan Peran (Ksatria/Tabib/Werewolf): ");
  String peran = stdin.readLineSync()!;

  print("");

  // Pengecekan kondisi sesuai aturan game
  if (nama.isEmpty) {
    print("Nama harus diisi!");
  } else if (peran.isEmpty) {
    print("Halo $nama, Pilih peranmu untuk memulai game!");
  } else {
    print("Selamat datang di Dunia Werewolf, $nama");

    if (peran.toLowerCase() == "ksatria") {
      print("Halo Ksatria $nama, kamu dapat menyerang dengan senjatamu!");
    } else if (peran.toLowerCase() == "tabib") {
      print("Halo Tabib $nama, kamu akan menyembuhkan temanmu yang terluka.");
    } else if (peran.toLowerCase() == "werewolf") {
      print("Halo Werewolf $nama, kamu akan memakan mangsa setiap malam!");
    } else {
      print("Halo $nama, peran yang kamu pilih tidak tersedia!");
    }
  }
}