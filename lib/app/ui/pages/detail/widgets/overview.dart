import 'package:flutter/material.dart';
class OverView extends StatelessWidget {
  const OverView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        "Officia nulla do amet consequat. Duis excepteur sint mollit eiusmod dolore ea velit id velit. Culpa qui mollit irure enim ullamco adipisicing esse sint aliqua aute labore. Ut velit minim commodo fugiat consectetur.",
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}