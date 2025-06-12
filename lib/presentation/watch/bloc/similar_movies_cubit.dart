import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/movie/usecase/get_similar_movies.dart';
import 'package:movie_app/presentation/watch/bloc/similar_movies_state.dart';
import 'package:movie_app/service_locator.dart';

class  SimilarMoviesCubit extends Cubit<SimilarMoviesState> {
  SimilarMoviesCubit() : super( SimilarMoviesLoading());


  void getSimilarMovies(int movieId) async {
    var returnedData = await sl<GetSimilarMoviesUseCase>().call(params: movieId);
    returnedData.fold(
      (error){
        emit(
          FailureLoadSimilarMovies(errorMessage: error)
        );
      },
      (data){
        emit(
          SimilarMoviesLoaded(movies: data)
        );
      }
    );
  }
}