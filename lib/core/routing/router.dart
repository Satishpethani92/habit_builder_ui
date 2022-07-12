import 'package:flutter/material.dart';
import 'package:habit_builder_ui/core/routing/routes.dart';
import 'package:habit_builder_ui/ui/introduction_screen/introduction_screen.dart';
import 'package:habit_builder_ui/ui/signup_and_login_screen/signup_and_login_screen.dart';
import 'package:habit_builder_ui/ui/splash_screen/splash_screen.dart';

class PageRouter {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case Routes.introductionScreen:
        return MaterialPageRoute(builder: (context) => const IntroductionScreenView());
      case Routes.signupAndLoginScreen:
        return MaterialPageRoute(builder: (context) => const SignupAndLoginScreen());
      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(child: Text('Page not found')),
          );
        });
    }
  }
}
