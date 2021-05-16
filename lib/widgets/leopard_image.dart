import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LeopardImage extends AnimatedWidget {
  LeopardImage({
    Key? key,
    required this.controller,
  }) : super(key: key, listenable: controller);
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double offset = 0.0;
    if (controller.position.hasContentDimensions) {
      offset = controller.offset;
    }
    return Consumer<AnimationController>(
      builder: (context, animation, child) {
        return Positioned(
          width: (1 - animation.value * .05) * size.width * 1.6,
          left: -offset * .85 * (1 - animation.value * .07),
          child: IgnorePointer(
            child: Opacity(
              opacity: 1 - 0.6 * animation.value,
              child: Image.asset('assets/images/leopard.png'),
            ),
          ),
        );
      },
    );
  }
}
