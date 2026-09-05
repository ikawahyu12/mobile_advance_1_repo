void main() {
  print("=== 1. OPERATOR ARITMATIKA ===");
  int a = 10;
  int b = 3;

  print("Tambah (+)  : ${5 + 3}");
  print("Kurang (-)  : ${10 - 4}");
  print("Kali (*)    : ${4 * 2}");
  print("Bagi (/)    : ${10 / 2}");
  print("Modulus (%) : 5 % 3 = ${5 % 3}"); // Sisa bagi: 2
  print("Modulus (%) : 100 % 5 = ${100 % 5}\n"); // Sisa bagi: 0

  print("=== 2. OPERATOR ASSIGNMENT ===");
  var angkaAssignment;
  angkaAssignment = 10; // Contoh assignment variable angka dengan nilai 10
  print("Nilai angkaAssignment: $angkaAssignment\n");

  print("=== 3. OPERATOR PERBANDINGAN ===");
  // Equal Operator (==)
  var angkaEqual = 100;
  print("angkaEqual == 100 : ${angkaEqual == 100}"); // true
  print("angkaEqual == 20  : ${angkaEqual == 20}"); // false

  // Not Equal (!=)
  var sifat = "rajin";
  print("sifat != 'malas'  : ${sifat != "malas"}"); // true
  print("sifat != 'bandel' : ${sifat != "bandel"}"); // true

  // Catatan Perbandingan Tipe Data:
  // Di bahasa Dart, operator '===' tidak digunakan (menggunakan '==').
  // Dart secara ketat membedakan int dan String saat dibandingkan.
  var angkaStrict = 8;
  print("angkaStrict == 8   : ${angkaStrict == 8}"); // true

  // Kurang dari & Lebih Dari (<, >, <=, >=)
  var number = 17;
  print("number < 20  : ${number < 20}"); // true
  print("number > 17  : ${number > 17}"); // false
  print("number >= 17 : ${number >= 17}"); // true, karena terdapat sama dengan
  print("number <= 20 : ${number <= 20}\n"); // true

  print("=== 4. OPERATOR KONDISIONAL ===");
  // OR (||)
  print("--- OR (||) ---");
  print("true || true           : ${true || true}"); // true
  print("true || false          : ${true || false}"); // true
  print("true || false || false : ${true || false || false}"); // true
  print("false || false         : ${false || false}"); // false

  // AND (&&)
  print("--- AND (&&) ---");
  print("true && true           : ${true && true}"); // true
  print("true && false          : ${true && false}"); // false
  print("false && false         : ${false && false}"); // false
  print("false && true && true  : ${false && true && true}"); // false
  print("true && true && true   : ${true && true && true}"); // true
}