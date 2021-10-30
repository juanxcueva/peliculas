import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/app/domain/models/movie_model.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({Key? key, required this.movies}) : super(key: key);

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if(movies.isEmpty) {
      return Container(
         width: double.infinity,
        height: size.height * .5,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );

    }

    return Container(
      width: double.infinity,
      height: size.height * .5,
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemHeight: size.height * .4,
        itemWidth: size.width * .6,
        itemCount: movies.length > 0 ? movies.length : 10,
        itemBuilder: (_, int index) {
          final movie = movies.length>0 ?movies[index] :null;

          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, "detail",
                arguments: movie),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage("assets/images/no-image.jpg"),
                image: NetworkImage(movie!=null ? movie.fullPosterImg : "https://via.placeholder.com/300x400"),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
