import 'package:flutter/material.dart';
import 'package:habit_builder_ui/ui/widget/custom_btn.dart';
import 'package:habit_builder_ui/core/constant/color_constant.dart';
import 'package:habit_builder_ui/core/constant/icon_constant.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

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
                    height: MediaQuery.of(context).size.height * 0.60,
                    width: MediaQuery.of(context).size.height * 1,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                    child: Column(
                      children: [
                        Expanded(
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
                        )
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
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
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
                                        text: '98 %', textD: 'Completion Rate', image: IconConstant.analytics_3),
                                    analyticsContainer(
                                        text: '7', textD: 'Average Easiness\nScore', image: IconConstant.analytics_4),
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

Widget analyticsContainer({String? text, String? textD, String? image}) {
  return SizedBox(
    height: 80,
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text ?? '',
                style: const TextStyle(color: Color(0xFF573353), fontWeight: FontWeight.w700, fontSize: 21),
              ),
              Text(
                textD ?? '',
                style: const TextStyle(color: Color(0xFF573353), fontWeight: FontWeight.w200, fontSize: 16),
              )
            ],
          ),
        ),
        const Spacer(),
        SizedBox(height: 60, width: 60, child: Image.asset(image ?? ''))
      ],
    ),
  );
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
/*Row(
children: [
InkWell(
onTap: () {
pageController.animateTo(1, duration: Duration(milliseconds: 500), curve: Curves.ease);
},
child: const Align(alignment: Alignment.topLeft, child: Icon(Icons.arrow_back_ios))),
Expanded(
child: PageView(
controller: pageController,
children: const [
Text(
"January",
style: TextStyle(fontWeight: FontWeight.w700, fontSize: 21, color: Color(0xFF573353)),
),
Text(
"February",
style: TextStyle(fontWeight: FontWeight.w700, fontSize: 21, color: Color(0xFF573353)),
),
Text(
"March",
style: TextStyle(fontWeight: FontWeight.w700, fontSize: 21, color: Color(0xFF573353)),
),
],
),
),
InkWell(
onTap: () {
pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
},
child: const Align(alignment: Alignment.topRight, child: Icon(Icons.arrow_forward_ios))),
],
),*/

///
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
}
