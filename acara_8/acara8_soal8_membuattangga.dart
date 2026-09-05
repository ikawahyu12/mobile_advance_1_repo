  import 'dart:io';

void main() {
  print("\n=========================================");
  print("      ACARA 8 - SOAL 7B (TANGGA PAGAR)   ");
  print("=========================================\n");

  // 7b. Membuat Tangga 7 baris
  for (int i = 1; i <= 7; i++) {
    for (int j = 0; j < i; j++) {
      stdout.write("#");
    }
    print("");
  }

  print("=========================================");
}