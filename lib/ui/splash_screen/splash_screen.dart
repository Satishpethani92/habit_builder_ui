import 'dart:async';

import 'package:flutter/material.dart';
import 'package:habit_builder_ui/core/constant/image_constant.dart';
import 'package:habit_builder_ui/core/constant/text_style_constant.dart';
import 'package:habit_builder_ui/core/routing/routes.dart';
import 'package:habit_builder_ui/core/view_model/base_view.dart';
import 'package:habit_builder_ui/core/view_model/splash_screen_view_model/splash_screen_view_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushNamedAndRemoveUntil(context, Routes.introductionScreen, (route) => false);
      },
    );
  }

  SplashScreenViewModel? model;

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashScreenViewModel>(builder: (buildContext, model, child) {
      return Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Image.asset(ImageConstant.splashScreen, fit: BoxFit.cover),
              Padding(
                  padding: const EdgeInsets.only(left: 70.0, right: 70.0, top: 150),
                  child: Column(
                    children: const [
                      Text("WELCOME TO", style: TextStyleConstant.splashScreenStyle),
                      Text("MONUMENTAL", style: TextStyleConstant.splashScreenStyle),
                      Text("HABITS", style: TextStyleConstant.splashScreenStyle),
                    ],
                  )),
            ],
          ),
        ),
      );
    }, onModelReady: (model) {
      this.model = model;
    });
  }
}
