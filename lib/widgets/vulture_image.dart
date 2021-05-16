import 'package:flutter/material.dart';

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
    return Positioned(
      left: 1.2 * MediaQuery.of(context).size.width - offset * .85,
      child: IgnorePointer(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 60.0),
          child: Image.asset(
            'assets/images/vulture.png',
            height: MediaQuery.of(context).size.height / 3,
          ),
        ),
      ),
    );
  }
}
