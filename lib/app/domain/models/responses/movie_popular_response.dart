import 'dart:convert';

import '../movie_model.dart';

class MoviePopularResponse {
    MoviePopularResponse({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    int page;
    List<Movie> results;
    int totalPages;
    int totalResults;

    factory MoviePopularResponse.fromJson(String str) => MoviePopularResponse.fromMap(json.decode(str));

    factory MoviePopularResponse.fromMap(Map<String, dynamic> json) => MoviePopularResponse(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

}
