import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:habit_builder_ui/core/model_class/continer_shape.dart';
import 'package:habit_builder_ui/ui/widget/analytics_container.dart';
import 'package:habit_builder_ui/ui/widget/custom_btn.dart';
import 'package:habit_builder_ui/core/constant/color_constant.dart';
import 'package:habit_builder_ui/core/constant/icon_constant.dart';
import 'package:habit_builder_ui/ui/widget/custom_container.dart';

class HabitsEvent extends StatefulWidget {
  const HabitsEvent({Key? key}) : super(key: key);

  @override
  State<HabitsEvent> createState() => _HabitsEventState();
}

class _HabitsEventState extends State<HabitsEvent> {
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
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 45.0, right: 10, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SizedBox(width: 70, height: 70, child: Image.asset(IconConstant.resetScreenIcon))),
                const Spacer(),
                const Text(
                  "Read A Book",
                  style: TextStyle(color: Color(0xFF573353), fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                SizedBox(width: 70, height: 70, child: Image.asset(IconConstant.habitImage)),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 18, left: 15, right: 15),
                    height: MediaQuery.of(context).size.height * 0.12,
                    width: MediaQuery.of(context).size.height * 1,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                    child: Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(15),
                            child: Stack(
                              children: [
                                Image.asset(IconConstant.habitBackground),
                                Padding(
                                  padding: const EdgeInsets.all(11.0),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.asset(IconConstant.habitBackgroundImage)),
                                ),
                              ],
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Read a Book",
                              style: TextStyle(color: Color(0xFF573353), fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            Row(
                              children: [
                                SizedBox(height: 20, width: 25, child: Image.asset(IconConstant.alert)),
                                const SizedBox(width: 10),
                                const Text(
                                  "Repeat Everyday",
                                  style: TextStyle(color: Color(0xFF573353), fontWeight: FontWeight.w300),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(height: 20, width: 25, child: Image.asset(IconConstant.repet)),
                                const SizedBox(width: 10),
                                const Text(
                                  "Reminders",
                                  style: TextStyle(color: Color(0xFF573353), fontWeight: FontWeight.w300),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 18, left: 15, right: 15),
                    height: MediaQuery.of(context).size.height * 0.58,
                    width: MediaQuery.of(context).size.height * 1,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                    child: Column(
                      children: [
                        Expanded(
                          child: PageView(
                            children: const [
                              Text("January",
                                  style:
                                      TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Color(0xFF573353))),
                              Text("February",
                                  style:
                                      TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Color(0xFF573353))),
                              Text("March",
                                  style:
                                      TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Color(0xFF573353))),
                            ],
                          ),
                        ),
                        Table(children: [
                          TableRow(
                            children: [
                              allDay(text: 'SUN'),
                              allDay(text: 'MON'),
                              allDay(text: 'TUE'),
                              allDay(text: 'WED'),
                              allDay(text: 'THU'),
                              allDay(text: 'FRI'),
                              allDay(text: 'SAT'),
                            ],
                          ),
                          TableRow(
                            children: [
                              containerAll(text: '1', hideContainer: false),
                              customContainerHalf(text: "2"),
                              containerAll(text: '3', hideContainer: false),
                              containerAll(text: '4', hideContainer: true),
                              containerAll(text: '5', hideContainer: false),
                              containerAll(text: '6', hideContainer: false),
                              customContainerHalf(text: "7"),
                            ],
                          ),
                          TableRow(
                            children: [
                              customContainerHalf(text: "8"),
                              containerAll(text: '9', hideContainer: false),
                              customContainerHalf(text: "10"),
                              containerAll(text: '11', hideContainer: false),
                              containerAll(text: '12', hideContainer: false),
                              customContainerHalf(text: "13"),
                              containerAll(text: '14', hideContainer: true),
                            ],
                          ),
                          TableRow(
                            children: [
                              customContainerHalf(text: "15"),
                              containerAll(text: '16', hideContainer: true),
                              customContainerHalf(text: "17"),
                              containerAll(text: '18', hideContainer: true),
                              containerAll(text: '19', hideContainer: true),
                              customContainerHalf(text: "20"),
                              containerAll(text: '21', hideContainer: true),
                            ],
                          ),
                          TableRow(
                            children: [
                              containerAll(text: '22', hideContainer: true),
                              containerAll(text: '23', hideContainer: true),
                              containerAll(text: '24', hideContainer: true),
                              containerAll(text: '25', hideContainer: true),
                              containerAll(text: '26', hideContainer: true),
                              containerAll(text: '27', hideContainer: true),
                              containerAll(text: '28', hideContainer: true),
                            ],
                          ),
                          TableRow(
                            children: [
                              containerAll(text: '29', hideContainer: true),
                              containerAll(text: '30', hideContainer: true),
                              containerAll(text: '31', hideContainer: true),
                              containerAll(
                                  text: '1',
                                  hideContainer: true,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF573353).withOpacity(0.2),
                                      fontSize: 18)),
                              containerAll(
                                  text: '2',
                                  hideContainer: true,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF573353).withOpacity(0.2),
                                      fontSize: 18)),
                              containerAll(
                                  text: '3',
                                  hideContainer: true,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF573353).withOpacity(0.2),
                                      fontSize: 18)),
                              containerAll(
                                  text: '4',
                                  hideContainer: true,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF573353).withOpacity(0.2),
                                      fontSize: 18)),
                            ],
                          ),
                        ])
                      ],
                    ),
                  ),

                  ///Analytics
                  Container(
                    margin: const EdgeInsets.only(top: 60),
                    height: MediaQuery.of(context).size.height * 0.44,
                    width: MediaQuery.of(context).size.height * 1,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF3E9),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFFDECDE).withOpacity(0.5),
                          blurStyle: BlurStyle.solid,
                          blurRadius: 8,
                          spreadRadius: 10,
                          offset: const Offset(0, -10),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(23.0),
                          child: Text(
                            "Analytics",
                            style: TextStyle(fontSize: 18, color: Color(0xFF573353), fontWeight: FontWeight.w300),
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            height: MediaQuery.of(context).size.height * 0.18,
                            width: MediaQuery.of(context).size.height * 1,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.white),
                            child: Table(
                                border: TableBorder.all(
                                  color: const Color(0xFFFFF3E9),
                                ),
                                children: [
                                  TableRow(children: [
                                    analyticsContainer(
                                        text: '20 DAYS', textD: 'Longest Streak', image: IconConstant.analytics_1),
                                    analyticsContainer(
                                        text: '0 DAYS', textD: 'Current Streak', image: IconConstant.analytics_2),
                                  ]),
                                  TableRow(children: [
                                    analyticsContainer(
                                        text: '98 %', textD: 'Completion\n Rate', image: IconConstant.analytics_3),
                                    analyticsContainer(
                                        text: '7', textD: 'Average\nEasiness Score', image: IconConstant.analytics_4),
                                  ]),
                                ])),
                        const Spacer(),
                        customBtn(
                          margin: const EdgeInsets.only(top: 10, right: 20, left: 20),
                          text: 'Mark Habit as Complete',
                          onPressed: () {},
                        ),
                        customBtn(
                          margin: const EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 15),
                          primary: Colors.white,
                          text: 'Mark Habit as Missed',
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.19,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget allMonth({String? text}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 12.0, right: 15, left: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text ?? '',
                style: const TextStyle(fontSize: 22, color: Color(0xFF573353), fontWeight: FontWeight.w700)),
          ],
        ),
      ),
    ],
  );
}

