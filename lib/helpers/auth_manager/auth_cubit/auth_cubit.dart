import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../screens/auth/login_screen/models/login_data.dart';
import '../../../models/app_user/app_user.dart';
import '../../safe/safe.dart';
import '../models/auth_status.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final Safe safe;
  AppUser? user;
  AuthCubit({
    required this.safe,
  }) : super(AuthState(target: safe.getAuthStatus()));

  endOnboarding() async {
    await safe.endOnBoardingStatus();
    emit(const AuthState(target: AuthStatus.login));
  }

  userLogedIn(LoginData data) {
    user = data.user;
    safe.setToken(data.token);
    emit(const AuthState(target: AuthStatus.home));
  }

  logout() {
    safe.setToken('');
    emit(const AuthState(target: AuthStatus.login));
  }
}
