import 'package:flutter/material.dart';
import 'package:habit_builder_ui/core/constant/color_constant.dart';
import 'package:habit_builder_ui/core/constant/text_style_constant.dart';

introPageImage({String? text, String? image, VoidCallback? onPressed, bool? buttonShow, EdgeInsetsGeometry? margin}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(text ?? '',
            style: TextStyleConstant.introPagesStyleU,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center),
      ),
      Container(
        margin: margin,
        child: Image.asset(image ?? ''),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
              text: const TextSpan(text: 'WE CAN ', style: TextStyleConstant.introPagesStyleD, children: [
            TextSpan(text: 'HELP YOU', style: TextStyleConstant.introPagesStyleRichTExtD),
            TextSpan(text: ' TO BE A BETTER\n             VERSION OF', style: TextStyleConstant.introPagesStyleD),
            TextSpan(text: ' YOURSELF.', style: TextStyleConstant.introPagesStyleRichTExtD)
          ])),
        ],
      ),
      buttonShow == true
          ? Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 50),
              height: 57,
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: ColorConstant.buttonColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                  onPressed: onPressed,
                  child: const Text(
                    "Get Started",
                    style: TextStyleConstant.allButtonTextStyle,
                  )))
          : const SizedBox(),
    ],
  );
}
