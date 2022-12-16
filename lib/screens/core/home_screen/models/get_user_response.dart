//

import 'dart:convert';

import '../../../../models/apis_related/api_reponse.dart';
import '../../../../models/apis_related/paginate.dart';
import '../../../../models/app_user/app_user.dart';

class GetUserResponse implements ApiReponse<AppUser> {
  @override
  AppUser? data;

  @override
  int code;

  @override
  String? message;

  @override
  Paginate? paginate;

  @override
  bool status;

  @override
  String? whatsappMessage;
  GetUserResponse({
    this.data,
    required this.code,
    this.message,
    this.paginate,
    required this.status,
    this.whatsappMessage,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data?.toJson(),
      'code': code,
      'message': message,
      'paginate': paginate,
      'status': status,
      'whatsappMessage': whatsappMessage,
    };
  }

  factory GetUserResponse.fromMap(Map<String, dynamic> map) {
    return GetUserResponse(
      data: map['data'] != null
          ? AppUser.fromJson(map['data'] as Map<String, dynamic>)
          : null,
      code: map['code'] as int,
      message: map['message'] as String?,
      paginate:
          map['paginate'] != null ? Paginate.fromJson(map['paginate']) : null,
      status: map['status'] as bool,
      whatsappMessage: map['whatsappMessage'] != null
          ? map['whatsappMessage'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetUserResponse.fromJson(String source) =>
      GetUserResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
