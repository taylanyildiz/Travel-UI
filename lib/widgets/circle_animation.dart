import 'dart:math';

import 'package:expedition_travel_challenge/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CircleAnimation extends AnimatedWidget {
  CircleAnimation({
    Key? key,
    required this.controller,
  }) : super(key: key, listenable: controller);

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double value = 0.0;
    if (controller.position.hasContentDimensions) {
      value = controller.page!;
    }
    return Consumer2<AnimationController, MapAnimationNotifier>(
      builder: (context, animation, notifier, child) {
        return Positioned(
          top: size.height / 5,
          child: Center(
            child: Transform.scale(
              scale: (1 - notifier.value) *
                  (1 - animation.value) *
                  max(0.0, 5 * value - 4),
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
      },
    );
  }
}
