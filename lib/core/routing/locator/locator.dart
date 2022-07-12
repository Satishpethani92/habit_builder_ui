import 'package:get_it/get_it.dart';
import 'package:habit_builder_ui/core/view_model/signup_and_login_view_model/signup_and_login_view_model.dart';
import 'package:habit_builder_ui/core/view_model/splash_screen_view_model/splash_screen_view_model.dart';

final locator = GetIt.instance;

setLocator() {
  locator.registerLazySingleton(() => SplashScreenViewModel());
  locator.registerLazySingleton(() => SignupAndLoginScreenViewModel());
}
