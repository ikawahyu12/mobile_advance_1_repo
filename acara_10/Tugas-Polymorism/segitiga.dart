import 'bangun_datar.dart';

class Segitiga extends BangunDatar {
  double alas;
  double tinggi;

  Segitiga(this.alas, this.tinggi);

  @override
  double luas() => 0.5 * alas * tinggi;

  @override
  double keliling() => alas + tinggi + (alas * alas + tinggi * tinggi); // Siku-siku
}