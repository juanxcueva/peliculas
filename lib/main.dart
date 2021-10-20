import 'package:flutter/material.dart';
import 'package:peliculas/app/domain/providers/movies_provider.dart';
import 'package:peliculas/app/ui/routes/app_routes.dart';
import 'package:peliculas/app/ui/theme/app_colors.dart';
import 'package:provider/provider.dart';

import 'app/ui/routes/routes.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MoviesProvider(),lazy: false,
        )
      ],
      child: MyApp(),
      
    );
  }
}

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
    );
  }
}
