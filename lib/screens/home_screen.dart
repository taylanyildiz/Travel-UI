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

  _handleDragUpdate(detail) {}

  _handleDragEnd(detail) {}

  @override
  Widget build(BuildContext context) {
    return ListenableProvider.value(
      value: _animationController,
      child: Scaffold(
        body: SafeArea(
          child: GestureDetector(
            onVerticalDragUpdate: _handleDragUpdate,
            onVerticalDragEnd: _handleDragEnd,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                PageView(
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
                CustomAppBar(),
                ShareButton(),
                LeopardImage(controller: _pageController),
                VultureImage(controller: _pageController),
                MoreWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
