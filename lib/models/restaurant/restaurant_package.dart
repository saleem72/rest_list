//

import 'pivot.dart';

class ResturantPackage {
  ResturantPackage({
    required this.id,
    required this.planId,
    required this.plantTypeId,
    required this.price,
    required this.discount,
    required this.discountEndDate,
    required this.pivot,
    required this.nextPlanDate,
    required this.isFree,
    required this.plan,
  });

  int id;
  int planId;
  int plantTypeId;
  int price;
  dynamic discount;
  dynamic discountEndDate;
  Pivot pivot;
  dynamic nextPlanDate;
  String isFree;
  dynamic plan;

  factory ResturantPackage.fromJson(Map<String, dynamic> json) =>
      ResturantPackage(
        id: json["id"],
        planId: json["plan_id"],
        plantTypeId: json["plant_type_id"],
        price: json["price"],
        discount: json["discount"],
        discountEndDate: json["discount_end_date"],
        pivot: Pivot.fromJson(json["pivot"]),
        nextPlanDate: json["next_plan_date"],
        isFree: json["is_free"],
        plan: json["plan"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "plan_id": planId,
        "plant_type_id": plantTypeId,
        "price": price,
        "discount": discount,
        "discount_end_date": discountEndDate,
        "pivot": pivot.toJson(),
        "next_plan_date": nextPlanDate,
        "is_free": isFree,
        "plan": plan,
      };
}
