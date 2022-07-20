import 'package:flutter/cupertino.dart';

analyticsContainer({String? text, String? textD, String? image, TextStyle? styleD, TextStyle? style}) {
  return SizedBox(
    height: 80,
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text ?? '',
                style: style ?? const TextStyle(color: Color(0xFF573353), fontWeight: FontWeight.w700, fontSize: 21),
              ),
              Text(
                textD ?? '',
                style: styleD ?? const TextStyle(color: Color(0xFF573353), fontWeight: FontWeight.w200, fontSize: 16),
              )
            ],
          ),
        ),
        const Spacer(),
        SizedBox(height: 60, width: 60, child: Image.asset(image ?? ''))
      ],
    ),
  );
}
