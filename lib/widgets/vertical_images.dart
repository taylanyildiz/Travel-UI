import 'dart:math';
import 'package:expedition_travel_challenge/screens/home_screen.dart';
import 'package:expedition_travel_challenge/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VerticalImages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer2<AnimationController, MapAnimationNotifier>(
      builder: (context, animation, notifier, child) {
        double bottom = size.height / 4.9 + 8;
        double top = size.height /
            (6 * (animation.value < 0.8 ? animation.value * .9 : .7));
        double value = 0;
        if (animation.value < 2 / 3) {
          value = 0;
        } else if (notifier.value == 0) {
          value = 3 * (animation.value - 2 / 3);
        } else if (notifier.value < 0.33) {
          value = 1 - 3 * notifier.value;
        } else {
          value = 0;
        }
        return Positioned(
          bottom: bottom,
          top: top,
          left: 0,
          right: 0,
          child: MapHider(
            child: Center(
              child: Stack(
                children: [
                  Positioned(
                    left: size.width * .15 +
                        (size.width * .1) *
                            animation.value *
                            (1 - notifier.value),
                    bottom: top <= size.height / 2 ? size.height / 3.05 : top,
                    child: Opacity(
                      opacity: value,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/images/leopards.png'),
                          SizedBox(height: 10.0),
                          Text(
                            'Leopards',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: size.width * .15 +
                        (size.width * .1) *
                            animation.value *
                            (1 - notifier.value),
                    bottom: top <= size.height ? size.height / 6 : top,
                    child: Opacity(
                      opacity: value,
                      child: Column(
                        children: [
                          Image.asset('assets/images/vultures.png'),
                          SizedBox(height: 10.0),
                          Text(
                            'Vultures',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
