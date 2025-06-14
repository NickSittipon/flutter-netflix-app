import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/domain/auth/repositories/auth.dart';
import 'package:movie_app/service_locator.dart';

class IsLoggedInUseCase extends UseCase<bool, dynamic> {
  @override
  Future<bool> call({params}) async {
    return await sl<AuthRepository>().isLoggedIn();
  }
}
