import 'package:dartz/dartz.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/domain/tv/repositories/tv.dart';
import 'package:movie_app/service_locator.dart';

class GetPopularTvUseCase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<TVRepository>().getPopularTV();
  }
}
