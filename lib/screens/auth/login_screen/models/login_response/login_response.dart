// ignore_for_file: public_member_api_docs, sort_constructors_first
//

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../models/failure.dart';
import 'permissions.dart';
import 'user.dart';

class BaseService {
  static Failure handleException(dynamic ex) {
    return Failure(message: ex.toString());
  }

  static Either<Failure, T> handleResponse<T>(ApiReponse<T> reponse) {
    if (reponse.data != null) {
      return Right(reponse.data as T);
    } else {
      return Left(Failure(message: reponse.message));
    }
  }
}

abstract class ApiReponse<T> {
  T? data;
  bool status;
  String message;
  int code;
  String? paginate;
  String? whatsappMessage;
  ApiReponse({
    this.data,
    required this.status,
    required this.message,
    required this.code,
    this.paginate,
    this.whatsappMessage,
  });
}

class LoginResponse implements ApiReponse<LoginData> {
  LoginResponse({
    this.data,
    required this.status,
    required this.message,
    required this.code,
    this.paginate,
    this.whatsappMessage,
  });

  @override
  LoginData? data;

  @override
  bool status;

  @override
  String message;

  @override
  int code;

  @override
  String? paginate;

  @override
  String? whatsappMessage;

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    final dataMap = json["data"] as Map<String, dynamic>?;
    return LoginResponse(
      data: dataMap == null ? null : LoginData.fromMap(dataMap),
      status: json["status"],
      message: json["message"],
      code: json["code"],
      paginate: json["paginate"],
      whatsappMessage: json["whatsapp_message"],
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "status": status,
        "message": message,
        "code": code,
        "paginate": paginate,
        "whatsapp_message": whatsappMessage,
      };
}

class LoginData {
  LoginUser user;
  String token;
  UserPermissions permissions;
  LoginData({
    required this.user,
    required this.token,
    required this.permissions,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user.toJson(),
      'token': token,
      'permissions': permissions.toJson(),
    };
  }

  factory LoginData.fromMap(Map<String, dynamic> map) {
    return LoginData(
      user: LoginUser.fromJson(map['user'] as Map<String, dynamic>),
      token: map['token'] as String,
      permissions:
          UserPermissions.fromJson(map['permissions'] as Map<String, dynamic>),
    );
  }

  @override
  LoginData fromJson(Map<String, dynamic> m) {
    return LoginData.fromMap(m);
  }

  @override
  Map<String, dynamic> toJson() {
    return toMap();
  }
}

class EnumValues<T> {
  Map<String, T> map;

  EnumValues({required this.map});

  Map<T, String> get reverseMap {
    return map.map((k, v) => MapEntry(v, k));
  }
}
