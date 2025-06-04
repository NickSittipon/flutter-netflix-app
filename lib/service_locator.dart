import 'package:get_it/get_it.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/data/auth/repositories/auth.dart';
import 'package:movie_app/data/auth/sources/auth_api_service.dart';
import 'package:movie_app/domain/auth/repositories/auth.dart';
import 'package:movie_app/domain/auth/usecase/is_logged_in.dart';
import 'package:movie_app/domain/auth/usecase/signin.dart';
import 'package:movie_app/domain/auth/usecase/signup.dart';

final sl  = GetIt.instance;

void setupServiceLocator() {

    sl.registerSingleton<DioClient>(DioClient());

    //Service
    sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());

    //Repositories
    sl.registerSingleton<AuthRepository>(AuthRepositoryImp());

    //usecase
    sl.registerSingleton<SignupUseCase>(SignupUseCase());
    sl.registerSingleton<SigninUseCase>(SigninUseCase());
    sl.registerSingleton<isLoggedInUseCase>(isLoggedInUseCase());

}