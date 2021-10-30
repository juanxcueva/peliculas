import 'package:flutter/material.dart';
class OverView extends StatelessWidget {
  const OverView({Key? key, required this.overview}) : super(key: key);

  final String overview;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
       overview,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}