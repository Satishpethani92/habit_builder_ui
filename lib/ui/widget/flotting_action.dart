import 'package:flutter/material.dart';
import 'package:habit_builder_ui/core/constant/icon_constant.dart';

flottingActionBtn({VoidCallback? onPressed}) {
  return Scaffold(
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    floatingActionButton: Padding(
      padding: const EdgeInsets.only(bottom: 60.0),
      child: Stack(
        children: [
          SizedBox(width: 75, height: 75, child: Image.asset(IconConstant.floutingBack)),
          Positioned(
            left: 10,
            top: 7.5,
            child: FloatingActionButton(
              backgroundColor: const Color(0xFFFC9D45),
              onPressed: onPressed,
              child: Padding(
                padding: const EdgeInsets.all(19.0),
                child: Image.asset(IconConstant.add),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
