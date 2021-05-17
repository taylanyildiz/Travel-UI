import 'dart:math';

import 'package:expedition_travel_challenge/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurvedImages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bottom = size.width / 4.9 + 8.0;
    final top = size.height / (6 * .9);

    return Consumer<MapAnimationNotifier>(
      builder: (context, notifier, child) {
        double value = 2 * notifier.value - 1;
        return Positioned(
          top: top,
          bottom: bottom,
          left: 0.0,
          right: 0.0,
          child: Opacity(
            opacity: max(0, value),
            child: Center(
              child: Stack(
                children: [
                  Positioned(
                    top: size.height / 5.5,
                    left: size.width * .45 + size.width * .04 * notifier.value,
                    child: Image.asset('assets/images/leopards.png'),
                  ),
                  Positioned(
                    right: size.width * .15 + size.width * .05 * notifier.value,
                    top: size.height / 2.5,
                    child: Image.asset('assets/images/vultures.png'),
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
