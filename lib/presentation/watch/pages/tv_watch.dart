import 'package:flutter/material.dart';
import 'package:movie_app/common/widgets/appbar/app_bar.dart';
import 'package:movie_app/domain/tv/entities/tv.dart';
import 'package:movie_app/presentation/watch/widgets/recommendation_tvs.dart';
import 'package:movie_app/presentation/watch/widgets/similar_tvs.dart';
import 'package:movie_app/presentation/watch/widgets/tv_keywords.dart';
import 'package:movie_app/presentation/watch/widgets/video_overview.dart';
import 'package:movie_app/presentation/watch/widgets/video_player.dart' show VideoPlayer;
import 'package:movie_app/presentation/watch/widgets/video_title.dart';
import 'package:movie_app/presentation/watch/widgets/video_vote_average.dart';

class TVWatchPage extends StatelessWidget {
  final TVEntity tvEntity;

  const TVWatchPage({super.key, required this.tvEntity});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: false,

      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoPlayer(id: tvEntity.id!),
            SizedBox(height: 16),
            VideoTitle(title: tvEntity.name!),
            SizedBox(height: 16),
            TVKeywords(tvId: tvEntity.id!),
            SizedBox(height: 16),
            VideoVoteAverage(voteAverage: tvEntity.voteAverage!),
            SizedBox(height: 16),
            VideoOverview(overview: tvEntity.overview!),
            SizedBox(height: 16),
            RecommendationTVs(tvId: tvEntity.id!),
            SizedBox(height: 16),
            SimilarTVs(tvId: tvEntity.id!),
          ],
        ),
      ),
    );
  }
}