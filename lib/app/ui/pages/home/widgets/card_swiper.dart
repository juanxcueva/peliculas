import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * .5,
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemHeight: size.height * .4,
        itemWidth: size.width * .6,
        itemCount: 10,
        itemBuilder: (_, int index) {
          return GestureDetector(
            onTap: ()=>Navigator.pushNamed(context, "detail",arguments: "movie-instance"),
            
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                  placeholder: AssetImage("assets/images/no-image.jpg"),
                  image: NetworkImage("https://via.placeholder.com/300x400"),
                  fit: BoxFit.cover,),
            ),
          );
        },
      ),
    );
  }
}
