import 'bangun_datar.dart';
import 'persegi.dart';
import 'segitiga.dart';
import 'lingkaran.dart';

void main() {
  BangunDatar bangun = BangunDatar();
  Persegi persegi = Persegi(4);
  Segitiga segitiga = Segitiga(3, 4);
  Lingkaran lingkaran = Lingkaran(7);

  print("Luas Bangun Datar Default: ${bangun.luas()}");
  print("Luas Persegi: ${persegi.luas()}, Keliling: ${persegi.keliling()}");
  print("Luas Segitiga: ${segitiga.luas()}, Keliling: ${segitiga.keliling()}");
  print("Luas Lingkaran: ${lingkaran.luas()}, Keliling: ${lingkaran.keliling()}");
}