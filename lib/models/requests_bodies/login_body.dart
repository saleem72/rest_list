//

class LoginBody {
  final String email;
  final String password;

  LoginBody({required this.email, required this.password});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory LoginBody.fromMap(Map<String, dynamic> map) {
    return LoginBody(
      email: map['email'],
      password: map['password'],
    );
  }
}
