//

import 'dart:convert';

class GetProductEntries {
  final int restaurantId;
  final int categoryId;
  final int page;
  final int perPage;
  GetProductEntries({
    required this.restaurantId,
    required this.categoryId,
    required this.page,
    required this.perPage,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'restaurant_id': restaurantId.toString(),
      'category_id': categoryId.toString(),
      'page': page.toString(),
      'per_page': perPage.toString(),
    };
  }

  factory GetProductEntries.fromMap(Map<String, dynamic> map) {
    return GetProductEntries(
      restaurantId: map['restaurant_id'] as int,
      categoryId: map['category_id'] as int,
      page: map['page'] as int,
      perPage: map['per_page'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetProductEntries.fromJson(String source) =>
      GetProductEntries.fromMap(json.decode(source) as Map<String, dynamic>);
}
