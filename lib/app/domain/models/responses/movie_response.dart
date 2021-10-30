import 'dart:convert';

import 'package:peliculas/app/domain/models/movie_model.dart';

import '../date_model.dart';

class MovieResponse {
  MovieResponse({
    this.dates,
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  Dates? dates;
  int? page;
  List<Movie>? results;
  int? totalPages;
  int? totalResults;

  factory MovieResponse.fromJson(String str) =>
      MovieResponse.fromMap(json.decode(str));

  factory MovieResponse.fromMap(Map<String, dynamic> json) => MovieResponse(
        dates: Dates.fromMap(json["dates"]),
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
