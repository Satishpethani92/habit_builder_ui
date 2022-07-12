import 'package:get_it/get_it.dart';
import 'package:habit_builder_ui/core/view_model/login_view_model/login_view_model.dart';
import 'package:habit_builder_ui/core/view_model/reset_password_view_model/reset_password_view_model.dart';
import 'package:habit_builder_ui/core/view_model/signup_screen_view_model/sigup_screen_view_model.dart';
import 'package:habit_builder_ui/core/view_model/splash_screen_view_model/splash_screen_view_model.dart';

final locator = GetIt.instance;

setLocator() {
  locator.registerLazySingleton(() => SplashScreenViewModel());
  locator.registerLazySingleton(() => SignupAndLoginScreenViewModel());
  locator.registerLazySingleton(() => SignupScreenViewModel());
  locator.registerLazySingleton(() => ResetPasswordViewModel());
}
