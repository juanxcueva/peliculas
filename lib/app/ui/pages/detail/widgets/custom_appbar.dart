import 'package:flutter/material.dart';
import 'package:peliculas/app/ui/theme/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({Key? key, required this.backDrop, required this.title}) : super(key: key);

  final String backDrop;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.color1,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: 10,left: 10,right: 10),
            color: Colors.black12,
            child: Text(title,
              style: TextStyle(fontSize: 16),textAlign: TextAlign.center,
            )),
        background: FadeInImage(
          placeholder: AssetImage("assets/images/loading.gif"),
          image: NetworkImage(backDrop),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
