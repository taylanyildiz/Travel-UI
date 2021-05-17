import 'dart:math';

import 'package:expedition_travel_challenge/widgets/map_hider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoreWidget extends StatefulWidget {
  @override
  _MoreWidgetState createState() => _MoreWidgetState();
}

class _MoreWidgetState extends State<MoreWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<AnimationController>(
      builder: (context, animation, child) {
        return Positioned(
          top: 100 + (1 - animation.value) * size.height / 2,
          right: 10.0,
          child: MapHider(
            child: Transform.rotate(
              angle: animation.drive(Tween(begin: 0.0, end: pi)).value,
              child: IconButton(
                onPressed: () {
                  if (animation.status == AnimationStatus.completed) {
                    animation.reverse();
                  } else {
                    animation.forward();
                  }
                },
                icon: Icon(
                  Icons.keyboard_arrow_up,
                  color: Colors.white,
                  size: 40.0,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
