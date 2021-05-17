import 'package:expedition_travel_challenge/screens/home_screen.dart';
import 'package:expedition_travel_challenge/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VerticalDot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer2<AnimationController, MapAnimationNotifier>(
      builder: (context, animation, notifier, child) {
        double bottom = size.height / 4.9 + 8;
        double top = size.height /
            (6 * (animation.value < 0.8 ? animation.value * .9 : .7));
        double value = 0;
        if (animation.value < 1) {
          value = 1;
        } else if (notifier.value == 0) {
          value = 3 * (animation.value - 2 / 3);
        } else if (notifier.value < 0.3) {
          value = 1 - 3 * notifier.value;
        } else {
          value = 0;
        }
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
                  Opacity(
                    opacity: value,
                    child: Container(
                      width: 4.0,
                      height: double.infinity,
                      color: Colors.white,
                    ),
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
