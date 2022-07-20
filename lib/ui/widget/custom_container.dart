import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:habit_builder_ui/core/constant/color_constant.dart';
import 'package:habit_builder_ui/core/model_class/continer_shape.dart';

Widget customContainer({String? text}) {
  return Column(
    children: [
      Text(text!),
      Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(13), color: ColorConstant.logInBackGround),
        child: Container(
            margin: const EdgeInsets.all(3),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(13), color: const Color(0xFFFC9D45))),
      ),
    ],
  );
}

Widget customContainerHalf({String? text}) {
  return Stack(
    children: [
      Column(
        children: [
          Text(text!),
          Container(
            margin: const EdgeInsets.only(left: 10, top: 4),
            height: 40,
            width: 40,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(13), color: ColorConstant.logInBackGround),
          ),
        ],
      ),
      Transform.rotate(
          angle: -math.pi / 2.1,
          child: ClipPath(
              clipper: ContinerShape(),
              child: Container(
                  margin: const EdgeInsets.all(3),
                  width: 65,
                  height: 41,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(13),
                          topLeft: Radius.circular(13),
                          bottomRight: Radius.circular(50),
                          bottomLeft: Radius.circular(37)),
                      color: Color(0xFFFC9D45)))))
    ],
  );
}
