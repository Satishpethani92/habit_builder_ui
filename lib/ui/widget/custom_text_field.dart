import 'package:flutter/material.dart';

customTextField({
  bool? prefixIcon,
  TextStyle? style,
  GestureTapCallback? suffixTap,
  bool obscureText = true,
  Widget? iconBtn,
  Widget? prefix,
  Color? color,
  EdgeInsetsGeometry? margin,
  EdgeInsetsGeometry? padding,
}) {
  return Container(
    padding: padding,
    margin: margin,
    height: 50,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: color,
    ),
    child: Center(
      child: TextFormField(
        obscureText: obscureText,
        style: style,
        cursorColor: const Color(0xFF573353),
        cursorHeight: 23,
        decoration: InputDecoration(
          border: InputBorder.none,
          suffixIcon: iconBtn,
          prefixIcon: prefix,
        ),
      ),
    ),
  );
}
