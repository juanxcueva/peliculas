import 'package:flutter/material.dart';
import 'package:peliculas/app/ui/routes/app_routes.dart';
import 'package:peliculas/app/ui/theme/app_colors.dart';
import 'package:flutter_meedu/router.dart' as router;

import 'app/ui/routes/routes.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas App',
      initialRoute: Routes.home,
      routes: routes,
      theme: ThemeData.light().copyWith(
          appBarTheme: AppBarTheme(
        color: AppColors.primaryColor,
      )),
      navigatorObservers: [
        router.observer
      ],
    );
  }
}
