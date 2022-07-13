import 'package:flutter/material.dart';
import 'package:habit_builder_ui/core/constant/color_constant.dart';
import 'package:habit_builder_ui/core/constant/icon_constant.dart';
import 'package:habit_builder_ui/core/constant/image_constant.dart';
import 'package:habit_builder_ui/core/constant/text_style_constant.dart';
import 'package:habit_builder_ui/core/model_class/home_screen_model.dart';
import 'package:habit_builder_ui/core/view_model/base_view.dart';
import 'package:habit_builder_ui/core/view_model/home_all_view_model/home_tracking_view_model.dart';

class HomeTrackingHabits extends StatefulWidget {
  const HomeTrackingHabits({Key? key}) : super(key: key);

  @override
  State<HomeTrackingHabits> createState() => _HomeTrackingHabitsState();
}

class _HomeTrackingHabitsState extends State<HomeTrackingHabits> {
  HomeTrackingHabitViewModel? model;

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeTrackingHabitViewModel>(
      builder: (buildContext, model, child) {
        return Scaffold(
          backgroundColor: ColorConstant.logInBackGround,
          body: Stack(
            children: [
              Positioned(bottom: 0, child: Image.asset(ImageConstant.homeTrackingBackGround)),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///first row
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 18, top: 45),
                    child: Row(
                      children: [
                        SizedBox(height: 70, width: 70, child: Image.asset(IconConstant.homeIcon1)),
                        const Spacer(),
                        const Text(
                          "Homepage",
                          style: TextStyle(color: Color(0xFF573353), fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        SizedBox(height: 55, width: 55, child: Image.asset(IconConstant.homeIcon2))
                      ],
                    ),
                  ),

                  ///image and text
                  Container(
                    margin: const EdgeInsets.only(right: 15, left: 15, top: 20),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.16,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(17)),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 18, top: 25),
                          width: MediaQuery.of(context).size.width * 0.46,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Flexible(
                                child: Text(
                                  "WE FIRST MAKE OUR HABITS, AND THEN OUR HABITS MAKES US.",
                                  style: TextStyleConstant.homePostText,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 9.0),
                                child: Text('- ANONYMOUS', style: TextStyleConstant.homePostTextD),
                              )
                            ],
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.16,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(17), topRight: Radius.circular(17)),
                              child: Image.asset(
                                ImageConstant.homePost,
                                fit: BoxFit.fitHeight,
                              ),
                            )),
                      ],
                    ),
                  ),

                  ///habits day&date
                  Container(
                    margin: const EdgeInsets.only(top: 30, left: 35, bottom: 20),
                    child: Row(
                      children: [
                        const Text(
                          "HABITS",
                          style: TextStyle(color: Color(0xFF573353), fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(width: 55),
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: dayDateData.map((e) {
                                  return dateContainer(dText: e.date, dayText: e.day);
                                }).toList()),
                          ),
                        )
                      ],
                    ),
                  ),

                  /// 4 row
                  coustomRow(
                      title: 'Read A Book',
                      height: MediaQuery.of(context).size.height * 0.08,
                      color: ColorConstant.orangeContainer),
                  coustomRow(
                      title: 'Exercise',
                      height: MediaQuery.of(context).size.height * 0.08,
                      color: ColorConstant.redContainer),
                  coustomRow(
                      title: 'Wake Up Early',
                      height: MediaQuery.of(context).size.height * 0.08,
                      color: ColorConstant.blueContainer),
                  coustomRow(
                      title: 'Walk Dog',
                      height: MediaQuery.of(context).size.height * 0.08,
                      color: ColorConstant.darkRedContainer),
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

Widget dateContainer({String? dayText, String? dText}) {
  return Container(
    margin: const EdgeInsets.only(right: 10),
    padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(dayText ?? '',
            style: const TextStyle(fontSize: 13, color: Color(0xFF573353), fontWeight: FontWeight.w400)),
        Text(dText ?? '', style: const TextStyle(fontSize: 17, color: Color(0xFF573353), fontWeight: FontWeight.w600)),
      ],
    ),
  );
}

Widget coustomRow({String? title, double? height, Color? color}) {
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.only(left: 15),
        height: height,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
            color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Row(
            children: [
              SizedBox(
                width: 115,
                child: Text(
                  title ?? '',
                  style: TextStyleConstant.homeFourRow,
                ),
              ),
              VerticalDivider(
                color: Colors.orangeAccent.shade100,
              ),
              SingleChildScrollView(
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: color),
                ),
              )
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      )
    ],
  );
}
