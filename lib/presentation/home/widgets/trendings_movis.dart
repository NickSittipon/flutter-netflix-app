import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/config/assets/app_images.dart';
import 'package:movie_app/presentation/home/bloc/trendings_cubit.dart';
import 'package:movie_app/presentation/home/bloc/trendings_state.dart';

class TrendingsMovies extends StatelessWidget {
  const TrendingsMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrendingsCubit()..getTrendingMovies(),
      child: BlocBuilder<TrendingsCubit, TrendingsState>(
        builder: (context, state) {
          if (state is TrendingMoviesLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is TrendingMoviesLoaded) {
            return FanCarouselImageSlider.sliderType1(
              imagesLink:
                  state.movies
                      .map(
                        (item) =>
                            AppImages.movieImageBasePath +
                            item.posterPath.toString(),
                      )
                      .toList(),
              isAssets: false,
              autoPlay: false,
              sliderHeight: 400,
              showIndicator: true,
            );
          }

          if (state is FailureLoadTrendingMovies) {
            return Center(child: Text(state.errorMessage));
          }

          return Container();
        },
      ),
    );
  }
}
