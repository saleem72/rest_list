//

class Pivot {
  Pivot({
    required this.userId,
    required this.packageId,
    required this.id,
    required this.status,
    required this.startDate,
    required this.endDate,
    required this.createdAt,
    required this.updatedAt,
  });

  int userId;
  int packageId;
  int id;
  String status;
  DateTime startDate;
  dynamic endDate;
  DateTime createdAt;
  DateTime updatedAt;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        userId: json["user_id"],
        packageId: json["package_id"],
        id: json["id"],
        status: json["status"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: json["end_date"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "package_id": packageId,
        "id": id,
        "status": status,
        "start_date": startDate.toIso8601String(),
        "end_date": endDate,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
