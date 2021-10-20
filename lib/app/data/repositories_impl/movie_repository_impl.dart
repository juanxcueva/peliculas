

import 'package:peliculas/app/data/dataresource/remote/movie_api.dart';
import 'package:peliculas/app/domain/models/movie_model.dart';
import 'package:peliculas/app/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository{
  
  final MovieApi _api=MovieApi();

  @override
  Future<List<Movie>> getMovies()=>_api.getMovies();

}