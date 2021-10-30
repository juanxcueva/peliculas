


abstract class MovieRepository{
  Future<Map<String, dynamic>> getMovies();
  Future<Map<String, dynamic>> getMoviesPopular(int page);

   
}