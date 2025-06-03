import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api_url.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/data/auth/models/signup_req_param.dart';
import 'package:movie_app/service_locator.dart';

abstract class AuthApiService {

  Future<Either> signup(SignupReqParams params);

}


class AuthApiServiceImpl extends AuthApiService {

  
  @override
  Future<Either> signup(SignupReqParams params) async {
    try {

      var response = await sl<DioClient>().post(
        ApiUrl.signup,
        data: params.toMap()
      );
      return Right(response.data);

    } on DioException catch(e) {
      return Left(e.response!.data['message']);
    }
  }

}

