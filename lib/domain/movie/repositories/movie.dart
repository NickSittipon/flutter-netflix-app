import 'package:dartz/dartz.dart';

abstract class MovieRepository{

  Future<Either> getTrendingMovie();
  Future<Either> getNowpPlayingMovies();
}