import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:habit_builder_ui/core/model_class/time_date.dart';
import 'package:habit_builder_ui/core/constant/text_style_constant.dart';
import 'package:habit_builder_ui/ui/all_screen/home/new_habits_screen/bottom_sheet_notification.dart';

DateTime time = DateTime.now();
List<TimeDate> dateTime = [];
bool isSelected = true;

reminderBottomSheet(BuildContext context) {
  showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
    ),
    isDismissible: true,
    useRootNavigator: true,
    backgroundColor: Colors.white,
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (context, setState) {
        return Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
              color: Colors.white,
            ),
            height: 400,
            alignment: Alignment.center,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancel", style: TextStyle(color: Color(0xFFFC9D45), fontSize: 19))),
                      const Text(
                        "Add Reminders",
                        style: TextStyleConstant.reminderTextStyle,
                      ),
                      InkWell(
                          onTap: () {
                            dateTime.add(TimeDate(time: time, isSelected: true));
                            setState(() {});
                            Navigator.pop(context);
                            notificationBottomSheet(context);
                          },
                          child: const Text("Save", style: TextStyle(color: Color(0xFFFC9D45), fontSize: 19)))
                    ],
                  ),
                ),
                Divider(
                  color: Colors.orangeAccent.shade100,
                ),
                SizedBox(
                  width: 300,
                  height: 264,
                  child: CupertinoDatePicker(
                    use24hFormat: false,
                    initialDateTime: time,
                    mode: CupertinoDatePickerMode.time,
                    onDateTimeChanged: (value) {
                      time = value;
                      setState(() {});
                    },
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        isSelected = true;
                        setState(() {});
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 65,
                        color: isSelected ? const Color(0xFFFDA758) : const Color(0XFFFFF3E9),
                        child: Center(
                            child: Text(
                          "am",
                          style: TextStyle(
                              color: isSelected ? const Color(0xFF573353) : const Color(0xFFFDA758),
                              fontSize: 21,
                              fontWeight: FontWeight.w500),
                        )),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        isSelected = false;
                        setState(() {});
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 65,
                        color: isSelected ? const Color(0XFFFFF3E9) : const Color(0xFFFDA758),
                        child: Center(
                            child: Text(
                          "pm",
                          style: TextStyle(
                              color: isSelected ? const Color(0xFFFDA758) : const Color(0xFF573353),
                              fontSize: 21,
                              fontWeight: FontWeight.w500),
                        )),
                      ),
                    ),
                  ],
                )
              ],
            ));
      },
    ),
  );
}
