import 'package:flutter/material.dart';
import 'package:habit_builder_ui/core/constant/color_constant.dart';
import 'package:habit_builder_ui/core/constant/icon_constant.dart';
import 'package:habit_builder_ui/core/view_model/base_view.dart';
import 'package:habit_builder_ui/core/view_model/setting_view_model/setting_screen_view_model.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  SettingScreenViewModel? model;

  @override
  Widget build(BuildContext context) {
    return BaseView<SettingScreenViewModel>(
      builder: (buildContext, model, child) {
        return Scaffold(
          backgroundColor: ColorConstant.logInBackGround,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 18, top: 45),
                child: Row(
                  children: [
                    SizedBox(height: 70, width: 70, child: Image.asset(IconConstant.homeIcon1)),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.18),
                    const Text(
                      "Setting",
                      style: TextStyle(color: Color(0xFF573353), fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
      onModelReady: (model) {
        this.model = model;
      },
    );
  }
}
