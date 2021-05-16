import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VultureImage extends AnimatedWidget {
  VultureImage({
    Key? key,
    required this.controller,
  }) : super(key: key, listenable: controller);

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    double offset = 0.0;
    if (controller.position.hasContentDimensions) {
      offset = controller.offset;
    }
    return Consumer<AnimationController>(
      builder: (context, animation, child) {
        return Positioned(
          left: (1.2 * MediaQuery.of(context).size.width - offset * .85) *
              (1 - animation.value * .01),
          child: IgnorePointer(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 60.0),
              child: Opacity(
                opacity: 1 - 0.6 * animation.value,
                child: Image.asset(
                  'assets/images/vulture.png',
                  height: (1 - animation.value * .08) *
                      MediaQuery.of(context).size.height /
                      3,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
