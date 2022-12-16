//

class UserPermissions {
  UserPermissions({
    required this.qrScan,
    required this.storage,
    required this.socialMedia,
    required this.language,
    required this.currency,
    required this.offer,
    required this.branch,
    required this.techSupport,
    required this.theme,
    required this.app,
    required this.item,
  });

  bool qrScan;
  bool storage;
  bool socialMedia;
  bool language;
  bool currency;
  bool offer;
  bool branch;
  bool techSupport;
  bool theme;
  bool app;
  bool item;

  factory UserPermissions.fromJson(Map<String, dynamic> json) =>
      UserPermissions(
        qrScan: json["qr_scan"] as bool? ?? false,
        storage: json["storage"] as bool? ?? false,
        socialMedia: json["social_media"] as bool? ?? false,
        language: json["language"] as bool? ?? false,
        currency: json["currency"] as bool? ?? false,
        offer: json["offer"] as bool? ?? false,
        branch: json["branch"] as bool? ?? false,
        techSupport: json["tech_support"] as bool? ?? false,
        theme: json["theme"] as bool? ?? false,
        app: json["app"] as bool? ?? false,
        item: json["item"] as bool? ?? false,
      );

  Map<String, dynamic> toJson() => {
        "qr_scan": qrScan,
        "storage": storage,
        "social_media": socialMedia,
        "language": language,
        "currency": currency,
        "offer": offer,
        "branch": branch,
        "tech_support": techSupport,
        "theme": theme,
        "app": app,
        "item": item,
      };
}
