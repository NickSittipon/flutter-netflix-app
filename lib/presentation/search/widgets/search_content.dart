import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/widgets/movie/movie_card.dart';
import 'package:movie_app/common/widgets/tv/tv_card.dart';
import 'package:movie_app/presentation/search/bloc/search_cubit.dart';
import 'package:movie_app/presentation/search/bloc/search_state.dart';

class SearchContent extends StatelessWidget {
  const SearchContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is MoviesLoaded) {
          return GridView.builder(
            itemCount: state.movies.length,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.6,
            ),
            itemBuilder: (context, index) {
              return MovieCard(movieEntity: state.movies[index]);
            },
          );
        }
        if (state is TVsLoaded) {
          return GridView.builder(
            shrinkWrap: true,
            itemCount: state.tvs.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.6,
            ),
            itemBuilder: (context, index) {
              return TVCard(tvEntity: state.tvs[index]);
            },
          );
        }
        if (state is SearchFailure) {
          return Center(child: Text(state.errorMessage));
        }

        return Container();
      },
    );
  }
}
