//

import 'package:dartz/dartz.dart';

import '../failure.dart';
import 'api_reponse.dart';

class BaseService {
  static Failure handleException(dynamic ex) {
    return Failure(message: ex.toString());
  }

  static Either<Failure, T> handleResponse<T>(ApiReponse<T> reponse) {
    if (reponse.data != null) {
      return Right(reponse.data as T);
    } else {
      return Left(Failure(message: reponse.message ?? 'Unknown error'));
    }
  }
}
