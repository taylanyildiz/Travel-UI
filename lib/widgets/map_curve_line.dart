import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MapLine extends CustomPainter {
  MapLine({
    required this.animation,
  })   : mapLinePaint = Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = 4.0
          ..strokeCap = StrokeCap.round,
        super(repaint: animation);

  final Animation<double> animation;

  final Paint mapLinePaint;

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(size.width / 2 + size.width * .05 * animation.value, 5);
    path.cubicTo(
      size.width / 2 + size.width * .2 * animation.value,
      size.height / 6,
      size.width / 2,
      size.height / 6,
      size.width / 2 + size.width * .16 * animation.value,
      size.height / 3.3,
    );
    path.cubicTo(
      size.width / 2 + size.width * .3 * animation.value,
      size.height / 2,
      size.width / 2 + size.width * .3 * animation.value,
      size.height / 2,
      size.width / 2 + size.width * .12 * animation.value,
      size.height / 1.3,
    );
    path.cubicTo(
      size.width / 2,
      size.height / 1.3,
      size.width / 2,
      size.height / 1.3,
      size.width / 2 - size.width * .01 * animation.value,
      size.height / 1.2,
    );
    path.cubicTo(
      size.width / 2 - size.width * .2 * animation.value,
      size.height,
      size.width / 2,
      size.height,
      size.width / 2 - size.width * .18 * animation.value,
      size.height + 4,
    );

    if (animation.value > 0) {
      canvas.drawPath(path, mapLinePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      (oldDelegate as MapLine).animation != animation;
}
