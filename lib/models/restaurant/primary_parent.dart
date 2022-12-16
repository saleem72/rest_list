//

class PrimaryParent {
  PrimaryParent({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory PrimaryParent.fromJson(Map<String, dynamic> json) => PrimaryParent(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
