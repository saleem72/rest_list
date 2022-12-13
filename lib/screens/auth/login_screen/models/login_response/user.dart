//

import 'language.dart';
import 'resturant.dart';
import 'resturant_package.dart';
import 'resturant_subscription.dart';

class LoginUser {
  LoginUser({
    required this.id,
    required this.fullName,
    required this.email,
    required this.role,
    required this.isActive,
    required this.emailVerifiedAt,
    required this.plan,
    required this.subscription,
    required this.tables,
    required this.profileImage,
    required this.isNotify,
    required this.defaultLanguage,
    required this.defaultCurrency,
    required this.restaurants,
    required this.languages,
    required this.currencies,
    required this.packages,
  });

  int id;
  String fullName;
  String email;
  String role;
  int isActive;
  DateTime emailVerifiedAt;
  String plan;
  ResturantSubscription subscription;
  dynamic tables;
  dynamic profileImage;
  int isNotify;
  String defaultLanguage;
  String defaultCurrency;
  List<Restaurant> restaurants;
  List<ResturantLanguage> languages;
  List<ResturantLanguage> currencies;
  List<ResturantPackage> packages;

  factory LoginUser.fromJson(Map<String, dynamic> json) => LoginUser(
        id: json["id"],
        fullName: json["full_name"],
        email: json["email"],
        role: json["role"],
        isActive: json["is_active"],
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        plan: json["plan"],
        subscription: ResturantSubscription.fromJson(json["subscription"]),
        tables: json["tables"],
        profileImage: json["profile_image"],
        isNotify: json["is_notify"],
        defaultLanguage: json["default_language"],
        defaultCurrency: json["default_currency"],
        restaurants: json["restaurants"] == null
            ? []
            : List<Restaurant>.from(
                json["restaurants"].map((x) => Restaurant.fromJson(x))),
        languages: List<ResturantLanguage>.from(
            json["languages"].map((x) => ResturantLanguage.fromJson(x))),
        currencies: json["currencies"] == null
            ? []
            : List<ResturantLanguage>.from(
                json["currencies"].map((x) => ResturantLanguage.fromJson(x))),
        packages: json["packages"] == null
            ? []
            : List<ResturantPackage>.from(
                json["packages"].map((x) => ResturantPackage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "email": email,
        "role": role,
        "is_active": isActive,
        "email_verified_at": emailVerifiedAt.toIso8601String(),
        "plan": plan,
        "subscription": subscription.toJson(),
        "tables": tables,
        "profile_image": profileImage,
        "is_notify": isNotify,
        "default_language": defaultLanguage,
        "default_currency": defaultCurrency,
        "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
        "languages": List<dynamic>.from(languages.map((x) => x.toJson())),
        "currencies": List<dynamic>.from(currencies.map((x) => x.toJson())),
        "packages": List<dynamic>.from(packages.map((x) => x.toJson())),
      };
}
