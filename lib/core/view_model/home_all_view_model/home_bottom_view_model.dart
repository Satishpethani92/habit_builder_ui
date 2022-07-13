import 'package:flutter/cupertino.dart';
import 'package:habit_builder_ui/core/view_model/base_model.dart';
import 'package:habit_builder_ui/ui/home_all_screen/home_tracking_habits.dart';

class HomeTrackingHabitsViewModel extends BaseModel {
  int selectedIndex = 0;
  final List<Widget> widgetOptions = <Widget>[
    const HomeTrackingHabits(),
    const Text(
      '3Page',
    ),
    const Text(
      '4Page',
    ),
    const Text(
      '5Page',
    ),
  ];
}