Widget allDay({String? text}) {
  return Center(
      child: Text(text ?? '',
          style: const TextStyle(color: Color(0xFF573353), fontSize: 15, fontWeight: FontWeight.w500)));
}

Widget containerAll({String? text, bool? hideContainer, TextStyle? style}) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0, bottom: 8, left: 4, right: 4),
    child: Container(
      height: 72,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: const Color(0xFFFFF3E9)),
      child: Column(
        children: [
          hideContainer == false
              ? customContainer(
                  text: text ?? '',
                  height: 45,
                  width: 45,
                  style: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF573353), fontSize: 18))
              : SizedBox(
                  child: Column(
                  children: [
                    Text(text ?? '',
                        style: style ??
                            const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF573353), fontSize: 18)),
                    Container(
                      margin: const EdgeInsets.all(3),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13), color: const Color(0xFFFC9D45).withOpacity(0.1)),
                    )
                  ],
                ))
        ],
      ),
    ),
  );
}

Widget customContainerHalf({String? text, TextStyle? style, EdgeInsetsGeometry? margin}) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0, bottom: 8, left: 4, right: 4),
    child: Container(
      height: 72,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: const Color(0xFFFFF3E9)),
      child: Column(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  Text(text!,
                      style: const TextStyle(color: Color(0xFF573353), fontWeight: FontWeight.w600, fontSize: 18)),
                  Container(
                    margin: const EdgeInsets.only(left: 3, top: 2),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13), color: const Color(0xFFFC9D45).withOpacity(0.1)),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 18, left: 9),
                child: Transform.rotate(
                    angle: -math.pi / 2.1,
                    child: ClipPath(
                        clipper: ContinerShapee(),
                        child: Container(
                            margin: const EdgeInsets.all(3),
                            height: 41,
                            width: 85,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(13),
                                    topLeft: Radius.circular(13),
                                    bottomRight: Radius.circular(37),
                                    bottomLeft: Radius.circular(37)),
                                color: Color(0xFFFC9D45))))),
              )
            ],
          )
        ],
      ),
    ),
  );
}

