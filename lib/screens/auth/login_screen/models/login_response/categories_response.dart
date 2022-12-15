// To parse this JSON data, do
//
//     final categoriesResponse = categoriesResponseFromJson(jsonString);

import 'dart:convert';

import 'package:rest_list/screens/auth/login_screen/models/login_response/login_response.dart';
import 'package:rest_list/screens/auth/login_screen/models/login_response/paginate.dart';

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

class ProductCategory {
  ProductCategory({
    required this.id,
    required this.name,
    required this.isActive,
    required this.sort,
    this.parentId,
    required this.restaurantId,
    required this.subcategories,
  });

  int id;
  String name;
  int isActive;
  int sort;
  int? parentId;
  int restaurantId;
  List<ProductCategory> subcategories;

  @override
  String toString() => 'Category(name: $name)';

  factory ProductCategory.fromJson(Map<String, dynamic> json) {
    final subCat = json["subcategories"];
    return ProductCategory(
      id: json["id"],
      name: json["name"] as String? ?? 'Unknown',
      isActive: json["is_active"],
      sort: json["sort"],
      parentId: json["parent_id"],
      restaurantId: json["restaurant_id"],
      subcategories: subCat == null
          ? []
          : List<ProductCategory>.from(
              subCat.map((x) => ProductCategory.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "is_active": isActive,
        "sort": sort,
        "parent_id": parentId,
        "restaurant_id": restaurantId,
        "subcategories":
            List<dynamic>.from(subcategories.map((x) => x.toJson())),
      };
}
