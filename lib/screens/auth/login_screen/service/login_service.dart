//

import 'package:dartz/dartz.dart';

import '../../../../models/failure.dart';
import '../../../../models/user.dart';
import '../models/login_response/login_response.dart';

abstract class LoginService {
  Future<Either<Failure, LoginData>> login(
      {required String email, required String password});
}
