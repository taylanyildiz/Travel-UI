import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  PageIndicator({
    Key? key,
    required this.listen,
    required this.pageCount,
    this.indicatorColor,
    this.defaultIndicatorColor,
    this.radius,
    this.space,
    this.thickness,
  }) : super(key: key);

  final PageController listen;

  final Color? indicatorColor;

  final Color? defaultIndicatorColor;

  final int pageCount;

  final double? radius;

  final double? space;

  final double? thickness;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30.0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: CustomPaint(
          painter: _PageIndicatorPaint(
            listen: listen,
            pageCount: pageCount,
            indicatorColor: indicatorColor,
            defaultIndicatorColor: defaultIndicatorColor,
            thickness: thickness ?? 1.0,
            radius: radius ?? 6.0,
            space: space ?? 3.0,
          ),
        ),
      ),
    );
  }
}

class _PageIndicatorPaint extends CustomPainter {
  _PageIndicatorPaint({
    required this.listen,
    required this.pageCount,
    this.indicatorColor,
    this.defaultIndicatorColor,
    this.radius = 6.0,
    this.space = 3.0,
    this.thickness = 1.0,
  })  : indicatorPaint = Paint()
          ..color = indicatorColor ?? Colors.black
          ..style = PaintingStyle.fill,
        circleIndicatorPaint = Paint()
          ..color = defaultIndicatorColor ?? Colors.white
          ..style = PaintingStyle.fill;

  final PageController listen;

  final Color? indicatorColor;

  final Color? defaultIndicatorColor;

  final Paint indicatorPaint;

  final Paint circleIndicatorPaint;

  final double? radius;

  final double? space;

  final double? thickness;

  final int pageCount;

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = size.center(Offset.zero);
    final double totalWidth =
        (pageCount * radius! * 2) - ((pageCount - 1) * space!);
    _drawDefaultIndicator(canvas, center, totalWidth);
    _drawIndicator(canvas, center, totalWidth);
  }

  void _drawDefaultIndicator(Canvas canvas, Offset center, double totalWidth) {
    Offset circleCenter = center.translate((-totalWidth / 2) + radius!, 0);
    for (var page = 0; page < pageCount; page++) {
      canvas.drawCircle(
          circleCenter, radius! - thickness!, circleIndicatorPaint);
      circleCenter = circleCenter.translate((2 * radius!) + space!, 0);
    }
  }

  void _drawIndicator(Canvas canvas, Offset center, double totalWidth) {
    double page = 0.0;
    if (listen.hasClients && listen.page != null) {
      page = listen.page!;
    } else {
      page = 0.0;
    }

    final int pageIndexToLeft = page.floor();

    final double leftDot = (center.dx - (totalWidth / 2)) +
        (pageIndexToLeft * ((2 * radius!) + space!));

    final double transtion = page - pageIndexToLeft;

    final positionLeft = leftDot + (transtion * ((2 * radius!) + space!));

    final positionRight = positionLeft + (2 * radius!);

    canvas.drawRRect(
      RRect.fromLTRBR(
        positionLeft,
        -radius!,
        positionRight,
        radius!,
        Radius.circular(radius!),
      ),
      indicatorPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
