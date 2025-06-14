import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/bloc/generic_data_cubit.dart';
import 'package:movie_app/common/bloc/generic_data_state.dart';
import 'package:movie_app/common/widgets/movie/movie_card.dart';
import 'package:movie_app/domain/movie/entities/movie.dart';
import 'package:movie_app/domain/movie/usecase/get_similar_movies.dart';
import 'package:movie_app/service_locator.dart';

class SimilarMovies extends StatelessWidget {
  final int movieId;
  const SimilarMovies({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              GenericDataCubit()..getData<List<MovieEntity>>(
                sl<GetSimilarMoviesUseCase>(),
                params: movieId,
              ),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is DataLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is DataLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Similar',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: 300,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    itemBuilder: (context, index) {
                      return MovieCard(movieEntity: state.data[index]);
                    },
                    separatorBuilder:
                        (context, index) => const SizedBox(width: 10),
                    itemCount: state.data.length,
                  ),
                ),
              ],
            );
          }

          if (state is FailureLoadData) {
            return Center(child: Text(state.errorMessage));
          }

          return Container();
        },
      ),
    );
  }
}
