import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:habit_builder_ui/core/constant/image_constant.dart';
import 'package:habit_builder_ui/core/routing/routes.dart';
import 'package:habit_builder_ui/ui/widget/custom_intro.dart';
import 'package:habit_builder_ui/ui/widget/skip_next_btn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroductionScreenView extends StatefulWidget {
  const IntroductionScreenView({Key? key}) : super(key: key);

  @override
  State<IntroductionScreenView> createState() => _IntroductionScreenViewState();
}

class _IntroductionScreenViewState extends State<IntroductionScreenView> {
  PageController pageController = PageController();
  var index = 0.0;

  @override
  void initState() {
    super.initState();
    checkFirstScreen();
    pageController.addListener(
      () {
        setState(() {
          index = pageController.page!;
        });
      },
    );
  }

  Future checkFirstScreen() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool firstSeen = (pref.getBool("seen") ?? false);
    print(firstSeen);
    if (firstSeen) {
      Navigator.pushNamed(context, Routes.signupAndLoginScreen);
    } else {
      await pref.setBool("seen", true);
      if (kDebugMode) {
        print(pref.getBool("seen"));
      }
      Navigator.pushNamed(context, Routes.introductionScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SafeArea(
              child: PageView(
                controller: pageController,
                children: [
                  introPageImage(text: 'WELCOME TO MONUMENTAL HABIT', image: ImageConstant.introductionI1),
                  introPageImage(
                      text: 'CREATE NEW HABIT EASILY',
                      image: ImageConstant.introductionI2,
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.05,
                          bottom: MediaQuery.of(context).size.height * 0.05)),
                  introPageImage(
                      text: 'KEEP TRACK OF YOUR PROGRESS',
                      image: ImageConstant.introductionI3,
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.05,
                          bottom: MediaQuery.of(context).size.height * 0.05)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      introPageImage(
                        text: 'JOIN A SUPPORTIVE COMMUNITY',
                        image: ImageConstant.introductionI4,
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.060,
                            bottom: MediaQuery.of(context).size.height * 0.124),
                        buttonShow: true,
                        onPressed: () {
                          // Navigator.pushNamed(context, Routes.signupAndLoginScreen);
                          Navigator.pushNamedAndRemoveUntil(context, Routes.signupAndLoginScreen, (route) => false);
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              skipNextBtn(
                  text: index == 3.0 ? '' : 'Skip',
                  alignment: Alignment.bottomLeft,
                  onPressed: () {
                    pageController.animateToPage(3, duration: const Duration(milliseconds: 1000), curve: Curves.ease);
                  }),
              index != 3
                  ? Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 55, left: 20, right: 20),
                        child: SmoothPageIndicator(
                          controller: pageController,
                          count: 4,
                          effect: const ScrollingDotsEffect(
                            activeDotColor: Color(0xFF573353),
                            dotColor: Color(0xFFF9B566),
                            dotHeight: 10,
                            dotWidth: 10,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
              skipNextBtn(
                  text: index == 3.0 ? '' : 'Next',
                  alignment: Alignment.bottomRight,
                  onPressed: () {
                    if (index != 3.0) {
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 1500), curve: Curves.fastLinearToSlowEaseIn);
                    }
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
