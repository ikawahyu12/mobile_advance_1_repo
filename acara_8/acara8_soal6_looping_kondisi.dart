void main() {
  print("=========================================");
  print("      ACARA 8 - SOAL 6 (LOOPING KONDISI) ");
  print("=========================================\n");

  for (int i = 1; i <= 20; i++) {
    if (i % 2 != 0 && i % 3 == 0) {
      print("$i - I Love Coding");
    } else if (i % 2 == 0) {
      print("$i - Berkualitas");
    } else {
      print("$i - Santai");
    }
  }

  print("=========================================");
}