import 'package:flutter/material.dart';
import 'package:peliculas/app/ui/pages/detail/widgets/cast_card.dart';


class CastingCards extends StatelessWidget {
  const CastingCards({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      width: double.infinity,
      height: 190,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (_, int index) =>CastCard(),
      ),
    );
  }
}
