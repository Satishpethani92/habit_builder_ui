import 'package:flutter/material.dart';
import 'package:habit_builder_ui/core/constant/color_constant.dart';
import 'package:habit_builder_ui/core/constant/icon_constant.dart';
import 'package:habit_builder_ui/core/constant/image_constant.dart';
import 'package:habit_builder_ui/core/view_model/all_view_model/setting_view_model/setting_screen_view_model.dart';
import 'package:habit_builder_ui/core/view_model/base_view.dart';
import 'package:habit_builder_ui/ui/widget/custom_btn.dart';

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
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 73.0),
            child: Stack(
              children: [
                SizedBox(width: 75, height: 75, child: Image.asset(IconConstant.floutingBack)),
                Positioned(
                  left: 10,
                  top: 7.5,
                  child: FloatingActionButton(
                    backgroundColor: const Color(0xFFFC9D45),
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeNewHabits()));
                      // Navigator.pushNamed(context, Routes.homeNewHabits);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(19.0),
                      child: Image.asset(IconConstant.add),
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 18, top: 45),
                child: Row(
                  children: [
                    SizedBox(height: 70, width: 70, child: Image.asset(IconConstant.homeIcon1)),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.23),
                    const Text(
                      "Settings",
                      style: TextStyle(color: Color(0xFF573353), fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
                          height: MediaQuery.of(context).size.height * 0.16,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          child: Row(children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 25.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Check Your Profile",
                                    style:
                                        TextStyle(color: Color(0xFF573353), fontWeight: FontWeight.w600, fontSize: 22),
                                  ),
                                  const SizedBox(height: 3),
                                  const Text(
                                    "jonathansmith@gmail.com",
                                    style:
                                        TextStyle(color: Color(0xFF573353), fontWeight: FontWeight.w300, fontSize: 15),
                                  ),
                                  const SizedBox(height: 11),
                                  customBtn(
                                    padding: const EdgeInsets.all(4),
                                    height: 50,
                                    width: 100,
                                    text: 'View',
                                    onPressed: () {},
                                  )
                                ],
                              ),
                            ),
                            const Spacer(),
                            ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    bottomRight: Radius.circular(15), topRight: Radius.circular(15)),
                                child: Image.asset(ImageConstant.settingImage)),
                          ])),
                      const Padding(
                        padding: EdgeInsets.only(left: 18.0, top: 15),
                        child: Text(
                          'General',
                          style: TextStyle(color: Color(0xFF573353), fontSize: 19, fontWeight: FontWeight.w500),
                        ),
                      ),
                      generalRow(
                          height: MediaQuery.of(context).size.height * 0.10,
                          image: IconConstant.setting_1,
                          text: 'Notifications',
                          textD: 'Customize notifications'),
                      generalRow(
                          height: MediaQuery.of(context).size.height * 0.10,
                          image: IconConstant.setting_2,
                          text: 'More customization',
                          textD: 'Customize it more to fit your\nusage'),
                      const Padding(
                        padding: EdgeInsets.only(left: 18.0, top: 15),
                        child: Text(
                          'Support',
                          style: TextStyle(color: Color(0xFF573353), fontSize: 19, fontWeight: FontWeight.w500),
                        ),
                      ),
                      supportRow(
                          height: MediaQuery.of(context).size.height * 0.072,
                          image: IconConstant.call,
                          text: 'Contact'),
                      supportRow(
                          height: MediaQuery.of(context).size.height * 0.072,
                          image: IconConstant.meassge,
                          text: 'Feedback'),
                      supportRow(
                          height: MediaQuery.of(context).size.height * 0.072,
                          image: IconConstant.policy,
                          text: 'Privacy Policy'),
                      supportRow(
                          height: MediaQuery.of(context).size.height * 0.072, image: IconConstant.about, text: 'About'),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.18)
                    ],
                  ),
                ),
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

Widget generalRow({double? height, double? iconHeight, double? iconWidth, String? text, String? textD, String? image}) {
  return Container(
    margin: const EdgeInsets.only(top: 10, left: 18, right: 18),
    height: height,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
    child: Row(
      children: [
        Container(
            margin: const EdgeInsets.only(left: 10, right: 20), height: 56, width: 56, child: Image.asset(image ?? '')),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text ?? '',
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Color(0xFF573353))),
            const SizedBox(height: 4),
            Text(textD ?? '',
                style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Color(0xFF573353))),
          ],
        ),
        const Spacer(),
        const Padding(
          padding: EdgeInsets.only(right: 15),
          child: Icon(Icons.arrow_forward_ios, color: Color(0xFF573353), size: 20),
        )
      ],
    ),
  );
}

Widget supportRow({double? height, String? image, String? text}) {
  return Container(
    margin: const EdgeInsets.only(top: 10, left: 18, right: 18),
    height: height,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
    child: Row(
      children: [
        Stack(
          children: [
            Container(
                margin: const EdgeInsets.only(left: 10, right: 20),
                height: 46,
                width: 46,
                child: Image.asset(IconConstant.backside)),
            Positioned(top: 10, left: 20, child: SizedBox(height: 24, width: 24, child: Image.asset(image ?? ''))),
          ],
        ),
        Text(text ?? '', style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Color(0xFF573353))),
        const Spacer(),
        const Padding(
          padding: EdgeInsets.only(right: 15),
          child: Icon(Icons.arrow_forward_ios, color: Color(0xFF573353), size: 20),
        )
      ],
    ),
  );
}
