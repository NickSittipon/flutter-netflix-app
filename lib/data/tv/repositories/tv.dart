import 'package:dartz/dartz.dart';
import 'package:movie_app/common/helper/mapper/tv_mapper.dart';
import 'package:movie_app/data/tv/models/tv.dart';
import 'package:movie_app/data/tv/sources/tv.dart';
import 'package:movie_app/domain/tv/repositories/tv.dart';
import 'package:movie_app/service_locator.dart';

class TVRepositoryImpl extends TVRepository{
  @override
  Future<Either> getPopularTV()async {
    var returnedData = await sl<TVService>().getPopularTV();

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies =
            List.from(data['content'])
                .map((item) => TvMapper.toEntity(TVModel.fromJson(item)))
                .toList();
        return Right(movies);
      },
    );
  }
}