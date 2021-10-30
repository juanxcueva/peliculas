import 'package:flutter/material.dart';
import 'package:peliculas/app/domain/models/movie_model.dart';

import 'movie_poster.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({ Key? key, required this.movies, this.titulo="", required this.onNextPage }) : super(key: key);

  final List<Movie> movies;
  final String titulo;
  final Function onNextPage;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: 290,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20 ),
            child: Text(titulo,style: Theme.of(context).textTheme.headline6!.copyWith(
              fontWeight: FontWeight.bold
            ),),
          ),
          SizedBox(height: 5,),
          MoviePoster(movies: movies,onNextPage: onNextPage,),
        ],
      ),
    );
  }
}

