//

class SocialLink {
  SocialLink({
    required this.id,
    required this.platform,
    required this.value,
  });

  int id;
  String platform;
  String value;

  factory SocialLink.fromJson(Map<String, dynamic> json) => SocialLink(
        id: json["id"],
        platform: json["platform"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "platform": platform,
        "value": value,
      };
}
