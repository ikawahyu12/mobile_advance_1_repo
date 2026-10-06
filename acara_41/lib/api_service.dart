import 'dart:convert';
import 'package:http/http.dart' as http;
import 'mahasiswa.dart';

class ApiService {
  static const String baseUrl =
      'http://172.16.104.99:8080/api';

  Future<List<Mahasiswa>> getMahasiswa() async {
    final response = await http.get(
      Uri.parse('$baseUrl/mahasiswa'),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

      final List data = jsonData['data'];

      return data
          .map((item) => Mahasiswa.fromJson(item))
          .toList();
    } else {
      throw Exception('Gagal mengambil data mahasiswa');
    }
  }
}