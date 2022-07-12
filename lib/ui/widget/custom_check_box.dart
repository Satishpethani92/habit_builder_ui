import 'package:flutter/material.dart';

customCheckBox({bool? value, ValueChanged<bool?>? onChanged, String? text}) {
  return Row(
    children: [
      Checkbox(
          checkColor: const Color(0xFF573353),
          activeColor: const Color(0xFFFDA758),
          value: value,
          onChanged: onChanged),
      Text(
        text ?? '',
        style: const TextStyle(color: Color(0xFF573353), fontSize: 16),
      )
    ],
  );
}
