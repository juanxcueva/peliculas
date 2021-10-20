import 'package:flutter/material.dart';

import 'movie_poster.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({ Key? key }) : super(key: key);

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
            child: Text("Populares",style: Theme.of(context).textTheme.headline6!.copyWith(
              fontWeight: FontWeight.bold
            ),),
          ),
          SizedBox(height: 5,),
          MoviePoster(),
        ],
      ),
    );
  }
}

