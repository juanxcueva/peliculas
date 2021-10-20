import 'package:flutter/material.dart';
import 'package:peliculas/app/ui/pages/detail/widgets/casting_cards.dart';
import 'widgets/custom_appbar.dart';
import 'widgets/overview.dart';
import 'widgets/poster_title.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? "No-movie";
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          CustomAppBar(),
          SliverList(
              delegate: SliverChildListDelegate([
            PosterAndTitle(),
            OverView(),
            OverView(),
            OverView(),
            OverView(),
            CastingCards(),

          ])),
        ],
      ),
    );
  }
}


