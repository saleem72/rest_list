part of 'auth_cubit.dart';

class AuthState extends Equatable {
  const AuthState({
    required this.target,
  });
  final AuthStatus target;
  @override
  List<Object> get props => [];
}
