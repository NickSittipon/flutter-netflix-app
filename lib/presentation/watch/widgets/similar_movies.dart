import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/widgets/movie/movie_card.dart';
import 'package:movie_app/presentation/watch/bloc/similar_movies_cubit.dart';
import 'package:movie_app/presentation/watch/bloc/similar_movies_state.dart';


class SimilarMovies extends StatelessWidget {
  final int movieId;
  const SimilarMovies({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SimilarMoviesCubit()..getSimilarMovies(movieId),
      child: BlocBuilder<SimilarMoviesCubit, SimilarMoviesState>(
        builder: (context, state) {
          if (state is SimilarMoviesLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is SimilarMoviesLoaded) {
            return  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Similar',
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

          if (state is FailureLoadSimilarMovies) {
            return Center(child: Text(state.errorMessage));
          }

          return Container();
        },
      ),
    );
  }
}
