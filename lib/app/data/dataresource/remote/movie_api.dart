import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:peliculas/app/domain/models/responses/movie_popular_response.dart';
import 'package:peliculas/app/domain/models/responses/movie_response.dart';

class MovieApi {
  final String _apiKey = "47f1ce4251b0b1900a1dd1c1771da73b";
  final String _baseUrl = "api.themoviedb.org";
  final String _language = "es-ES";

  Future<Map<String, dynamic>> getMovies() async {
    try {
      var url = Uri.https(_baseUrl, "3/movie/now_playing",
          {"api_key": _apiKey, "language": _language, "page": "1"});

      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body) as Map<String, dynamic>;
        MovieResponse movieResponse = MovieResponse.fromJson(response.body);
        Map<String, dynamic> mapa = {'movies': movieResponse.results, 'error': null};
        return mapa;
      } else {
        print("error");
        Map<String, dynamic> mapa = {
          'movies': null,
          'error': "ERROR" + response.statusCode.toString()
        };
        return mapa;
      }
    } catch (error) {
      print("entra aqui");
      print(error);
      Map<String, dynamic> mapa = {
        'movies': null,
        'error': "ERROR" + error.toString()
      };
      return mapa;
    }
  }

   Future<Map<String, dynamic>> getMoviesPopular(int page) async {
    try {
      var url = Uri.https(_baseUrl, "3/movie/popular",
          {"api_key": _apiKey, "language": _language, "page": "$page"});

      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body) as Map<String, dynamic>;
        MoviePopularResponse movieResponse = MoviePopularResponse.fromJson(response.body);
        Map<String, dynamic> mapa = {'movies': movieResponse.results, 'error': null};
        return mapa;
      } else {
        print("error");
        Map<String, dynamic> mapa = {
          'movies': null,
          'error': "ERROR" + response.statusCode.toString()
        };
        return mapa;
      }
    } catch (error) {
      print("entra aqui");
      print(error);
      Map<String, dynamic> mapa = {
        'movies': null,
        'error': "ERROR" + error.toString()
      };
      return mapa;
    }
  }
}
