import 'package:flutter/material.dart';

//Copy this CustomPainter code to the Bottom of the File
class Ornament extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(34, 18.5);
    path_0.arcToPoint(const Offset(18.5, 3),
        radius: const Radius.elliptical(15.5, 15.5),
        rotation: 0,
        largeArc: true,
        clockwise: true);
    path_0.arcToPoint(const Offset(34, 18.5),
        radius: const Radius.elliptical(15.5, 15.5),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.close();

    Paint paint0Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.06060606;
    paint0Stroke.color = const Color(0xff2d1a07).withOpacity(1.0);
    paint0Stroke.strokeCap = StrokeCap.round;
    paint0Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_0, paint0Stroke);

    Path path_1 = Path();
    path_1.moveTo(24.784, 11.64);
    path_1.lineTo(21.5, 21.5);
    path_1.lineTo(11.64, 24.784);
    path_1.lineTo(14.926, 14.925999999999998);
    path_1.close();

    Paint paint1Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.06060606;
    paint1Stroke.color = const Color(0xff2d1a07).withOpacity(1.0);
    paint1Stroke.strokeCap = StrokeCap.round;
    paint1Stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_1, paint1Stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
