import 'package:get_it/get_it.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/data/auth/repositories/auth.dart';
import 'package:movie_app/data/auth/sources/auth_api_service.dart';
import 'package:movie_app/data/movie/repositories/movie.dart';
import 'package:movie_app/data/movie/sources/movie.dart';
import 'package:movie_app/data/tv/repositories/tv.dart';
import 'package:movie_app/data/tv/sources/tv.dart';
import 'package:movie_app/domain/auth/repositories/auth.dart';
import 'package:movie_app/domain/auth/usecase/is_logged_in.dart';
import 'package:movie_app/domain/auth/usecase/signin.dart';
import 'package:movie_app/domain/auth/usecase/signup.dart';
import 'package:movie_app/domain/movie/repositories/movie.dart';
import 'package:movie_app/domain/movie/usecase/get_movie_trailer.dart';
import 'package:movie_app/domain/movie/usecase/get_now_playing_movies.dart';
import 'package:movie_app/domain/movie/usecase/get_recommendation_movies.dart';
import 'package:movie_app/domain/movie/usecase/get_similar_movies.dart';
import 'package:movie_app/domain/movie/usecase/get_trendings_movies.dart';
import 'package:movie_app/domain/tv/repositories/tv.dart';
import 'package:movie_app/domain/tv/usecases/get_keywords.dart';
import 'package:movie_app/domain/tv/usecases/get_popular_tv.dart';
import 'package:movie_app/domain/tv/usecases/get_recommendation_tvs.dart';
import 'package:movie_app/domain/tv/usecases/get_similar_tvs.dart';

final sl  = GetIt.instance;

void setupServiceLocator() {

    sl.registerSingleton<DioClient>(DioClient());

    //Service
    sl.registerSingleton<AuthService>(AuthApiServiceImpl());
    sl.registerSingleton<MovieService>(MovieApiServiceImpl());
    sl.registerSingleton<TVService>(TVApiServiceImpl());

    //Repositories
    sl.registerSingleton<AuthRepository>(AuthRepositoryImp());
    sl.registerSingleton<MovieRepository>(MovieRepositoryImpl());
    sl.registerSingleton<TVRepository>(TVRepositoryImpl());

    //usecase
    sl.registerSingleton<SignupUseCase>(SignupUseCase());
    sl.registerSingleton<SigninUseCase>(SigninUseCase());
    sl.registerSingleton<isLoggedInUseCase>(isLoggedInUseCase());
    sl.registerSingleton<GetTrendingsMoviesUseCase>(GetTrendingsMoviesUseCase());
    sl.registerSingleton<GetNowPlayingMoviesUseCase>(GetNowPlayingMoviesUseCase());
    sl.registerSingleton<GetPopularTvUseCase>(GetPopularTvUseCase());
    sl.registerSingleton<GetMovieTrailerUseCase>(GetMovieTrailerUseCase());
    sl.registerSingleton<GetRecommendationMoviesUseCase>(GetRecommendationMoviesUseCase());
    sl.registerSingleton<GetSimilarMoviesUseCase>(GetSimilarMoviesUseCase());
    sl.registerSingleton<GetSimilarTvsUseCase>(GetSimilarTvsUseCase());
    sl.registerSingleton<GetRecommendationTvsUseCase>(GetRecommendationTvsUseCase());
    sl.registerSingleton<GetTVKeywordsUseCase>(GetTVKeywordsUseCase());
}