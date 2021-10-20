

import 'package:peliculas/app/domain/models/movie_model.dart';

abstract class MovieRepository{
  Future<List<Movie>> getMovies();
   
}