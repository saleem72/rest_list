//

import 'package:dartz/dartz.dart';

import '../../../../models/failure.dart';
import '../models/login_data.dart';

abstract class LoginService {
  Future<Either<Failure, LoginData>> login(
      {required String email, required String password});
}
