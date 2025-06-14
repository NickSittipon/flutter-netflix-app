import 'package:dartz/dartz.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/domain/tv/repositories/tv.dart';
import 'package:movie_app/service_locator.dart';

class GetSimilarTvsUseCase extends UseCase<Either, int> {
  @override
  Future<Either> call({int? params}) async {
    return await sl<TVRepository>().getSimilarTVs(params!);
  }
}
