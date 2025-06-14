import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_app/common/widgets/appbar/app_bar.dart';
import 'package:movie_app/core/config/assets/app_vectors.dart';
import 'package:movie_app/presentation/home/widgets/category_text.dart';
import 'package:movie_app/presentation/home/widgets/now_playing_movies.dart';
import 'package:movie_app/presentation/home/widgets/popular_tv.dart';
import 'package:movie_app/presentation/home/widgets/trendings_movis.dart';
import 'package:movie_app/presentation/search/pages/search.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        action: IconButton(
          onPressed: () {
            AppNavigator.push(context, const SearchPage());
          },
          icon: const Icon(Icons.search),
        ),
        title: SvgPicture.asset(AppVectors.logo),
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryText(title: 'Trending 🔥'),
            TrendingsMovies(),
            SizedBox(height: 16),
            CategoryText(title: 'Now Playing'),
            SizedBox(height: 16),
            NowPlayingMovies(),
            SizedBox(height: 16),
            CategoryText(title: 'Popular TV'),
            SizedBox(height: 16),
            PopularTv(),
          ],
        ),
      ),
    );
  }
}
