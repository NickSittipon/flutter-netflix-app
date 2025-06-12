import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/movie/usecase/get_recommendation_movies.dart';
import 'package:movie_app/presentation/watch/bloc/recommendation_movies_state.dart';
import 'package:movie_app/service_locator.dart';

class  SimilarMoviesCubit extends Cubit< RecommendationMoviesState> {
  SimilarMoviesCubit() : super( RecommendationMoviesLoading());


  void getRecommendationMovies(int movieId) async {
    var returnedData = await sl<GetRecommendationMoviesUseCase>().call(params: movieId);
    returnedData.fold(
      (error){
        emit(
          FailureLoadRecommendationMovies(errorMessage: error)
        );
      },
      (data){
        emit(
          RecommendationMoviesLoaded(movies: data)
        );
      }
    );
  }
}