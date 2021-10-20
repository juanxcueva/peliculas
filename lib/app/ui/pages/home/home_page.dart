import 'package:flutter/material.dart';
import 'package:peliculas/app/domain/providers/movies_provider.dart';
import 'package:peliculas/app/ui/pages/home/widgets/card_swiper.dart';
import 'package:peliculas/app/ui/pages/home/widgets/movie_slider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final moviesProvider=Provider.of<MoviesProvider>(context);

    print(moviesProvider.onDisplayMovies);
    return Scaffold(
      appBar: AppBar(
        title: Text("Peliculas en cines"),
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiper(movies: moviesProvider.onDisplayMovies,),
            MovieSlider(),
          ],
        ),
      ),
    );
  }
}
