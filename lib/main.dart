import 'package:flutter/material.dart';
import 'package:habit_builder_ui/core/routing/locator/locator.dart';
import 'package:habit_builder_ui/core/routing/router.dart';
import 'package:habit_builder_ui/core/routing/routes.dart';

void main() {
  setLocator();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashScreen,
      onGenerateRoute: PageRouter.generateRoutes,
    );
  }
}
