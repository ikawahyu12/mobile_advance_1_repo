import 'dart:convert';
import 'package:http/http.dart' as http;
import 'place_model.dart';

class ApiService {
  // 1. Fetch data pencarian lokasi (seperti di Postman Acara 33)
  static Future<List<Place>> searchPlace(String query) async {
    final url = Uri.parse(
        'https://nominatim.openstreetmap.org/search?q=$query&format=json');

    final response = await http.get(
      url,
      headers: {
        'User-Agent': 'Acara33/1.0', // Sesuai Header pada Postman kamu
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => Place.fromJson(item)).toList();
    } else {
      throw Exception('Gagal memuat data lokasi');
    }
  }
}