/*///
List<Meeting> _getDataSource() {
  final List<Meeting> meetings = <Meeting>[];
  final DateTime today = DateTime.now();
  final DateTime startTime = DateTime(today.year, today.month, today.day, 9);
  final DateTime endTime = startTime.add(const Duration(hours: 2));
  meetings.add(Meeting('Conference', startTime, endTime, const Color(0xFF0F8644), false));
  return meetings;
}
class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }
    return meetingData;
  }
}
class Meeting {
  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;

  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);
}*/

/*Expanded(
                          child: TableCalendar(
                            focusedDay: _focusedCalendarDate,
                            firstDay: _initialCalendarDate,
                            lastDay: _lastCalendarDate,
                            calendarFormat: CalendarFormat.month,
                            weekendDays: const [DateTime.sunday, 6],
                            startingDayOfWeek: StartingDayOfWeek.monday,
                            daysOfWeekHeight: 40.0,
                            rowHeight: 60.0,
                            headerStyle: const HeaderStyle(
                              titleTextStyle: TextStyle(color: AppColors.babyPowder, fontSize: 20.0),
                              decoration: BoxDecoration(
                                  color: AppColors.eggPlant,
                                  borderRadius:
                                      BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
                              formatButtonTextStyle: TextStyle(color: AppColors.ultraRed, fontSize: 16.0),
                              formatButtonDecoration: BoxDecoration(
                                color: AppColors.babyPowder,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5.0),
                                ),
                              ),
                              leftChevronIcon: Icon(
                                Icons.chevron_left,
                                color: AppColors.babyPowder,
                                size: 28,
                              ),
                              rightChevronIcon: Icon(
                                Icons.chevron_right,
                                color: AppColors.babyPowder,
                                size: 28,
                              ),
                            ),
                            daysOfWeekStyle: const DaysOfWeekStyle(
                              weekendStyle: TextStyle(color: AppColors.ultraRed),
                            ),
                            calendarStyle: const CalendarStyle(
                              weekendTextStyle: TextStyle(color: AppColors.ultraRed),
                              todayDecoration: BoxDecoration(
                                color: AppColors.eggPlant,
                                shape: BoxShape.circle,
                              ),
                              selectedDecoration: BoxDecoration(
                                color: AppColors.blackCoffee,
                                shape: BoxShape.circle,
                              ),

                            ),
                          ),
                        )*/
/*Expanded(
                          child: SfCalendar(
                            dataSource: MeetingDataSource(_getDataSource()),
                            monthViewSettings: const MonthViewSettings(
                                appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
                            showDatePickerButton: true,
                            viewHeaderStyle: const ViewHeaderStyle(
                                dayTextStyle:
                                    TextStyle(color: Color(0xFF573353), fontSize: 20, fontWeight: FontWeight.w500)),
                            headerHeight: 60,
                            headerDateFormat: 'yMMMM',
                            headerStyle: const CalendarHeaderStyle(
                                textStyle:
                                    TextStyle(color: Color(0xFF573353), fontSize: 25, fontWeight: FontWeight.w700)),
                            cellBorderColor: Colors.orangeAccent.shade100,
                            allowDragAndDrop: true,
                            view: CalendarView.month,
                          ),
                        )*/
