import 'package:flutter/material.dart';
import 'package:habit_builder_ui/core/constant/image_constant.dart';
import 'package:habit_builder_ui/core/routing/routes.dart';
import 'package:habit_builder_ui/ui/widget/custom_intro.dart';
import 'package:habit_builder_ui/ui/widget/skip_next_btn.dart';
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
    pageController.addListener(
      () {
        setState(() {
          index = pageController.page!;
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Stack(
          children: [
            PageView(
              controller: pageController,
              children: [
                introPageImage(
                    text: 'WELCOME TO', titleText: 'MONUMENTAL HABIT', image: ImageConstant.introductionI1, height: 60),
                introPageImage(
                    height: 80,
                    text: 'CREATE NEW',
                    titleText: 'HABIT EASILY',
                    image: ImageConstant.introductionI2,
                    heightU: 40,
                    heightD: 70),
                introPageImage(
                    height: 80,
                    text: 'KEEP TRACK OF YOUR',
                    titleText: 'PROGRESS',
                    image: ImageConstant.introductionI3,
                    heightU: 40,
                    heightD: 70),
                introPageImage(
                    buttonShow: true,
                    onPressed: () {
                      // Navigator.pushNamed(context, Routes.signupAndLoginScreen);
                      Navigator.pushNamedAndRemoveUntil(context, Routes.signupAndLoginScreen, (route) => false);
                    },
                    height: 80,
                    text: 'JOIN A SUPPORTIVE',
                    titleText: 'COMMUNITY',
                    image: ImageConstant.introductionI4,
                    heightU: 80,
                    heightD: 100),
              ],
            ),
            skipNextBtn(
                text: index == 3.0 ? '' : 'Skip',
                alignment: Alignment.bottomLeft,
                onPressed: () {
                  pageController.animateToPage(3, duration: const Duration(milliseconds: 1), curve: Curves.ease);
                }),
            index != 3
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 55, left: 20, right: 20),
                      child: SmoothPageIndicator(
                        controller: pageController,
                        count: 4,
                        effect: const ExpandingDotsEffect(
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
                        duration: const Duration(milliseconds: 1), curve: Curves.fastLinearToSlowEaseIn);
                  }
                }),
          ],
        ),
      ),
    );
  }
}
