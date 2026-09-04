class Segitiga {
  double alas = 0;
  double tinggi = 0;

  double hitungLuas() {
    return 0.5 * alas * tinggi;
  }
}

void main() {
  Segitiga segitiga = Segitiga();
  segitiga.alas = 20.0;
  segitiga.tinggi = 30.0;

  print(segitiga.hitungLuas());
}