import 'package:flutter/material.dart';
import 'package:flutter_running_demo/controllers/tabbar_controller.dart';
import 'package:flutter_running_demo/screens/preparation/preparation_screen.dart';
import 'package:flutter_running_demo/screens/progress/progress_screen/progress_screen.dart';
import 'package:get/get.dart';

import '../../../widgets/bottom_bar/bottom_tabbar.dart';

class ActivitiesScreen extends StatefulWidget {
  const ActivitiesScreen({super.key});

  @override
  State<ActivitiesScreen> createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen>
    with TickerProviderStateMixin {
  final bottomBarController = Get.find<BottomTabBarController>();
  late PageController _pageViewController;
  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    bottomBarController.initTabController(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageViewController,
        children: [
          const ProgressScreen(),
          PreparationScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationTabBar(
        onTabChange: (index) {
          print(index);
          _pageViewController.animateToPage(index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn);
        },
      ),
    );
  }
}
