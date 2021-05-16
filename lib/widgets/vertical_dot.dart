import 'dart:math';

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
        print(animation.value);
        return Positioned(
          bottom: bottom,
          left: 0,
          right: 0,
          top: top,
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 2.0,
                  height: double.infinity,
                  color: Colors.white,
                ),
                animation.value > 0.0
                    ? Align(
                        alignment: Alignment(0, -1),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          width: 8.0,
                          height: 8.0,
                        ),
                      )
                    : SizedBox.shrink(),
                animation.value > 0.0
                    ? Positioned(
                        bottom: top <= size.height / 2 ? size.height / 3 : top,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          width: 8.0,
                          height: 8.0,
                        ),
                      )
                    : SizedBox.shrink(),
                animation.value > 0.0
                    ? Positioned(
                        bottom: top <= size.height ? size.height / 6 : top,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          width: 8.0,
                          height: 8.0,
                        ),
                      )
                    : SizedBox.shrink(),
                animation.value >= 0.7
                    ? Positioned(
                        right: (size.width / 4) * animation.value,
                        bottom: top <= size.height ? size.height / 6 : top,
                        child: Opacity(
                          opacity: max(0, 5 * animation.value - 4),
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
                    : SizedBox.shrink(),
                animation.value > 0.0
                    ? Positioned(
                        left: (size.width / 4) * animation.value,
                        bottom: top <= size.height / 2 ? size.height / 3 : top,
                        child: Opacity(
                          opacity: max(0, 5 * animation.value - 4),
                          child: Column(
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
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        );
      },
    );
  }
}
