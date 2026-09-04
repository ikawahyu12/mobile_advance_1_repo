void main() {
  print("=== Contoh 4: Branching Sederhana (if-else) ===");
  var minimarketStatus4 = "open";
  if (minimarketStatus4 == "open") {
    print("saya akan membeli telur dan buah");
  } else {
    print("minimarketnya tutup");
  }

  print("\n=== Contoh 5: Branching dengan Kondisi (if-else if-else) ===");
  var minimarketStatus5 = "close";
  var minuteRemainingToOpen5 = 5;
  if (minimarketStatus5 == "open") {
    print("saya akan membeli telur dan buah");
  } else if (minuteRemainingToOpen5 <= 5) {
    print("minimarket buka sebentar lagi, saya tungguin");
  } else {
    print("minimarket tutup, saya pulang lagi");
  }

  print("\n=== Contoh 6: Kondisional Bersarang (Nested If) ===");
  var minimarketStatus6 = "open";
  var telur = "soldout";
  var buah = "soldout";

  if (minimarketStatus6 == "open") {
    print("saya akan membeli telur dan buah");

    if (telur == "soldout" && buah == "soldout") {
      print("belanjaan saya habis");
    } else if (telur == "soldout") {
      print("telur habis, saya beli buah saja");
    } else if (buah == "soldout") {
      print("buah habis, saya beli telur saja");
    } else {
      print("saya membeli telur dan buah");
    }
  } else {
    print("minimarket tutup, saya pulang lagi");
  }
}