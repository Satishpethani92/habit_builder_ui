import 'package:flutter/material.dart';
import 'package:habit_builder_ui/core/constant/icon_constant.dart';
import 'package:habit_builder_ui/core/view_model/all_view_model/home_bottom_view_model.dart';
import 'package:habit_builder_ui/core/view_model/base_view.dart';
import 'package:habit_builder_ui/ui/all_screen/home/tracking_habits_screen/home_tracking_habits.dart';
import 'package:habit_builder_ui/ui/all_screen/profile/profile_screen.dart';
import 'package:habit_builder_ui/ui/all_screen/setting/setting_screen.dart';
import 'package:habit_builder_ui/ui/widget/bottom_bar.dart';
import 'package:habit_builder_ui/ui/widget/tab_item.dart';

class HomeBottom extends StatefulWidget {
  const HomeBottom({Key? key}) : super(key: key);

  @override
  State<HomeBottom> createState() => HomeBottomState();
}

class HomeBottomState extends State<HomeBottom> {
  HomeTrackingHabitsViewModel? model;
  static int currentTab = 0;

  final List<TabItem> tabs = [
    TabItem(
      tabName: "Home",
      image: IconConstant.bottomHome,
      page: const HomeTrackingHabits(),
    ),
    TabItem(
      tabName: "Home",
      image: IconConstant.bottomImage,
      page: const HomeTrackingHabits(),
    ),
    TabItem(
      tabName: "Home",
      image: IconConstant.white,
      page: const HomeTrackingHabits(),
    ),
    TabItem(
      tabName: "Home",
      image: IconConstant.bottomImage3,
      page: const ProfileScreen(),
    ),
    TabItem(
      tabName: "Setting",
      image: IconConstant.bottomSetting,
      page: const SettingScreen(),
    ),
  ];

  HomeBottomState() {
    tabs.asMap().forEach((index, details) {
      details.setIndex(index);
    });
  }

  void _selectTab(int index) {
    if (index == currentTab) {
      tabs[index].key.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() => currentTab = index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeTrackingHabitsViewModel>(
      builder: (buildContext, model, child) {
        return Scaffold(
          extendBody: true,
          body: IndexedStack(
            index: currentTab,
            children: tabs.map((e) => e.page).toList(),
          ),
          bottomNavigationBar: BottomNavigation(
            onSelectTab: _selectTab,
            tabs: tabs,
          ),
        );
      },
      onModelReady: (model) {
        this.model = model;
      },
    );
  }
}
