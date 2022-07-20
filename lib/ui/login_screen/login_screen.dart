import 'package:flutter/material.dart';
import 'package:habit_builder_ui/core/constant/color_constant.dart';
import 'package:habit_builder_ui/core/constant/icon_constant.dart';
import 'package:habit_builder_ui/core/constant/image_constant.dart';
import 'package:habit_builder_ui/core/constant/text_style_constant.dart';
import 'package:habit_builder_ui/core/routing/routes.dart';
import 'package:habit_builder_ui/core/view_model/base_view.dart';
import 'package:habit_builder_ui/core/view_model/login_view_model/login_view_model.dart';
import 'package:habit_builder_ui/ui/widget/custom_btn.dart';
import 'package:habit_builder_ui/ui/widget/custom_text_field.dart';

class SignupAndLoginScreen extends StatefulWidget {
  const SignupAndLoginScreen({Key? key}) : super(key: key);

  @override
  State<SignupAndLoginScreen> createState() => _SignupAndLoginScreenState();
}

class _SignupAndLoginScreenState extends State<SignupAndLoginScreen> {
  SignupAndLoginScreenViewModel? model;

  @override
  Widget build(BuildContext context) {
    return BaseView<SignupAndLoginScreenViewModel>(
      builder: (buildContext, model, child) {
        return Scaffold(
          backgroundColor: ColorConstant.logInBackGround,
          body: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.asset(ImageConstant.logInBackGround),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 455,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: ColorConstant.logInBackGround,
                    boxShadow: [
                      BoxShadow(
                        color: ColorConstant.logInBackGround,
                        blurRadius: 150,
                        spreadRadius: 120,
                        offset: Offset(-30, -20),
                      )
                    ],
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: Container(
                      margin: const EdgeInsets.only(top: 23, right: 10),
                      width: 70,
                      height: 70,
                      child: Image.asset(IconConstant.loginIcon, color: ColorConstant.loginIcon))),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 308, right: 25, left: 25),
                    child: const Text("WELCOME TO MONUMENTAL HABITS",
                        style: TextStyleConstant.loginText,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15, right: 15, top: 40),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(height: 27, width: 27, child: Image.asset(IconConstant.loginGoogleIcon)),
                        const Text('Continue with google', style: TextStyleConstant.loginGoogleText),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(height: 27, width: 27, child: Image.asset(IconConstant.loginFBIcon)),
                        const Text('Continue with facebook', style: TextStyleConstant.loginFBText),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.029),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.39,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                              child: Text("Log in with email", style: TextStyleConstant.loginWithEmailText),
                            ),
                          ],
                        ),
                        Divider(color: Colors.orangeAccent.shade100, height: 1),
                        customTextField(
                            margin: const EdgeInsets.only(left: 13, right: 13, top: 8),
                            prefix: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Image.asset(IconConstant.email),
                            ),
                            color: ColorConstant.textField,
                            obscureText: false,
                            prefixIcon: true,
                            style: const TextStyle(fontSize: 18, color: Color(0xFFFC9D45))),
                        customTextField(
                            margin: const EdgeInsets.only(left: 13, right: 13, top: 8),
                            prefix: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Image.asset(IconConstant.lock),
                            ),
                            color: ColorConstant.textField,
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
                        customBtn(
                            margin: const EdgeInsets.only(left: 15, right: 15, top: 25),
                            text: 'Login',
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(context, Routes.homeBottom, (route) => false);
                            }),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.028),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.resetPasswordScreen);
                          },
                          child: const Text(
                            "Forget password?",
                            style: TextStyle(color: ColorConstant.loginIcon, decoration: TextDecoration.underline),
                          ),
                        ),
                        const SizedBox(height: 8),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.signupScreen);
                          },
                          child: RichText(
                              text: const TextSpan(
                                  text: "Don't have an account?",
                                  style: TextStyle(color: ColorConstant.loginIcon),
                                  children: [
                                TextSpan(
                                    text: ' Sign up',
                                    style: TextStyle(
                                        color: ColorConstant.loginIcon, fontWeight: FontWeight.w600, fontSize: 16))
                              ])),
                        )
                      ],
                    ),
                  )
                ],
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
