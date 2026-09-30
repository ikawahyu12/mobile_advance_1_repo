import 'dart:convert';
import 'package:http/http.dart' show Client, Response;
import 'package:mobile_advance_app/acara_35/model/popular_movies.dart';

class ApiProvider {
  String apikey = 'a94ef910e6a2146236425e6756b4eae3';
  String baseUrl = 'https://api.themoviedb.org/3';

  Client client = Client();

  Future<PopularMovies> getPopularMovies() async {
    String url = '$baseUrl/movie/popular?api_key=$apikey';
    print(url);

    Response response =
        await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return PopularMovies.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }
}