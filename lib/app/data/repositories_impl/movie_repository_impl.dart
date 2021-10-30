

import 'package:peliculas/app/data/dataresource/remote/movie_api.dart';
import 'package:peliculas/app/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository{
  
  final MovieApi _api=MovieApi();

  @override
  Future<Map<String, dynamic>> getMovies()=>_api.getMovies();

  @override
  Future<Map<String, dynamic>> getMoviesPopular(int page) =>_api.getMoviesPopular(page);

}