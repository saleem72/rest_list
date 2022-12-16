//

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class ProductCategory extends Equatable {
  const ProductCategory({
    required this.id,
    required this.name,
    required this.isActive,
    required this.sort,
    this.parentId,
    required this.restaurantId,
    required this.subcategories,
  });

  final int id;
  final String name;
  final int isActive;
  final int sort;
  final int? parentId;
  final int restaurantId;
  final List<ProductCategory> subcategories;

  @override
  List<Object?> get props => [id];

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
