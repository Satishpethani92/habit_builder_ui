import 'package:flutter/material.dart';
import 'package:habit_builder_ui/core/routing/routes.dart';
import 'package:habit_builder_ui/ui/home_all_screen/home_tracking_habits.dart';
import 'package:habit_builder_ui/ui/home_all_screen/home_bottom.dart';
import 'package:habit_builder_ui/ui/introduction_screen/introduction_screen.dart';
import 'package:habit_builder_ui/ui/login_screen/login_screen.dart';
import 'package:habit_builder_ui/ui/reset_password_screen/reset_password_screen.dart';
import 'package:habit_builder_ui/ui/signup_screen/signup_screen.dart';
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
      case Routes.signupScreen:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      case Routes.resetPasswordScreen:
        return MaterialPageRoute(builder: (context) => const ResetPasswordScreen());
      //home
      case Routes.homeBottom:
        return MaterialPageRoute(builder: (context) => const HomeBottom());
      case Routes.homeTrackingHabits:
        return MaterialPageRoute(builder: (context) => const HomeTrackingHabits());
      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(child: Text('Page not found')),
          );
        });
    }
  }
}
