//

import '../../../../models/app_user/user_permissions.dart';
import '../../../../models/app_user/app_user.dart';

class LoginData {
  AppUser user;
  String token;
  UserPermissions permissions;
  LoginData({
    required this.user,
    required this.token,
    required this.permissions,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user.toJson(),
      'token': token,
      'permissions': permissions.toJson(),
    };
  }

  factory LoginData.fromMap(Map<String, dynamic> map) {
    return LoginData(
      user: AppUser.fromJson(map['user'] as Map<String, dynamic>),
      token: map['token'] as String,
      permissions:
          UserPermissions.fromJson(map['permissions'] as Map<String, dynamic>),
    );
  }

  LoginData fromJson(Map<String, dynamic> m) {
    return LoginData.fromMap(m);
  }

  Map<String, dynamic> toJson() {
    return toMap();
  }
}
