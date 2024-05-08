import 'package:flutter/material.dart';
import 'package:flutter_running_demo/controllers/tabbar_controller.dart';
import 'package:flutter_running_demo/screens/preparation/preparation_screen.dart';
import 'package:flutter_running_demo/screens/progress/activities_details/activities_details.dart';
import 'package:get/get.dart';

import '../../../widgets/bottom_bar/bottom_tabbar.dart';

class ActivitiesScreen extends StatefulWidget {
  const ActivitiesScreen({super.key});

  @override
  State<ActivitiesScreen> createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen>
    with TickerProviderStateMixin<ActivitiesScreen> {
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
          ActivitiesDetailsScreen(),
          PreparationScreen(),
        ],
      ),
      bottomNavigationBar: const BottomNavigationTabBar(),
    );
  }
}
