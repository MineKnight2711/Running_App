import 'package:flutter/material.dart';
import 'package:flutter_running_demo/controllers/tabbar_controller.dart';
import 'package:flutter_running_demo/screens/preparation/preparation_screen.dart';
import 'package:flutter_running_demo/screens/progress/progress_screen/progress_screen.dart';
import 'package:get/get.dart';

import '../../../widgets/bottom_bar/bottom_tabbar.dart';

class TabBarViewScreen extends StatefulWidget {
  const TabBarViewScreen({super.key});

  @override
  State<TabBarViewScreen> createState() => _TabBarViewScreenState();
}

class _TabBarViewScreenState extends State<TabBarViewScreen>
    with TickerProviderStateMixin {
  final bottomBarController = Get.find<BottomTabBarController>();
  @override
  void initState() {
    super.initState();
    bottomBarController.initTabController(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: bottomBarController.tabController.value,
        children: const [
          ProgressScreen(),
          PreparationScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationTabBar(
        onTabChange: (index) {},
      ),
    );
  }
}
