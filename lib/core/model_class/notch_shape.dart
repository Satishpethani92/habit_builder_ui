import 'package:flutter/cupertino.dart';

class CurveDraw extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double sw = size.width;
    double sh = size.height;
    Path path = Path();
    path.moveTo(0, sh);
    path.lineTo(0, sh / 2);
    path.quadraticBezierTo(0, 0, sh / 50, 0); //1st curve
    path.lineTo(sw / 2 - sw / 5, 0);

    ///

    path.cubicTo(sw / 1.85 - sw / 8, 0, sw / 1.8 - sw / 6, sh / 2.5, sw / 2, sh / 2.25);
    path.cubicTo(sw / 2.2 + sw / 7, sh / 2.5, sw / 2 + sw / 10, 0, sw / 2 + sw / 5, 0);

    ///
    path.lineTo(sw - sh / 2, 0);
    path.quadraticBezierTo(sw, 0, size.width, sh / 50);
    path.lineTo(sw, sh);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
