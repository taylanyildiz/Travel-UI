import 'package:expedition_travel_challenge/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VerticalDot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<AnimationController>(
      builder: (context, animation, child) {
        double bottom = size.height / 4.9 + 8;
        double top = size.height /
            (6 * (animation.value < 0.8 ? animation.value * .9 : .7));
        return Positioned(
          bottom: bottom,
          left: 0,
          right: 0,
          top: top,
          child: MapHider(
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 2.0,
                    height: double.infinity,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
