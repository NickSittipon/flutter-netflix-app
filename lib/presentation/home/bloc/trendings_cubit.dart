import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/movie/usecase/get_trendings_movies.dart';
import 'package:movie_app/presentation/home/bloc/trendings_state.dart';
import 'package:movie_app/service_locator.dart';

class TrendingsCubit extends Cubit<TrendingsState> {
  TrendingsCubit() : super(TrendingMoviesLoading());


  void getTrendingMovies() async {
    var returnedData = await sl<GetTrendingsMoviesUseCase>().call();
    returnedData.fold(
      (error){
        emit(
          FailureLoadTrendingMovies(errorMessage: error)
        );
      },
      (data){
        emit(
          TrendingMoviesLoaded(movies: data)
        );
      }
    );
  }
}