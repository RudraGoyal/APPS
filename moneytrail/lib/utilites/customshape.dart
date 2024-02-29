import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Customshape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();
    path.lineTo(0, height);

    path.quadraticBezierTo(10, height - 50, width / 8, height - 50);
    path.lineTo(width - 40, height - 50);
    path.quadraticBezierTo(width, height - 50, width, height - 100);
    // path.lineTo(width, height - 80);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
