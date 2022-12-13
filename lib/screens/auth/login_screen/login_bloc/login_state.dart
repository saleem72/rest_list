// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    // const Email.pure(), //
    this.email = const Email.dirty('logical9447@gmail.com'),
    // const Password.pure(), //
    this.password = const Password.dirty('logical944'),
    this.status = FormzStatus.pure,
    this.failure,
  });

  final Email email;
  final Password password;
  final FormzStatus status;
  final Failure? failure;

  LoginState copyWith({
    Email? email,
    Password? password,
    FormzStatus? status,
    Failure? failure,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      failure: failure,
    );
  }

  @override
  List<Object> get props => [email, password, status];
}
