import 'package:flutter/cupertino.dart';

class CustomClipOval extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    Rect r = Rect.fromCenter(
      center: Offset(size.width * .5, size.width * .4),
      height: size.width * .68,
      width: size.width * .58,
    );
    return r;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) => false;
}
