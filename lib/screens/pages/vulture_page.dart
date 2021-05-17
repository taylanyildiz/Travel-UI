import 'dart:math';

import 'package:expedition_travel_challenge/screens/home_screen.dart';
import 'package:expedition_travel_challenge/widgets/circle_animation.dart';
import 'package:expedition_travel_challenge/widgets/map_hider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final size = MediaQuery.of(context).size;
    double opacitiy = 0.0;
    if (controller.position.hasContentDimensions) {
      opacitiy = controller.page!;
    }
    return Consumer<AnimationController>(
      builder: (context, animation, child) {
        return Positioned(
          top: 100 + (1 - animation.value) * size.height / 2,
          left: max(0, 6 * opacitiy - 5) * 20.0,
          child: MapHider(
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
          ),
        );
      },
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
    return Consumer<AnimationController>(
        builder: (context, animation, child) {
          return Positioned(
            bottom: 0.0,
            left: 20.0,
            child: child!,
          );
        },
        child: Opacity(
          opacity: max(0, (6 * opacitiy - 5)),
          child: TextButton(
            onPressed: () {
              final notifier =
                  Provider.of<MapAnimationNotifier>(context, listen: false);
              notifier.value == 0 ? notifier.forward() : notifier.reverse();
            },
            child: Text(
              'ON MAP',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13.0,
              ),
            ),
          ),
        ));
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
      child: MapHider(
        child: Opacity(
          opacity: max(0, 6 * opacitiy - 5),
          child: Text(
            '72 km.',
            style: TextStyle(
              color: Colors.white,
              fontSize: max(0, 6 * opacitiy - 5) * 16.0,
              fontWeight: FontWeight.bold,
            ),
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
    final size = MediaQuery.of(context).size;
    double opacitiy = 0.0;
    if (controller.position.hasContentDimensions) {
      opacitiy = controller.page!;
    }
    return Positioned(
      top: 150 + size.height / 1.85,
      left: max(0, 6 * opacitiy - 5) * 40.0,
      child: MapHider(
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
    final size = MediaQuery.of(context).size;
    double opacitiy = 0.0;
    if (controller.position.hasContentDimensions) {
      opacitiy = controller.page!;
    }
    return Consumer<AnimationController>(
      builder: (context, animation, child) {
        return Positioned(
          top: 150 + (1 - animation.value) * size.height / 1.85,
          right: max(0, 6 * opacitiy - 5) * 40.0,
          child: MapHider(
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
          ),
        );
      },
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
    final size = MediaQuery.of(context).size;
    double spacer = 0.0;

    return Consumer2<AnimationController, MapAnimationNotifier>(
      builder: (context, animation, notifier, child) {
        if (controller.position.hasContentDimensions) {
          spacer = max(0, (1 - animation.value) * 2 * controller.page! - 1);
        }
        return Positioned(
          bottom: size.height / 4.9,
          left: notifier.value > 0 ? -size.width / 2.6 * notifier.value : 0,
          right: 0,
          child: Center(
            child: Opacity(
              opacity: max(0, 6 * controller.page! - 5),
              child: Stack(
                children: [
                  Opacity(
                    opacity: max(0, 1 - animation.value),
                    child: Container(
                      margin: EdgeInsets.only(left: spacer * 40.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      height: 10.0,
                      width: 10.0,
                    ),
                  ),
                  Opacity(
                    opacity: max(0, 1 - animation.value),
                    child: Container(
                      margin: EdgeInsets.only(left: spacer * 15.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      height: 10.0,
                      width: 7.0,
                    ),
                  ),
                  Opacity(
                    opacity: max(0, 1 - animation.value),
                    child: Container(
                      margin: EdgeInsets.only(left: spacer * 25.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      height: 10.0,
                      width: 7.0,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 0.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 1.5,
                      ),
                      shape: BoxShape.circle,
                    ),
                    height: 10.0,
                    width: 10.0,
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
