//

class UserSubscription {
  UserSubscription({
    required this.planId,
    required this.currencyId,
    required this.duration,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.expired,
    required this.nextPlanId,
    required this.autoRenew,
    required this.paymentMethod,
    required this.receivedAmount,
    required this.customDuration,
    required this.offers,
    required this.discounts,
    required this.sliders,
    required this.reservations,
    required this.inHouseOrders,
    required this.qrTemplate,
    required this.theme,
  });

  int planId;
  int? currencyId;
  String? duration;
  DateTime startDate;
  DateTime endDate;
  String status;
  bool expired;
  dynamic nextPlanId;
  bool autoRenew;
  String paymentMethod;
  int receivedAmount;
  bool customDuration;
  bool offers;
  bool discounts;
  bool sliders;
  bool reservations;
  bool inHouseOrders;
  bool qrTemplate;
  bool theme;

  factory UserSubscription.fromJson(Map<String, dynamic> json) =>
      UserSubscription(
        planId: json["plan_id"],
        currencyId: json["currency_id"],
        duration: json["duration"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        status: json["status"],
        expired: json["expired"],
        nextPlanId: json["next_plan_id"],
        autoRenew: json["auto_renew"],
        paymentMethod: json["payment_method"],
        receivedAmount: json["received_amount"],
        customDuration: json["custom_duration"],
        offers: json["offers"],
        discounts: json["discounts"],
        sliders: json["sliders"],
        reservations: json["reservations"],
        inHouseOrders: json["in_house_orders"],
        qrTemplate: json["qr_template"],
        theme: json["theme"],
      );

  Map<String, dynamic> toJson() => {
        "plan_id": planId,
        "currency_id": currencyId,
        "duration": duration,
        "start_date": startDate.toIso8601String(),
        "end_date": endDate.toIso8601String(),
        "status": status,
        "expired": expired,
        "next_plan_id": nextPlanId,
        "auto_renew": autoRenew,
        "payment_method": paymentMethod,
        "received_amount": receivedAmount,
        "custom_duration": customDuration,
        "offers": offers,
        "discounts": discounts,
        "sliders": sliders,
        "reservations": reservations,
        "in_house_orders": inHouseOrders,
        "qr_template": qrTemplate,
        "theme": theme,
      };
}
