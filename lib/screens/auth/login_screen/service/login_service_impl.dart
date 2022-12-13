//

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../../../../helpers/constants.dart';
import '../../../../models/failure.dart';
import '../models/login_response/login_response.dart';
import 'login_service.dart';

class LoginServiceImpl implements LoginService {
  @override
  Future<Either<Failure, LoginData>> login(
      {required String email, required String password}) async {
    final client = http.Client();
    final uri = Uri.parse('${Constants.baseURL}restaurant/login');
    final data = {
      "email": email,
      "password": password,
    };

    try {
      final response = await client.post(uri, body: data);
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      final loginResponse = LoginResponse.fromJson(jsonResponse);
      return BaseService.handleResponse(loginResponse);
    } catch (ex) {
      return left(BaseService.handleException(ex));
    }
  }
}

class LoginCredintials {
  final String email;
  final String password;
  // TODO: do some thing
  LoginCredintials({required this.email, required this.password});
}
