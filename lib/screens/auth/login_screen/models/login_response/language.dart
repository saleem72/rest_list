//

class ResturantLanguage {
  ResturantLanguage({
    required this.id,
    required this.name,
    required this.code,
    required this.isActive,
  });

  int id;
  String name;
  String code;
  int isActive;

  factory ResturantLanguage.fromJson(Map<String, dynamic> json) =>
      ResturantLanguage(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        isActive: json["is_active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "is_active": isActive,
      };
}
