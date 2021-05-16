import 'package:flutter/material.dart';

class MoreWidget extends StatefulWidget {
  @override
  _MoreWidgetState createState() => _MoreWidgetState();
}

class _MoreWidgetState extends State<MoreWidget> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 200.0,
      right: 20.0,
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
