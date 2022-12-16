// To parse this JSON data, do
//
//     final categoriesResponse = categoriesResponseFromJson(jsonString);

import 'dart:convert';

import '../../../../models/apis_related/api_reponse.dart';
import '../../../../models/apis_related/paginate.dart';
import '../../../../models/product_category.dart';

typedef CategoriesList = List<ProductCategory>;

CategoriesResponse categoriesResponseFromJson(String str) =>
    CategoriesResponse.fromJson(json.decode(str));

String categoriesResponseToJson(CategoriesResponse data) =>
    json.encode(data.toJson());

class CategoriesResponse implements ApiReponse<CategoriesList> {
  CategoriesResponse({
    this.data,
    required this.code,
    this.message,
    this.paginate,
    required this.status,
    this.whatsappMessage,
  });

  @override
  CategoriesList? data;

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

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      CategoriesResponse(
        data: List<ProductCategory>.from(
            json["data"].map((x) => ProductCategory.fromJson(x))),
        code: json['code'] as int,
        message: json['message'] as String?,
        paginate: json['paginate'] != null
            ? Paginate.fromJson(json['paginate'])
            : null,
        status: json['status'] as bool,
        whatsappMessage: json['whatsappMessage'] != null
            ? json['whatsappMessage'] as String
            : null,
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        'code': code,
        'message': message,
        'paginate': paginate,
        'status': status,
        'whatsappMessage': whatsappMessage,
      };
}
