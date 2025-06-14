import 'package:dartz/dartz.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/domain/tv/repositories/tv.dart';
import 'package:movie_app/service_locator.dart';

class SearchTVUseCase extends UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<TVRepository>().searchTV(params!);
  }
}
