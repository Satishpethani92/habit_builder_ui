import 'package:flutter/material.dart';
import 'package:habit_builder_ui/core/constant/color_constant.dart';
import 'package:habit_builder_ui/core/constant/icon_constant.dart';
import 'package:habit_builder_ui/core/constant/image_constant.dart';
import 'package:habit_builder_ui/core/constant/text_style_constant.dart';
import 'package:habit_builder_ui/core/routing/routes.dart';
import 'package:habit_builder_ui/core/view_model/base_view.dart';
import 'package:habit_builder_ui/core/view_model/reset_password_view_model/reset_password_view_model.dart';
import 'package:habit_builder_ui/ui/widget/custom_btn.dart';
import 'package:habit_builder_ui/ui/widget/custom_text_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  ResetPasswordViewModel? model;

  @override
  Widget build(BuildContext context) {
    return BaseView<ResetPasswordViewModel>(
      builder: (buildContext, model, child) {
        return Scaffold(
            backgroundColor: ColorConstant.logInBackGround,
            body: Column(
              children: [
                Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(top: 33, left: 7),
                        height: 70,
                        width: 80,
                        child: InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Image.asset(IconConstant.resetScreenIcon))),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 35),
                  child: const Text("FORGOT YOUR PASSWORD?",
                      style: TextStyleConstant.resetText, textAlign: TextAlign.center),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  height: 280,
                  width: 414,
                  child: Image.asset(ImageConstant.resetPasswordImage),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, right: 20, left: 20),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(top: 18.0, bottom: 20),
                            child: Text(
                              "Enter your registered email below to receive\n password reset instruction",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Color(0xFF573353), fontSize: 14),
                            ),
                          )
                        ],
                      ),
                      customTextField(
                          padding: const EdgeInsets.only(left: 17, right: 17),
                          margin: const EdgeInsets.only(left: 22, right: 22, top: 8),
                          color: ColorConstant.textField,
                          obscureText: false,
                          style: const TextStyle(fontSize: 18, color: Color(0xFFFC9D45))),
                      customBtn(
                          margin: const EdgeInsets.only(left: 22, right: 22, top: 15),
                          text: 'Send Reset Link',
                          onPressed: () {}),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.11),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: RichText(
                      text: const TextSpan(
                          text: "Remember password?",
                          style: TextStyle(color: ColorConstant.loginIcon),
                          children: [
                        TextSpan(
                            text: ' Login',
                            style: TextStyle(color: ColorConstant.loginIcon, fontWeight: FontWeight.w600, fontSize: 16))
                      ])),
                ),
              ],
            ));
      },
      onModelReady: (model) {
        this.model = model;
      },
    );
  }
}
