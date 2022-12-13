//

import 'primary_parent.dart';
import 'social_link.dart';
import 'user.dart';

class Restaurant {
  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.address,
    required this.isPrimary,
    required this.phone,
    required this.lat,
    required this.lng,
    required this.defaultLanguage,
    required this.openingHour,
    required this.closingHour,
    required this.image,
    required this.qr,
    required this.qrCode,
    required this.qrUrl,
    required this.vcard,
    required this.myLogo,
    required this.brandIcon,
    required this.themeColor,
    required this.isRead,
    required this.socialMediaTemplate,
    required this.webViewTemplate,
    required this.isActive,
    required this.userId,
    required this.socialLinks,
    required this.user,
    required this.telegramBotLink,
    required this.defaultLanguageId,
    required this.defaultCurrencyId,
    required this.primaryParent,
  });

  int id;
  String name;
  String description;
  String address;
  int isPrimary;
  String phone;
  String lat;
  String lng;
  String defaultLanguage;
  String openingHour;
  String closingHour;
  String image;
  String qr;
  String qrCode;
  String qrUrl;
  String vcard;
  String myLogo;
  String brandIcon;
  String themeColor;
  int isRead;
  int socialMediaTemplate;
  String webViewTemplate;
  int isActive;
  int userId;
  List<SocialLink> socialLinks;
  LoginUser user;
  String telegramBotLink;
  int defaultLanguageId;
  int defaultCurrencyId;
  PrimaryParent primaryParent;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        address: json["address"],
        isPrimary: json["is_primary"],
        phone: json["phone"],
        lat: json["lat"] as String? ?? '',
        lng: json["lng"] as String? ?? '',
        defaultLanguage: json["default_language"],
        openingHour: json["opening_hour"],
        closingHour: json["closing_hour"],
        image: json["image"] ?? '',
        qr: json["qr"],
        qrCode: json["qr_code"],
        qrUrl: json["qr_url"],
        vcard: json["vcard"] ?? '',
        myLogo: json["my_logo"] ?? '',
        brandIcon: json["brand_icon"] ?? '',
        themeColor: json["theme_color"] ?? '',
        isRead: json["is_read"],
        socialMediaTemplate: json["social_media_template"],
        webViewTemplate: json["web_view_template"],
        isActive: json["is_active"],
        userId: json["user_id"],
        socialLinks: List<SocialLink>.from(
            json["social_links"].map((x) => SocialLink.fromJson(x))),
        user: LoginUser.fromJson(json["user"]),
        telegramBotLink: json["telegram_bot_link"],
        defaultLanguageId: json["default_language_id"],
        defaultCurrencyId: json["default_currency_id"],
        primaryParent: PrimaryParent.fromJson(json["primary_parent"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "address": address,
        "is_primary": isPrimary,
        "phone": phone,
        "lat": lat,
        "lng": lng,
        "default_language": defaultLanguage,
        "opening_hour": openingHour,
        "closing_hour": closingHour,
        "image": image,
        "qr": qr,
        "qr_code": qrCode,
        "qr_url": qrUrl,
        "vcard": vcard,
        "my_logo": myLogo,
        "brand_icon": brandIcon,
        "theme_color": themeColor,
        "is_read": isRead,
        "social_media_template": socialMediaTemplate,
        "web_view_template": webViewTemplate,
        "is_active": isActive,
        "user_id": userId,
        "social_links": List<dynamic>.from(socialLinks.map((x) => x.toJson())),
        "user": user.toJson(),
        "telegram_bot_link": telegramBotLink,
        "default_language_id": defaultLanguageId,
        "default_currency_id": defaultCurrencyId,
        "primary_parent": primaryParent.toJson(),
      };
}
