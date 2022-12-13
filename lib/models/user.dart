import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
//

class User {
  final String name;
  final String phone;
  final UserStatus status;
  final String speed;

  const User({
    required this.name,
    required this.phone,
    required this.status,
    required this.speed,
  });

  User copyWith({
    String? name,
    String? phone,
    UserStatus? status,
    String? speed,
  }) {
    return User(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      status: status ?? this.status,
      speed: speed ?? this.speed,
    );
  }

  @override
  String toString() {
    return 'User(name: $name, phone: $phone, status: $status, speed: $speed)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'phone': phone,
      'status': status.toString(),
      'speed': speed,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      phone: map['phone'] as String,
      status: UserStatus.fromString(map['status'] as String),
      speed: map['speed'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  static const User mockUser = User(
    name: 'Zaki.Alloush',
    phone: '011 6667930',
    status: UserStatus.online,
    speed: '2 MBPS',
  );

  static const User defaultUser = User(
    name: 'Visitor',
    phone: '',
    status: UserStatus.offline,
    speed: '',
  );
}

enum UserStatus {
  online,
  offline;

  static UserStatus fromString(String value) {
    if (value == 'online') {
      return UserStatus.online;
    } else {
      return UserStatus.offline;
    }
  }

  @override
  String toString() {
    switch (this) {
      case UserStatus.offline:
        return 'offline';
      case UserStatus.online:
        return 'online';
    }
  }
}
