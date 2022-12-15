// ignore_for_file: public_member_api_docs, sort_constructors_first
//

import 'package:rest_list/screens/auth/login_screen/models/login_response/login_response.dart';
import 'package:rest_list/screens/auth/login_screen/models/login_response/paginate.dart';
import 'package:rest_list/screens/auth/login_screen/models/login_response/product.dart';

class GetProductResponse implements ApiReponse<ProductsList> {
  @override
  int code;

  @override
  List<Product>? data;

  @override
  String? message;

  @override
  Paginate? paginate;

  @override
  bool status;

  @override
  String? whatsappMessage;
  GetProductResponse({
    required this.code,
    this.data,
    this.message,
    this.paginate,
    required this.status,
    this.whatsappMessage,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data == null
          ? null
          : List<dynamic>.from(data!.map((x) => x.toJson())),
      'code': code,
      'message': message,
      'paginate': paginate,
      'status': status,
      'whatsappMessage': whatsappMessage,
    };
  }

  factory GetProductResponse.fromMap(Map<String, dynamic> map) {
    final proList = map['data'];
    print(proList.runtimeType);
    return GetProductResponse(
      data: proList != null
          ? List<Product>.from(proList.map((x) => Product.fromJson(x)))
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

  @override
  String toString() {
    return 'GetProductResponse(code: $code, data: $data, message: $message, paginate: $paginate, status: $status, whatsappMessage: $whatsappMessage)';
  }
}
