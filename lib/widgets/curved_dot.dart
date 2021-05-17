import 'package:expedition_travel_challenge/screens/home_screen.dart';
import 'package:expedition_travel_challenge/widgets/map_curve_line.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurvedDot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer2<AnimationController, MapAnimationNotifier>(
      builder: (context, animation, notifier, child) {
        double bottom = size.height / 4.9 + 8;
        double top = size.height /
            (6 * (animation.value < 0.8 ? animation.value * .9 : .7));
        return Positioned(
          bottom: bottom,
          left: 0,
          right: 0,
          top: top,
          child: CustomPaint(
            painter: MapLine(animation: notifier.animation),
            child: Center(
              child: animation.value > 0
                  ? Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment(0.1 * notifier.value, -1),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            width: 10.0,
                            height: 10.0,
                          ),
                        ),
                        Positioned(
                          bottom: top <= size.height / 2
                              ? notifier.value > 0
                                  ? size.height / 3 +
                                      size.height * 0.02 * notifier.value
                                  : size.height / 3
                              : top,
                          right: notifier.value > 0 ? -120 * notifier.value : 0,
                          left: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            width: 10.0,
                            height: 10.0,
                          ),
                        ),
                        Positioned(
                          bottom: top <= size.height / 1.5
                              ? notifier.value > 0
                                  ? size.height / 6 -
                                      size.height * 0.05 * notifier.value
                                  : size.height / 6
                              : top,
                          right: notifier.value > 0 ? -100 * notifier.value : 0,
                          left: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            width: 10.0,
                            height: 10.0,
                          ),
                        ),
                      ],
                    )
                  : SizedBox.shrink(),

              /// for optimze.
            ),
          ),
        );
      },
    );
  }
}
