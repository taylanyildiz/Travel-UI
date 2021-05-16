import 'dart:math';

import 'package:expedition_travel_challenge/widgets/circle_animation.dart';
import 'package:flutter/material.dart';

class VulturePage extends StatelessWidget {
  VulturePage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAnimation(controller: controller),
        _TravelDetailText(controller: controller),
        _StartCampDetail(controller: controller),
        _CenterCircle(controller: controller),
        _OnMapButton(controller: controller),
        _BaseCamp(controller: controller),
        _KmText(controller: controller),
        _BiggerCircle(controller: controller),
      ],
    );
  }
}

class _TravelDetailText extends AnimatedWidget {
  _TravelDetailText({
    Key? key,
    required this.controller,
  }) : super(key: key, listenable: controller);

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    double opacitiy = 0.0;
    if (controller.position.hasContentDimensions) {
      opacitiy = controller.page!;
    }
    return Positioned(
      bottom: 200.0,
      left: 20.0,
      child: Opacity(
        opacity: max(0, 6 * opacitiy - 5),
        child: Text(
          'Travel Detail',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _OnMapButton extends AnimatedWidget {
  _OnMapButton({
    Key? key,
    required this.controller,
  }) : super(key: key, listenable: controller);

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    double opacitiy = 0.0;
    if (controller.position.hasContentDimensions) {
      opacitiy = controller.page!;
    }
    return Positioned(
      bottom: 0.0,
      left: 20.0,
      child: Opacity(
          opacity: max(0, 6 * opacitiy - 5),
          child: TextButton(
            onPressed: () => print('on map'),
            child: Text(
              'ON MAP',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13.0,
              ),
            ),
          )),
    );
  }
}

class _KmText extends AnimatedWidget {
  _KmText({
    Key? key,
    required this.controller,
  }) : super(key: key, listenable: controller);

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    double opacitiy = 0.0;
    if (controller.position.hasContentDimensions) {
      opacitiy = controller.page!;
    }
    return Positioned(
      bottom: 100.0,
      child: Opacity(
        opacity: max(0, 6 * opacitiy - 5),
        child: Text(
          '72 km.',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _StartCampDetail extends AnimatedWidget {
  _StartCampDetail({
    Key? key,
    required this.controller,
  }) : super(key: key, listenable: controller);

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    double opacitiy = 0.0;
    if (controller.position.hasContentDimensions) {
      opacitiy = controller.page!;
    }
    return Positioned(
      bottom: 100.0,
      left: 40.0,
      child: Opacity(
        opacity: max(0, 6 * opacitiy - 5),
        child: Column(
          children: [
            Text(
              'Start camp',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              '02:40 pm',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BaseCamp extends AnimatedWidget {
  _BaseCamp({
    Key? key,
    required this.controller,
  }) : super(key: key, listenable: controller);

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    double opacitiy = 0.0;
    if (controller.position.hasContentDimensions) {
      opacitiy = controller.page!;
    }
    return Positioned(
      bottom: 100.0,
      right: 40.0,
      child: Opacity(
        opacity: max(0, 6 * opacitiy - 5),
        child: Column(
          children: [
            Text(
              'Base camp',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              '07:30 pm',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CenterCircle extends AnimatedWidget {
  _CenterCircle({
    Key? key,
    required this.controller,
  }) : super(key: key, listenable: controller);

  final PageController controller;
  @override
  Widget build(BuildContext context) {
    double opacitiy = 0.0;
    if (controller.position.hasContentDimensions) {
      opacitiy = controller.page!;
    }
    return Positioned(
      bottom: 145.0,
      child: Opacity(
        opacity: max(0, 6 * opacitiy - 5),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 5.0),
            Container(
              padding: EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BiggerCircle extends AnimatedWidget {
  _BiggerCircle({
    Key? key,
    required this.controller,
  }) : super(key: key, listenable: controller);

  final PageController controller;
  @override
  Widget build(BuildContext context) {
    double opacitiy = 0.0;
    if (controller.position.hasContentDimensions) {
      opacitiy = controller.page!;
    }
    return Positioned(
      bottom: 142.5,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white),
            ),
          ),
          SizedBox(width: 40.0),
          Container(
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}
