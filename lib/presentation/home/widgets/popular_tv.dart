import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/widgets/tv/tv_card.dart';
import 'package:movie_app/presentation/home/bloc/popular_tv_cubit.dart';
import 'package:movie_app/presentation/home/bloc/popular_tv_state.dart';

class PopularTv extends StatelessWidget {
  const PopularTv({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PopularTVCubit()..getPopularTVMovies(),
      child: BlocBuilder<PopularTVCubit, PopularTVState>(
        builder: (context, state) {
          if (state is PopularTVLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is PopularTVLoaded) {
            return SizedBox(
              height: 300,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  return TVCard(tvEntity: state.tv[index]);
                },
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: state.tv.length,
              ),
            );
          }

          if (state is FailureLoadPopularTV) {
            return Center(child: Text(state.errorMessage));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

