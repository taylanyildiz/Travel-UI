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
        _OnMapButton(controller: controller),
        _BaseCamp(controller: controller),
        _KmText(controller: controller),
        _CenterCircle(controller: controller),
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
    double opacity = 0.0;
    if (controller.position.hasContentDimensions) {
      opacity = max(0, 6 * controller.page! - 5);
    }
    return Positioned(
      bottom: 145.0,
      child: Center(
        child: Opacity(
          opacity: opacity,
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(left: opacity * 40.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white),
                ),
                height: 8.0,
                width: 8.0,
              ),
              Container(
                margin: EdgeInsets.only(left: opacity * 15.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
                height: 8.0,
                width: 6.0,
              ),
              Container(
                margin: EdgeInsets.only(left: opacity * 25.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
                height: 8.0,
                width: 6.0,
              ),
              Container(
                margin: EdgeInsets.only(left: 0.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                height: 8.0,
                width: 8.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
