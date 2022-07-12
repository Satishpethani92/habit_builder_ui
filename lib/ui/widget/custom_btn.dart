import 'package:flutter/material.dart';
import 'package:habit_builder_ui/core/constant/color_constant.dart';
import '../../core/constant/text_style_constant.dart';

customBtn({String? text, VoidCallback? onPressed, EdgeInsetsGeometry? margin}) {
  return Container(
      margin: margin /*const EdgeInsets.only(left: 15, right: 15, top: 25)*/,
      height: 53,
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: ColorConstant.buttonColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          onPressed: onPressed,
          child: Text(
            text ?? '',
            style: TextStyleConstant.allButtonTextStyle,
          )));
}
