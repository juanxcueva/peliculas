import 'package:flutter/material.dart';
import 'package:peliculas/app/ui/pages/detail/detail_page.dart';
import 'package:peliculas/app/ui/pages/home/home_page.dart';

import 'routes.dart';

Map<String, Widget Function(BuildContext)> routes={
  Routes.home:(_)=>const HomePage(),
  Routes.detail:(_)=>const DetailPage(),
};