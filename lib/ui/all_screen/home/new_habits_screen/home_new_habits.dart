import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:habit_builder_ui/core/constant/color_constant.dart';
import 'package:habit_builder_ui/core/constant/icon_constant.dart';
import 'package:habit_builder_ui/core/constant/image_constant.dart';
import 'package:habit_builder_ui/core/constant/text_style_constant.dart';
import 'package:habit_builder_ui/ui/all_screen/home/new_habits_screen/bottom_sheet_notification.dart';
import 'package:habit_builder_ui/ui/widget/custom_container.dart';
import 'package:habit_builder_ui/ui/widget/custom_text_field.dart';

class HomeNewHabits extends StatefulWidget {
  const HomeNewHabits({Key? key}) : super(key: key);

  @override
  State<HomeNewHabits> createState() => _HomeNewHabitsState();
}

class _HomeNewHabitsState extends State<HomeNewHabits> {
  bool? status = true;

  @override
  Widget build(BuildContext context) {
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
                child: Image.asset(IconConstant.trueImage),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned(bottom: 28, child: Image.asset(ImageConstant.homeTrackingBackGround)),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 18, top: 45),
                child: Row(
                  children: [
                    SizedBox(
                        height: 70,
                        width: 70,
                        child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Image.asset(IconConstant.resetScreenIcon))),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.18),
                    const Text(
                      "New Habits",
                      style: TextStyle(color: Color(0xFF573353), fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: customTextField(
                        padding: const EdgeInsets.only(left: 17, right: 17),
                        margin: const EdgeInsets.only(left: 22),
                        color: Colors.white,
                        obscureText: false,
                        hintText: 'Enter habit name',
                        hintStyle: const TextStyle(color: Color(0xFF573353), fontWeight: FontWeight.w200),
                        style: const TextStyle(fontSize: 18, color: Color(0xFF573353))),
                  ),
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.all(20),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child: Image.asset(IconConstant.addHabits),
                      ),
                      Positioned(
                          left: 53,
                          top: 14,
                          child: SizedBox(width: 20, height: 20, child: Image.asset(IconConstant.addIcon))),
                    ],
                  )
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.16,
                margin: const EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, right: 12.0, left: 12.0, bottom: 9.0),
                      child: Row(
                        children: const [
                          Text(
                            "Habit Frequency",
                            style: TextStyle(fontSize: 20, color: Color(0xFF573353), fontWeight: FontWeight.w400),
                          ),
                          Spacer(),
                          Text("Custom",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Color(0xFFFDA758),
                              )),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFFFDA758),
                          )
                        ],
                      ),
                    ),
                    Divider(color: Colors.orangeAccent.shade100),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        customContainer(text: "SUN"),
                        customContainerHalf(text: "MON"),
                        customContainerHalf(text: "TUE"),
                        customContainer(text: "WED"),
                        customContainerHalf(text: "THU"),
                        customContainer(text: "FRI"),
                        customContainer(text: "SAT"),
                      ],
                    )
                  ],
                ),
              ),

              ///reminder row
              Container(
                padding: const EdgeInsets.only(left: 12),
                height: MediaQuery.of(context).size.height * 0.055,
                margin: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: InkWell(
                  onTap: () {
                    notificationBottomSheet(context);
                    // reminderBottomShit(context);
                  },
                  child: Row(
                    children: [
                      const Text(
                        "Reminder",
                        style: TextStyle(color: Color(0xFF573353), fontSize: 19),
                      ),
                      const Spacer(),
                      const Text("10:00 AM",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Color(0xFFFDA758),
                          )),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: const Color(0xFFFDA758).withOpacity(0.8),
                      )
                    ],
                  ),
                ),
              ),

              ///notification Row
              Container(
                padding: const EdgeInsets.only(left: 12),
                height: MediaQuery.of(context).size.height * 0.055,
                margin: const EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: InkWell(
                  onTap: () {
                    // notificationBottomShit(context);
                  },
                  child: Row(
                    children: [
                      const Text(
                        "Notification",
                        style: TextStyle(color: Color(0xFF573353), fontSize: 19),
                      ),
                      const Spacer(),
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        width: 60,
                        height: 29,
                        child: FlutterSwitch(
                          activeColor: const Color(0xFF573353).withOpacity(0.1),
                          activeTextColor: const Color(0xFF573353).withOpacity(0.6),
                          activeText: 'on',
                          inactiveColor: const Color(0xFF573353).withOpacity(0.1),
                          inactiveTextColor: const Color(0xFF573353).withOpacity(0.6),
                          inactiveText: 'off',
                          showOnOff: true,
                          toggleColor: const Color(0xFF573353),
                          value: status!,
                          onToggle: (value) {
                            setState(() {
                              status = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              ///last pop-up
              SizedBox(height: MediaQuery.of(context).size.height * 0.11),
              Stack(
                clipBehavior: Clip.none,
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    height: MediaQuery.of(context).size.height * 0.19,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.048),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text('START THIS HABIT', style: TextStyleConstant.newHabitContainer),
                            const Text(
                              'ullamco laboris nisi ut aliquip ex ea commodo\n consequat dolore.',
                              textAlign: TextAlign.center,
                              style: TextStyleConstant.newHabitContainerD,
                            ),
                            SizedBox(height: 30, width: 30, child: Image.asset(IconConstant.downArrow)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -40,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child: Image.asset(IconConstant.newHabitFace),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
