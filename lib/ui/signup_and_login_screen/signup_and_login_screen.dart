import 'package:flutter/material.dart';
import 'package:habit_builder_ui/core/view_model/base_view.dart';
import 'package:habit_builder_ui/core/view_model/signup_and_login_view_model/signup_and_login_view_model.dart';

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
          body: Center(
            child: Container(
              width: 100,
              height: 100,
              color: Colors.yellow,
            ),
          ),
        );
      },
      onModelReady: (model) {
        this.model = model;
      },
    );
  }
}
