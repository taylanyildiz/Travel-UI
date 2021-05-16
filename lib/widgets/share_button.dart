import 'package:flutter/material.dart';

class ShareButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10.0,
      right: 10.0,
      child: IconButton(
        color: Colors.white,
        iconSize: 30.0,
        icon: Icon(Icons.share),
        onPressed: () => print('share'),
      ),
    );
  }
}
