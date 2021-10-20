import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:peliculas/app/domain/models/movie_model.dart';
import 'package:peliculas/app/domain/models/responses/movie_response.dart';

class MovieApi {
  String _apiKey = "47f1ce4251b0b1900a1dd1c1771da73b";
  String _baseUrl = "api.themoviedb.org";
  String _language = "es-ES";

  Future<List<Movie>> getMovies() async {
    try {
      var url = Uri.https(_baseUrl, "3/movie/now_playing",
          {"api_key": _apiKey, "language": _language, "page": "1"});

      var response = await http.get(url);
  
      if (response.statusCode == 200) {
        MovieResponse movieResponse = MovieResponse.fromJson(response.body);
        print(movieResponse.results[0].title);
        return movieResponse.results;
      } else {
        print("error");
        return [];
      }
    } catch (error) {
      print(error);
      return [];
    }
  }
}
