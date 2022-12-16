//

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../restaurant/restaurant.dart';
import '../restaurant/restaurant_currency.dart';
import '../restaurant/restaurant_language.dart';
import '../restaurant/restaurant_package.dart';
import 'user_subscription.dart';

@immutable
class AppUser extends Equatable {
  const AppUser({
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

  final int id;
  final String fullName;
  final String email;
  final String role;
  final int isActive;
  final DateTime emailVerifiedAt;
  final String plan;
  final UserSubscription subscription;
  final dynamic tables;
  final dynamic profileImage;
  final int isNotify;
  final String defaultLanguage;
  final String defaultCurrency;
  final List<Restaurant> restaurants;
  final List<ResturantLanguage> languages;
  final List<ResturantCurrency> currencies;
  final List<ResturantPackage> packages;

  @override
  List<Object?> get props => [id];

  factory AppUser.fromJson(Map<String, dynamic> json) => AppUser(
        id: json["id"],
        fullName: json["full_name"],
        email: json["email"],
        role: json["role"],
        isActive: json["is_active"],
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        plan: json["plan"],
        subscription: UserSubscription.fromJson(json["subscription"]),
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
            : List<ResturantCurrency>.from(
                json["currencies"].map((x) => ResturantCurrency.fromJson(x))),
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
