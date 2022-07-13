import 'package:curved_nav_bar/flutter_curved_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:habit_builder_ui/core/constant/color_constant.dart';
import 'package:habit_builder_ui/core/constant/icon_constant.dart';
import 'package:habit_builder_ui/core/constant/image_constant.dart';
import 'package:habit_builder_ui/core/view_model/base_view.dart';
import 'package:habit_builder_ui/core/view_model/home_all_view_model/home_bottom_view_model.dart';

class HomeBottom extends StatefulWidget {
  const HomeBottom({Key? key}) : super(key: key);

  @override
  State<HomeBottom> createState() => _HomeBottomState();
}

class _HomeBottomState extends State<HomeBottom> {
  HomeTrackingHabitsViewModel? model;

  onItemTapped(int index) {
    setState(() {
      model!.selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeTrackingHabitsViewModel>(
      builder: (buildContext, model, child) {
        return Scaffold(
          backgroundColor: const Color(0xFFFFE2C7),
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color(0xFFFC9D45),
            child: Padding(
              padding: const EdgeInsets.all(19.0),
              child: Image.asset(IconConstant.add),
            ),
            onPressed: () {},
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            notchMargin: 15,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              elevation: 0,
              iconSize: 20,
              onTap: onItemTapped,
              currentIndex: model.selectedIndex,
              items: [
                BottomNavigationBarItem(
                    backgroundColor: Colors.transparent,
                    label: '',
                    icon: SizedBox(width: 50, height: 40, child: Image.asset(IconConstant.bottomHome))),
                BottomNavigationBarItem(
                    label: '',
                    icon: Container(
                        margin: const EdgeInsets.only(right: 45, top: 10),
                        width: 50,
                        height: 40,
                        child: Image.asset(IconConstant.bottomImage))),
                BottomNavigationBarItem(
                    label: '',
                    icon: Container(
                        margin: const EdgeInsets.only(left: 45),
                        width: 50,
                        height: 40,
                        child: Image.asset(IconConstant.bottomImage3))),
                BottomNavigationBarItem(
                    label: '', icon: SizedBox(width: 50, height: 40, child: Image.asset(IconConstant.bottomSetting))),
              ],
            ),
          ),
          body: model.widgetOptions.elementAt(model.selectedIndex),
        );
      },
      onModelReady: (model) {
        this.model = model;
      },
    );
  }
}
