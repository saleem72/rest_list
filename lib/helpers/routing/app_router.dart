//

import 'package:flutter/material.dart';

import 'nav_links.dart';
import 'routing_error_screen.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic> generate(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      // case NavLinks.initial:
      //   return MaterialPageRoute(builder: (_) => const LandingScreen());
      // case NavLinks.identifyingAccount:
      //   return MaterialPageRoute(
      //       builder: (_) => const IdentifyingAccountScreen());
      // case NavLinks.verificationCode:
      //   return MaterialPageRoute(builder: (_) => const VerificationScreen());
      // case NavLinks.resetPassword:
      //   return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
      default:
        final String errorMessage = '${settings.name} is not valid route';
        return MaterialPageRoute(
            builder: (_) => RoutingErrorScreen(errorMessage: errorMessage));
    }
  }
}
