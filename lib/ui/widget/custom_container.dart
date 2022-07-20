import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:habit_builder_ui/core/constant/color_constant.dart';
import 'package:habit_builder_ui/core/model_class/continer_shape.dart';

Widget customContainer({String? text, double? width, double? height, TextStyle? style}) {
  return Column(
    children: [
      Text(text!, style: style),
      Container(
        height: height ?? 40,
        width: width ?? 40,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(13), color: ColorConstant.logInBackGround),
        child: Container(
            margin: const EdgeInsets.all(3),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(13), color: const Color(0xFFFC9D45))),
      ),
    ],
  );
}

Widget customContainerHalf({String? text, TextStyle? style, EdgeInsetsGeometry? margin}) {
  return Stack(
    children: [
      Column(
        children: [
          Text(text!, style: style),
          Container(
            margin: const EdgeInsets.only(left: 10, top: 1),
            height: 40,
            width: 40,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(13), color: ColorConstant.logInBackGround),
          ),
        ],
      ),
      Container(
        margin: margin ?? const EdgeInsets.only(top: 10),
        child: Transform.rotate(
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
                        color: Color(0xFFFC9D45))))),
      )
    ],
  );
}
