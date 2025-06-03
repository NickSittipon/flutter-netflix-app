import 'package:get_it/get_it.dart';
import 'package:movie_app/core/network/dio_client.dart';

final sl  = GetIt.instance;

void setupServiceLocator() {

    sl.registerSingleton<DioClient>(DioClient());
}