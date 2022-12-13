//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../helpers/auth_manager/auth_cubit/auth_cubit.dart';
import '../../helpers/auth_manager/models/auth_status.dart';
import '../auth/login_screen/login_screen.dart';
import '../core/home_screen/home_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AuthScreen();
  }
}

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        switch (state.target) {
          // case AuthStatus.onBoarding:
          //   return  Container();
          case AuthStatus.login:
            return const LoginScreen();
          // case AuthStatus.register:
          //   return Container();
          case AuthStatus.home:
            return const HomeScreen();
        }
      },
    );
  }
}
