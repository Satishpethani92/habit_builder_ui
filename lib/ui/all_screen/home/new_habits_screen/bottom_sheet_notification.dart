import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:habit_builder_ui/ui/widget/custom_btn.dart';
import 'package:habit_builder_ui/core/constant/icon_constant.dart';
import 'package:habit_builder_ui/ui/all_screen/home/new_habits_screen/bottom_sheet_reminder.dart';

notificationBottomSheet(BuildContext context) {
  showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
    ),
    // isDismissible: false,
    useRootNavigator: true,
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (context, setState) {
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: dateTime.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                    itemBuilder: (BuildContext context, index) {
                      return Container(
                        margin: const EdgeInsets.all(9),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: dateTime.elementAt(index).isSelected!
                                ? const Color(0xFFFFF3E9)
                                : const Color(0xFFC8C1C8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              DateFormat('hh:mm a').format(dateTime[index].time!),
                              style: TextStyle(
                                  color: dateTime.elementAt(index).isSelected!
                                      ? const Color(0xFFFDA758)
                                      : const Color(0xFF573353),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              width: 63,
                              child: InkWell(
                                onTap: () {
                                  dateTime.elementAt(index).isSelected = !dateTime.elementAt(index).isSelected!;
                                  setState(() {});
                                },
                                child: FlutterSwitch(
                                  activeColor: const Color(0xFFFDA758).withOpacity(0.2),
                                  activeTextColor: const Color(0xFFFDA758).withOpacity(0.6),
                                  activeText: 'on',
                                  inactiveColor: dateTime.elementAt(index).isSelected!
                                      ? const Color(0xFFFDA758).withOpacity(0.2)
                                      : const Color(0xFF573353).withOpacity(0.2),
                                  inactiveTextColor: dateTime.elementAt(index).isSelected!
                                      ? const Color(0xFFFDA758).withOpacity(0.6)
                                      : const Color(0xFF573353).withOpacity(0.6),
                                  toggleColor: dateTime.elementAt(index).isSelected!
                                      ? const Color(0xFFFDA758)
                                      : const Color(0xFF573353),
                                  inactiveText: 'off',
                                  showOnOff: true,
                                  value: dateTime.elementAt(index).isSelected!,
                                  onToggle: (value) {
                                    setState(() {
                                      dateTime.elementAt(index).isSelected = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              Row(
                children: [
                  customBtn(
                    width: 300,
                    height: 55,
                    margin: const EdgeInsets.only(bottom: 25, left: 20, right: 10),
                    text: 'Add Reminder',
                    onPressed: () {
                      Navigator.pop(context);
                      reminderBottomSheet(context);
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 25),
                    height: 55,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade400, width: 2)),
                    child: Container(padding: const EdgeInsets.all(14), child: Image.asset(IconConstant.reminderIcon)),
                  )
                ],
              )
            ],
          ),
        );
      },
    ),
  );
}
