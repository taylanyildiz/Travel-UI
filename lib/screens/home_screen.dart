import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/widget.dart';
import 'screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key? key,
    this.title,
  }) : super(key: key);

  final String? title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

double mainSquareSize(BuildContext context) =>
    MediaQuery.of(context).size.height / 2;

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late PageController _pageController;

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  double get maxHeight => mainSquareSize(context);

  void _handleDragUpdate(DragUpdateDetails details) {
    _animationController.value -= details.primaryDelta! / maxHeight;
  }

  void _handleDragEnd(DragEndDetails details) {
    if (_animationController.isAnimating ||
        _animationController.status == AnimationStatus.completed) return;

    final double flingVelocity =
        details.velocity.pixelsPerSecond.dy / maxHeight;
    if (flingVelocity < 0.0)
      _animationController.fling(velocity: max(2.0, -flingVelocity));
    else if (flingVelocity > 0.0)
      _animationController.fling(velocity: min(-2.0, -flingVelocity));
    else
      _animationController.fling(
          velocity: _animationController.value < 0.5 ? -2.0 : 2.0);
  }

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    bool isPage = false;
    if (currentPage == 1) {
      isPage = true;
    } else {
      isPage = false;
    }
    return ListenableProvider.value(
      value: _animationController,
      child: Scaffold(
        body: SafeArea(
          child: GestureDetector(
            onVerticalDragUpdate: isPage ? _handleDragUpdate : null,
            onVerticalDragEnd: isPage ? _handleDragEnd : null,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                PageView(
                  onPageChanged: (page) => setState(() => currentPage = page),
                  controller: _pageController,
                  physics: ClampingScrollPhysics(),
                  children: [
                    LeopardPage(controller: _pageController),
                    VulturePage(controller: _pageController),
                  ],
                ),
                PageIndicator(
                  listen: _pageController,
                  pageCount: 2,
                  indicatorColor: Colors.grey,
                  radius: 4.0,
                ),
                LeopardImage(controller: _pageController),
                VultureImage(controller: _pageController),
                CustomAppBar(),
                ShareButton(),
                MoreWidget(),
                VerticalDot(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
