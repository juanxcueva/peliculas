import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:peliculas/app/ui/pages/home/widgets/card_swiper.dart';
import 'package:peliculas/app/ui/pages/home/widgets/movie_slider.dart';

import 'controller/home_controller.dart';

final homeProvider = SimpleProvider(
  (ref) => HomeController(),
);

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            Consumer(
              builder: (_, ref, ___) {
                final homeController = ref.watch(
                  homeProvider.ids(() => ['movies']),
                );
                return homeController.loading
                    ? CardSwiper(movies: homeController.movies)
                    : homeController.error.isEmpty
                        ? CardSwiper(movies: homeController.movies)
                        : Center(
                            child: Text(
                              homeController.error,
                            ),
                          );
              },
            ),
            Consumer(
              builder: (_, ref, ___) {
                 final homeController = ref.watch(
                  homeProvider.ids(() => ['popular']),
                );
                return homeController.loading
                    ? MovieSlider(
                        movies: homeController.popularMovies,
                        titulo: "Populares",
                        onNextPage: homeController.popularMoviesFunction,
                      )
                    : homeController.error.isEmpty
                        ? MovieSlider(
                            movies: homeController.popularMovies,
                            titulo: "Populares",
                            onNextPage: homeController.popularMoviesFunction,
                          )
                        : Center(
                            child: Text(
                              homeController.error,
                            ),
                          );
              },
            ),
          ],
        ),
      ),
    );
  }
}
