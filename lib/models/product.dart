//

// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

typedef ProductsList = List<Product>;

@immutable
class Product extends Equatable {
  const Product({
    required this.id,
    required this.name,
    this.description,
    this.image,
    this.sliderImage,
    this.size,
    this.expectedTime,
    this.price,
    this.discount,
    this.sort,
    this.isAvailable,
    this.categoryId,
    this.restaurantId,
    this.offer,
    this.offerId,
  });

  final int id;
  final String name;
  final String? description;
  final String? image;
  final String? sliderImage;
  final String? size;
  final int? expectedTime;
  final double? price;
  final double? discount;
  final int? sort;
  final int? isAvailable;
  final int? categoryId;
  final int? restaurantId;
  final String? offer;
  final String? offerId;

  @override
  List<Object?> get props => [id];

  @override
  String toString() => 'Product(name: $name)';

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"] as String? ?? 'unKNown',
        description: json["description"],
        image: json["image"],
        sliderImage: json["slider_image"],
        size: json["size"],
        expectedTime: json["expected_time"], // discount
        price: json["price"] is int
            ? (json['price'] as int).toDouble()
            : json["price"],
        discount: json["discount"] is int
            ? (json['discount'] as int).toDouble()
            : json["discount"],
        sort: json["sort"],
        isAvailable: json["is_available"],
        categoryId: json["category_id"],
        restaurantId: json["restaurant_id"],
        offer: json["offer"],
        offerId: json["offer_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "slider_image": sliderImage,
        "size": size,
        "expected_time": expectedTime,
        "price": price,
        "discount": discount,
        "sort": sort,
        "is_available": isAvailable,
        "category_id": categoryId,
        "restaurant_id": restaurantId,
        "offer": offer,
        "offer_id": offerId,
      };
}
