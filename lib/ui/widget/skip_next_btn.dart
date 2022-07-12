import 'package:flutter/material.dart';

skipNextBtn({required AlignmentGeometry alignment, required VoidCallback onPressed, required String text}) {
  return Align(
    // alignment: alignment,
    child: Padding(
        padding: const EdgeInsets.only(bottom: 52, left: 20, right: 20),
        child: InkWell(
            onTap: onPressed, child: Text(text, style: const TextStyle(color: Color(0xFF573353), fontSize: 17)))),
  );
}
