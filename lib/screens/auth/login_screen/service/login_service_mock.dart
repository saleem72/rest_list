//

import 'package:dartz/dartz.dart';

import '../../../../helpers/jsons.dart';
import '../../../../models/failure.dart';
import '../models/login_response/login_response.dart';
import 'login_service.dart';

class LoginServiceMock implements LoginService {
  @override
  Future<Either<Failure, LoginData>> login(
      {required String email, required String password}) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    if (email == 'logical9447@gmail.com' && password == 'logical9447') {
      final jsonResponse = await JsonApiResponse.loadJsonData(
          JsonApiResponse.loginSuccessResponse);
      final loginResponse = LoginResponse.fromJson(jsonResponse);
      return BaseService.handleResponse<LoginData>(loginResponse);
    } else {
      return left(const Failure(message: 'invalid user name or password'));
    }
  }
}
