import 'dart:math';
import 'package:flutter/material.dart';

class LeopardPage extends StatelessWidget {
  LeopardPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _The72Text(controller: controller),
        _LeopardDescription(controller: controller),
      ],
    );
  }
}

class _The72Text extends AnimatedWidget {
  _The72Text({
    Key? key,
    required this.controller,
  }) : super(key: key, listenable: controller);
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      top: size.height / 8,
      child: Transform.translate(
        offset: Offset(-60 - 0.5 * (controller.offset), 0),
        child: RotatedBox(
          quarterTurns: 1,
          child: Text(
            '72',
            style: TextStyle(
              color: Colors.white,
              fontSize: 350.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class _LeopardDescription extends AnimatedWidget {
  _LeopardDescription({
    Key? key,
    required this.controller,
  }) : super(key: key, listenable: controller);

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double opacity = 0.0;
    if (controller.position.hasContentDimensions) {
      opacity = controller.page!;
    }
    return Positioned(
      bottom: size.height * .09,
      child: Opacity(
        opacity: max(0.0, 1 - 1.5 * opacity),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: Container(
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Travel description',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 40.0),
                Text(
                  'The leopard is distinguished by its well-camouflaged fur, opportunistic hunting behaviour, broad diet, and strength.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
