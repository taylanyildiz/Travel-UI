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

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
    );
  }
}
