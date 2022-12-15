// To parse this JSON data, do
//
//     final paginate = paginateFromJson(jsonString);

import 'dart:convert';

Paginate paginateFromJson(String str) => Paginate.fromJson(json.decode(str));

String paginateToJson(Paginate data) => json.encode(data.toJson());

class Paginate {
  Paginate({
    required this.currentPage,
    required this.from,
    required this.to,
    required this.total,
    required this.totalPages,
    required this.perPage,
  });

  int currentPage;
  int from;
  int to;
  int total;
  int totalPages;
  int perPage;

  factory Paginate.fromJson(Map<String, dynamic> json) => Paginate(
        currentPage: json["currentPage"],
        from: json["from"],
        to: json["to"],
        total: json["total"],
        totalPages: json["total_pages"],
        perPage: json["per_page"],
      );

  Map<String, dynamic> toJson() => {
        "currentPage": currentPage,
        "from": from,
        "to": to,
        "total": total,
        "total_pages": totalPages,
        "per_page": perPage,
      };
}
