import 'package:dartz/dartz.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/data/auth/models/signin_req_params.dart';
import 'package:movie_app/domain/auth/repositories/auth.dart';
import 'package:movie_app/service_locator.dart';

class SigninUseCase extends UseCase<Either, SigninReqParams> {
  @override
  Future<Either> call({SigninReqParams? params}) async {
    return await sl<AuthRepository>().signin(params!);
  }
}
