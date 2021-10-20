


import 'package:flutter/material.dart';
import 'package:peliculas/app/data/repositories_impl/movie_repository_impl.dart';
import 'package:peliculas/app/domain/models/movie_model.dart';

class MoviesProvider extends ChangeNotifier{

  List<Movie> onDisplayMovies=[];

  MoviesProvider(){
    print("Provider inicializado");
    getOnDisplayMovies();
  }

  getOnDisplayMovies(){
    print("getonDisplayMovies");
    
    MovieRepositoryImpl().getMovies().then((value){
      onDisplayMovies=value;
    }).catchError((error){
      error=error.toString();
    });
    notifyListeners();
  }


}