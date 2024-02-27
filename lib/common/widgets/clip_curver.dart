import 'package:flutter/material.dart';

class TCurverWidgets extends StatelessWidget {
  const
  TCurverWidgets({
    super.key, this.child,
  });
  final Widget ? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TcustomCurveEdges(),      //curves at home page design
      child:child,
    );
  }
}

class TcustomCurveEdges extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path=Path();
    path.lineTo(0, size.height);

    final firstCurve=Offset(0,size.height-20);
    final lastCurve=Offset(30,size.height-20);
    path.quadraticBezierTo(firstCurve.dx, firstCurve.dy, lastCurve.dx, lastCurve.dy);

    final secondCurve=Offset(0,size.height-20);
    final secondlastCurve=Offset(size.width-30,size.height-20);
    path.quadraticBezierTo(secondCurve.dx, secondCurve.dy, secondlastCurve.dx, secondlastCurve.dy);

    final thirdCurve=Offset(size.width,size.height-20);
    final thirdlastCurve=Offset(size.width,size.height);
    path.quadraticBezierTo(thirdCurve.dx, thirdCurve.dy, thirdlastCurve.dx, thirdlastCurve.dy);


    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }}