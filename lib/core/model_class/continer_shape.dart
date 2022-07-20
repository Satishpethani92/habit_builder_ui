import 'package:flutter/material.dart';

class ContinerShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(size.width / 2, 3.0)
      ..lineTo(5.5, size.height / 1.3)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class ContinerShapee extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(size.width / 1.1, 3.0)
      ..lineTo(6, size.height / 1.25)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

// ..lineTo(0.0, size.height / 2)
// ..lineTo(size.width / 2, size.height)
// ..lineTo(size.width, size.height / 2)
