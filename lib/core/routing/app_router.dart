import 'package:doctor_appointment/core/routing/routes.dart';
import 'package:doctor_appointment/features/login/ui/login_screen.dart';
import 'package:doctor_appointment/features/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No Route defined for ${settings.name}')),
          ),
        );
    }
  }
}
