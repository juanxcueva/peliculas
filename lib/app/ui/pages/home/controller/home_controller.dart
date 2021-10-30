import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:peliculas/app/data/repositories_impl/movie_repository_impl.dart';
import 'package:peliculas/app/domain/models/movie_model.dart';

class HomeController extends SimpleNotifier {
  HomeController() {
    _init();
    _getPopularMovies();
  }

  //Variables
  List<Movie> _onDisplayMovies = [];
  List<Movie> _popularMovies = [];
  bool _loading = true;
  String _error = "";
  int _popularpage=0;

  //Get's
  List<Movie> get movies => _onDisplayMovies;
  List<Movie> get popularMovies => _popularMovies;
  bool get loading => _loading;
  String get error => _error;
  Function get popularMoviesFunction => _getPopularMovies;

  //Set's
  set movies(List<Movie> list) {
    _onDisplayMovies = list;
    notify();
  }
  set popularMovies(List<Movie> list) {
    _popularMovies = list;
    notify();
  }

  set loading(bool value) {
    _loading = value;
    notify();
  }

  set error(String value) {
    _error = value;
    notify();
  }

  Future<void> _init() async {
    Map<String, dynamic> mapa = await MovieRepositoryImpl().getMovies();
    if (mapa['error'] != null) {
      _error = mapa['error'];
    } else {
      _onDisplayMovies = mapa['movies'];
    }
    _loading = false;
    notify(['movies']);
  }

  Future<void> _getPopularMovies() async {
    _popularpage++;
    Map<String, dynamic> mapa = await MovieRepositoryImpl().getMoviesPopular(_popularpage);
    if (mapa['error'] != null) {
      _error = mapa['error'];
    } else {
      _popularMovies = mapa['movies'];
    }
    _loading = false;
    notify(['popular']);
  }
}
