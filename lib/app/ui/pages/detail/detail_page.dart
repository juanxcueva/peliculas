import 'package:flutter/material.dart';
import 'package:peliculas/app/domain/models/movie_model.dart';
import 'package:peliculas/app/ui/pages/detail/widgets/casting_cards.dart';
import 'widgets/custom_appbar.dart';
import 'widgets/overview.dart';
import 'widgets/poster_title.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Movie movie =
        ModalRoute.of(context)!.settings.arguments as Movie;
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          CustomAppBar(backDrop: movie.fullBackDropPath, title: movie.title),
          SliverList(
              delegate: SliverChildListDelegate([
            PosterAndTitle(posterImage: movie.fullPosterImg, title: movie.title, originalTitle: movie.originalTitle, voteAverage: "${movie.voteAverage}",),
            OverView(overview: movie.overview),
            CastingCards(),

          ])),
        ],
      ),
    );
  }
}


