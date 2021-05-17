import 'package:expedition_travel_challenge/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MapHider extends StatelessWidget {
  MapHider({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Consumer<MapAnimationNotifier>(
      builder: (context, notfier, child) {
        return Opacity(
          opacity: 1 - notfier.value,
          child: child,
        );
      },
      child: child,
    );
  }
}
