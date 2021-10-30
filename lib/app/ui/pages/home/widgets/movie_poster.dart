import 'package:flutter/material.dart';
import 'package:peliculas/app/domain/models/movie_model.dart';

class MoviePoster extends StatefulWidget {
  const MoviePoster({
    Key? key,
    required this.movies, required this.onNextPage,
  }) : super(key: key);

  final List<Movie> movies;
  final Function onNextPage;

  @override
  State<MoviePoster> createState() => _MoviePosterState();
}

class _MoviePosterState extends State<MoviePoster> {

  final ScrollController scrollController=new ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {

      if(scrollController.position.pixels >= scrollController.position.maxScrollExtent-800){
        widget.onNextPage(); 
      }
     // print(scrollController.position.pixels);
      //print(scrollController.position.maxScrollExtent);

     });
    
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.movies.isEmpty) {
      return Container(
        width: 130,
        height: 190,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Expanded(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.movies.length,
        itemBuilder: (_, int index) {
          return Container(
            width: 130,
            height: 190,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, "detail",
                      arguments: widget.movies[index]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FadeInImage(
                      placeholder: AssetImage("assets/images/no-image.jpg"),
                      image:
                          NetworkImage(widget.movies[index].fullPosterImg),
                      height: 190,
                      width: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Flexible(
                  child: Text(widget.movies[index].title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
