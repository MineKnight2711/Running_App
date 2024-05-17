import 'package:flutter/material.dart';
import 'package:flutter_running_demo/screens/preparation/preparation_screen.dart';
import 'package:flutter_running_demo/screens/progress/progress_screen/progress_screen.dart';
import '../../../widgets/bottom_bar/bottom_tabbar.dart';

class TabBarViewScreen extends StatefulWidget {
  const TabBarViewScreen({super.key});

  @override
  State<TabBarViewScreen> createState() => _TabBarViewScreenState();
}

class _TabBarViewScreenState extends State<TabBarViewScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: const [
          ProgressScreen(),
          PreparationScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationTabBar(
        tabController: _tabController,
        onTabChange: (index) {},
      ),
    );
  }
}
