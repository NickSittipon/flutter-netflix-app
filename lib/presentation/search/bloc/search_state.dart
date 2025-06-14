import 'package:movie_app/domain/movie/entities/movie.dart';
import 'package:movie_app/domain/tv/entities/tv.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class MoviesLoaded extends SearchState {
  final List<MovieEntity> movies;
  MoviesLoaded({required this.movies});
}

class TVsLoaded extends SearchState {
  final List<TVEntity> tvs;
  TVsLoaded({required this.tvs});
}

class SearchFailure extends SearchState {
  final String errorMessage;
  SearchFailure({required this.errorMessage});
}
