import 'dart:io';

void main() {
  print("ACARA 8 - SOAL 1 (TERNARY)");

  // Meminta masukan dari pengguna
  stdout.write("Apakah anda mau menginstall aplikasi? (Y/T): ");
  String input = stdin.readLineSync()!;

  // Pengecekan kondisi menggunakan Ternary Operator
  String output = (input.toLowerCase() == 'y') 
      ? "anda akan menginstall aplikasi dart" 
      : "aborted";

  // Menampilkan hasil
  print(output);

}