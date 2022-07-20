import 'package:flutter/material.dart';
import 'package:habit_builder_ui/core/constant/color_constant.dart';
import 'package:habit_builder_ui/core/constant/icon_constant.dart';
import 'package:habit_builder_ui/core/constant/image_constant.dart';
import 'package:habit_builder_ui/core/constant/text_style_constant.dart';
import 'package:habit_builder_ui/core/view_model/base_view.dart';
import 'package:habit_builder_ui/core/view_model/splash_screen_view_model/splash_screen_view_model.dart';
import 'package:habit_builder_ui/ui/widget/custom_btn.dart';
import 'package:habit_builder_ui/ui/widget/custom_check_box.dart';
import 'package:habit_builder_ui/ui/widget/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SplashScreenViewModel? model;

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashScreenViewModel>(
      builder: (buildContext, model, child) {
        return Scaffold(
          backgroundColor: ColorConstant.singUpBackGround,
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 60),
                    width: 205,
                    height: 195,
                    child: Image.asset(ImageConstant.signupLogo),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text(
                  "CREATE YOUR ACCOUNT",
                  style: TextStyleConstant.signUpText,
                ),
              ),
              const SizedBox(height: 20),
              customTextField(
                margin: const EdgeInsets.only(left: 13, right: 13, top: 8),
                style: const TextStyle(fontSize: 18, color: Color(0xFFFC9D45)),
                obscureText: false,
                color: ColorConstant.singUpTextField,
                prefix: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(IconConstant.account),
                ),
              ),
              customTextField(
                margin: const EdgeInsets.only(left: 13, right: 13, top: 8),
                style: const TextStyle(fontSize: 18, color: Color(0xFF573353)),
                obscureText: false,
                color: ColorConstant.singUpTextField,
                prefix: Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: Image.asset(IconConstant.signupEmail),
                ),
              ),
              customTextField(
                  margin: const EdgeInsets.only(left: 13, right: 13, top: 8),
                  prefix: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset(IconConstant.lock),
                  ),
                  color: ColorConstant.singUpTextField,
                  obscureText: model.obscureText,
                  iconBtn: InkWell(
                      onTap: () {
                        model.obscureText = !model.obscureText;
                        setState(() {});
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Text(
                          model.obscureText ? 'Show' : 'Hide',
                          style: TextStyleConstant.hideShowPass,
                        ),
                      )),
                  prefixIcon: false,
                  style: const TextStyle(fontSize: 18, color: Color(0xFF573353))),
              const SizedBox(height: 10),
              customCheckBox(
                  text: "Keep me signed in",
                  value: model.isChecked,
                  onChanged: (bool? value) {
                    model.isChecked = value!;
                    model.updateUI();
                  }),
              customCheckBox(
                  text: "Email me about special pricing and more",
                  value: model.isChecked1,
                  onChanged: (bool? value) {
                    model.isChecked1 = value!;
                    model.updateUI();
                  }),
              customBtn(
                  margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
                  text: 'Create Account',
                  onPressed: () {}),
              Padding(
                padding: const EdgeInsets.only(top: 22, bottom: 22),
                child: Row(children: <Widget>[
                  Expanded(
                      child: Divider(
                    color: const Color(0xFF573353),
                    endIndent: MediaQuery.of(context).size.width * 0.015,
                    indent: MediaQuery.of(context).size.width * 0.05,
                  )),
                  Text("Or sign in with", style: TextStyle(color: const Color(0xFF573353).withOpacity(0.6))),
                  Expanded(
                      child: Divider(
                    color: const Color(0xFF573353),
                    endIndent: MediaQuery.of(context).size.width * 0.05,
                    indent: MediaQuery.of(context).size.width * 0.015,
                  )),
                ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(height: 27, width: 27, child: Image.asset(IconConstant.loginGoogleIcon)),
                        const Text('Google', style: TextStyleConstant.loginFBText),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(height: 27, width: 27, child: Image.asset(IconConstant.loginFBIcon)),
                        const Text('Facebook', style: TextStyleConstant.loginFBText),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: RichText(
                    text: const TextSpan(
                        text: "Already have an account?",
                        style: TextStyle(color: ColorConstant.loginIcon),
                        children: [
                      TextSpan(
                          text: ' Sign In',
                          style: TextStyle(color: ColorConstant.loginIcon, fontWeight: FontWeight.w600, fontSize: 16))
                    ])),
              ),
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
