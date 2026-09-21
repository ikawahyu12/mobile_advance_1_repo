class Product {
  final int id;
  final String productName;
  final String productImage;
  final String productDescription;
  final double price;

  Product(
    this.id,
    this.productName,
    this.productImage,
    this.productDescription,
    this.price,
  );
}

// Tambahkan fungsi main() ini di bagian paling bawah
void main() {
  // Membuat contoh objek Product
  var product = Product(
    1,
    'Laptop Gaming',
    'assets/laptop.png',
    'Laptop spec tinggi untuk koding dan game',
    15000000.0,
  );

  // Menampilkan data ke terminal
  print('=== DATA PRODUCT ===');
  print('ID          : ${product.id}');
  print('Nama Produk : ${product.productName}');
  print('Gambar      : ${product.productImage}');
  print('Deskripsi   : ${product.productDescription}');
  print('Harga       : Rp ${product.price}');
}