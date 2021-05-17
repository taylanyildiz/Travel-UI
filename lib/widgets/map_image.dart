import 'dart:math';

import 'package:expedition_travel_challenge/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MapImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MapAnimationNotifier>(
      builder: (context, notifier, child) {
        double scale = 1 + 0.3 * (1 - notifier.value);
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..scale(scale, scale)
            ..rotateZ(0.05 * pi * (1 - notifier.value)),
          child: Opacity(
            opacity: notifier.value,
            child: child,
          ),
        );
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(
          'assets/images/map.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
