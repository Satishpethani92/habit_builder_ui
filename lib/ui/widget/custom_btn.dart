import 'package:flutter/material.dart';
import 'package:habit_builder_ui/core/constant/color_constant.dart';
import '../../core/constant/text_style_constant.dart';

customBtn(
    {String? text,
    VoidCallback? onPressed,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    double? width,
    double? height}) {
  return Container(
      padding: padding,
      margin: margin,
      height: height ?? 53,
      width: width ?? double.infinity,
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
