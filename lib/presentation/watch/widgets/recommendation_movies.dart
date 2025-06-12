import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/widgets/movie/movie_card.dart';
import 'package:movie_app/presentation/watch/bloc/recommendation_movies_cubit.dart';
import 'package:movie_app/presentation/watch/bloc/recommendation_movies_state.dart';


class RecommendationMovies extends StatelessWidget {
  final int movieId;
  const RecommendationMovies({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SimilarMoviesCubit()..getRecommendationMovies(movieId),
      child: BlocBuilder<SimilarMoviesCubit, RecommendationMoviesState>(
        builder: (context, state) {
          if (state is RecommendationMoviesLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is RecommendationMoviesLoaded) {
            return  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recommendation',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: 300,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding:  EdgeInsets.symmetric(horizontal: 16),
                    itemBuilder: (context, index){
                      return MovieCard(movieEntity: state.movies[index]);
                    }, 
                    separatorBuilder: (context, index) =>const SizedBox(width: 10), 
                    itemCount: state.movies.length,
                    ),
                ),
              ],
            );
          }

          if (state is FailureLoadRecommendationMovies) {
            return Center(child: Text(state.errorMessage));
          }

          return Container();
        },
      ),
    );
  }
}
