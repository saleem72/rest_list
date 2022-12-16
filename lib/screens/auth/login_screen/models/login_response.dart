// ignore_for_file: public_member_api_docs, sort_constructors_first
//

import '../../../../models/apis_related/api_reponse.dart';
import 'login_data.dart';
import '../../../../models/apis_related/paginate.dart';

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
  String? message;

  @override
  int code;

  @override
  Paginate? paginate;

  @override
  String? whatsappMessage;

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    final dataMap = json["data"] as Map<String, dynamic>?;
    return LoginResponse(
      data: dataMap == null ? null : LoginData.fromMap(dataMap),
      status: json["status"],
      message: json["message"],
      code: json["code"],
      paginate:
          json["paginate"] != null ? Paginate.fromJson(json["paginate"]) : null,
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
