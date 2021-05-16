import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoreWidget extends StatefulWidget {
  @override
  _MoreWidgetState createState() => _MoreWidgetState();
}

class _MoreWidgetState extends State<MoreWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AnimationController>(
      builder: (context, animation, child) {
        return Positioned(
          top: (1 - animation.value) * 650.0,
          right: 20.0,
          child: child!,
        );
      },
      child: GestureDetector(
        child: Icon(
          Icons.keyboard_arrow_up,
          color: Colors.white,
          size: 30.0,
        ),
      ),
    );
  }
}
