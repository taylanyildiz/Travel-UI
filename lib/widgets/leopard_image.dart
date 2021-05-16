import 'package:flutter/material.dart';

class LeopardImage extends AnimatedWidget {
  LeopardImage({
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
      width: MediaQuery.of(context).size.width * 1.6,
      left: -offset * .85,
      child: IgnorePointer(
        child: Image.asset('assets/images/leopard.png'),
      ),
    );
  }
}
