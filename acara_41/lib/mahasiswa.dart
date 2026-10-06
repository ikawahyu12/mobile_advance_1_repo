class Mahasiswa {
  final int id;
  final String nim;
  final String nama;
  final String prodi;

  Mahasiswa({
    required this.id,
    required this.nim,
    required this.nama,
    required this.prodi,
  });

  factory Mahasiswa.fromJson(Map<String, dynamic> json) {
    return Mahasiswa(
      id: json['id'],
      nim: json['nim'],
      nama: json['nama'],
      prodi: json['prodi'],
    );
  }
}