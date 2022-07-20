import 'package:flutter/material.dart';
import 'package:habit_builder_ui/core/constant/color_constant.dart';
import 'package:habit_builder_ui/core/constant/icon_constant.dart';
import 'package:habit_builder_ui/ui/widget/analytics_container.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                  onPressed: () {},
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
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 45.0, right: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(width: 70, height: 70, child: Image.asset(IconConstant.resetScreenIcon)),
                  const Spacer(),
                  const Text(
                    "Profile",
                    style: TextStyle(color: Color(0xFF573353), fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  SizedBox(width: 70, height: 70, child: Image.asset(IconConstant.habitImage)),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 20, left: 20, top: 30),
              height: MediaQuery.of(context).size.height * 0.32,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0, top: 8, right: 10),
                        child: SizedBox(
                          height: 90,
                          width: 90,
                          child: Image.asset(
                            IconConstant.profile_1,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Marilyn Aminoff",
                              style: TextStyle(fontSize: 17, color: Color(0xFF573353), fontWeight: FontWeight.w700)),
                          Text("Name",
                              style: TextStyle(fontSize: 16, color: Color(0xFF573353), fontWeight: FontWeight.w300)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Table(
                    border: TableBorder.all(color: const Color(0xFFFFF3E9)),
                    children: [
                      TableRow(children: [
                        analyticsContainer(
                            text: 'Total Work Hours',
                            style: const TextStyle(fontSize: 14, color: Color(0xFF573353), fontWeight: FontWeight.w300),
                            styleD:
                                const TextStyle(fontSize: 20, color: Color(0xFF573353), fontWeight: FontWeight.w800),
                            textD: '18',
                            image: IconConstant.analytics_1),
                        analyticsContainer(
                            text: 'Task Completed',
                            style: const TextStyle(fontSize: 14, color: Color(0xFF573353), fontWeight: FontWeight.w300),
                            styleD:
                                const TextStyle(fontSize: 20, color: Color(0xFF573353), fontWeight: FontWeight.w800),
                            textD: '12',
                            image: IconConstant.analytics_3),
                      ])
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              CircularPercentIndicator(
                                backgroundColor: const Color(0xFF573353).withOpacity(0.1),
                                radius: 27,
                                lineWidth: 4,
                                percent: 0.50,
                                center: const Text("7",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600, fontSize: 17, color: Color(0xFF573353))),
                                progressColor: const Color(0xFF573353),
                              ),
                              const SizedBox(height: 5),
                              Text("06/14",
                                  style: TextStyle(
                                      color: const Color(0xFF573353).withOpacity(0.6), fontWeight: FontWeight.w400))
                            ],
                          ),
                          const SizedBox(width: 8),
                          Column(
                            children: [
                              CircularPercentIndicator(
                                backgroundColor: Colors.red.withOpacity(0.1),
                                radius: 27,
                                lineWidth: 4,
                                percent: 0.05,
                                center: const Text("0",
                                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17, color: Colors.red)),
                                progressColor: Colors.red,
                              ),
                              const SizedBox(height: 5),
                              const Text('')
                            ],
                          ),
                          const SizedBox(width: 8),
                          Column(
                            children: [
                              CircularPercentIndicator(
                                backgroundColor: const Color(0xFF573353).withOpacity(0.1),
                                radius: 27,
                                lineWidth: 4,
                                percent: 0.50,
                                center: const Text("6",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600, fontSize: 17, color: Color(0xFF573353))),
                                progressColor: const Color(0xFF573353),
                              ),
                              const SizedBox(height: 5),
                              Text("06/15",
                                  style: TextStyle(
                                      color: const Color(0xFF573353).withOpacity(0.6), fontWeight: FontWeight.w400))
                            ],
                          ),
                          const SizedBox(width: 8),
                          Column(
                            children: [
                              CircularPercentIndicator(
                                backgroundColor: const Color(0xFF573353).withOpacity(0.1),
                                radius: 27,
                                lineWidth: 4,
                                percent: 0.35,
                                center: const Text("5",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600, fontSize: 17, color: Color(0xFF573353))),
                                progressColor: const Color(0xFF573353),
                              ),
                              const SizedBox(height: 5),
                              const Text('')
                            ],
                          ),
                          const SizedBox(width: 8),
                          Column(
                            children: [
                              CircularPercentIndicator(
                                backgroundColor: const Color(0xFF573353).withOpacity(0.1),
                                radius: 27,
                                lineWidth: 4,
                                percent: 0.35,
                                center: const Text("4",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600, fontSize: 17, color: Color(0xFF573353))),
                                progressColor: const Color(0xFF573353),
                              ),
                              const SizedBox(height: 5),
                              Text("06/16",
                                  style: TextStyle(
                                      color: const Color(0xFF573353).withOpacity(0.6), fontWeight: FontWeight.w400))
                            ],
                          ),
                          const SizedBox(width: 8),
                          Column(
                            children: [
                              CircularPercentIndicator(
                                backgroundColor: const Color(0xFF573353).withOpacity(0.1),
                                radius: 27,
                                lineWidth: 4,
                                percent: 0.92,
                                center: const Text("9",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600, fontSize: 17, color: Color(0xFF573353))),
                                progressColor: const Color(0xFF573353),
                              ),
                              const SizedBox(height: 5),
                              const Text('')
                            ],
                          ),
                          const SizedBox(width: 8),
                          Column(
                            children: [
                              CircularPercentIndicator(
                                backgroundColor: const Color(0xFFFDA758).withOpacity(0.2),
                                radius: 27,
                                lineWidth: 4,
                                percent: 0.50,
                                center: const Text("10",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600, fontSize: 17, color: Color(0xFFFDA758))),
                                progressColor: const Color(0xFFFDA758),
                              ),
                              const SizedBox(height: 5),
                              Text("Today",
                                  style: TextStyle(
                                      color: const Color(0xFF573353).withOpacity(0.6), fontWeight: FontWeight.w400))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            supportRow(height: 57, image: IconConstant.payment, text: 'Billing methods'),
            supportRow(height: 57, image: IconConstant.streak, text: 'Longest Streak', textL: '20 Days'),
          ],
        ));
  }
}

Widget supportRow({double? height, String? image, String? text, String? textL}) {
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
            Positioned(top: 12, left: 21, child: SizedBox(height: 24, width: 24, child: Image.asset(image ?? ''))),
          ],
        ),
        Text(text ?? '', style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Color(0xFF573353))),
        const Spacer(),
        Text(textL ?? '', style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Color(0xFF573353))),
        const Padding(
          padding: EdgeInsets.only(right: 15),
          child: Icon(Icons.arrow_forward_ios, color: Color(0xFF573353), size: 20),
        )
      ],
    ),
  );
}
