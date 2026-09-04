import 'dart:io';

void main() {
  print("=========================================");
  print("      ACARA 8 - SOAL 7A (PERSEGI PAGAR)  ");
  print("=========================================\n");

  // 7a. Membuat Persegi 4 baris x 8 kolom
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 8; j++) {
      stdout.write("#");
    }
    print("");
  }
}