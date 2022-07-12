import 'package:flutter/material.dart';
import 'package:habit_builder_ui/core/constant/color_constant.dart';
import 'package:habit_builder_ui/core/constant/text_style_constant.dart';

introPageImage(
    {String? text,
    String? titleText,
    String? image,
    double? heightU,
    double? heightD,
    VoidCallback? onPressed,
    double? height,
    bool? buttonShow}) {
  return SizedBox(
    width: double.infinity,
    height: double.infinity,
    child: Column(
      children: [
        SizedBox(height: height ?? 0),
        Text(text ?? '', style: TextStyleConstant.introPagesStyleU),
        Text(titleText ?? '', style: TextStyleConstant.introPagesStyleU),
        SizedBox(height: heightU ?? 1),
        Image.asset(image ?? ''),
        SizedBox(height: heightD ?? 1),
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
        const SizedBox(height: 50),
        buttonShow == true
            ? Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
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
    ),
  );
}
