import 'dart:math';

import 'package:flutter/material.dart';

class CircleAnimation extends AnimatedWidget {
  CircleAnimation({
    Key? key,
    required this.controller,
  }) : super(key: key, listenable: controller);

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    double value = 0.0;
    if (controller.position.hasContentDimensions) {
      value = controller.page!;
    }
    return Positioned(
      top: 200.0,
      child: Center(
        child: Transform.scale(
          scale: max(0.0, 5 * value - 4),
          child: Container(
            height: 200.0,
            width: 200.0,
            decoration: BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
