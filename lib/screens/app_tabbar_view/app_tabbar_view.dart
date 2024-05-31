import 'package:flutter/material.dart';
import 'package:flutter_running_demo/screens/preparation/preparation_screen.dart';
import 'package:flutter_running_demo/screens/progress/progress_screen/progress_screen.dart';
import 'package:flutter_running_demo/utils/navigator_key.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../widgets/bottom_bar/bottom_bar.dart';

class TabBarViewScreen extends StatefulWidget {
  const TabBarViewScreen({super.key});

  @override
  State<TabBarViewScreen> createState() => _TabBarViewScreenState();
}

class _TabBarViewScreenState extends State<TabBarViewScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final RxBool canPop = false.obs;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PopScope(
        canPop: canPop.value,
        onPopInvoked: (didPop) async {
          if (!NavigatorKeys.mainNavigatorKey.currentState!.canPop()) {
            Logger().i('Main navigator was popped');
            // NavigatorKeys.secondaryNavigatorKey.currentState!.pop();
          }
          if (!NavigatorKeys.secondaryNavigatorKey.currentState!.canPop()) {
            Logger().i('Secondary navigator was popped');
          }
        },
        child: Scaffold(
            body: Stack(
          children: [
            PopScope(
              canPop: canPop.value,
              onPopInvoked: (didPop) async {
                if (NavigatorKeys.secondaryNavigatorKey.currentState!
                    .canPop()) {
                  Logger().i('Secondary navigator was popped');
                }
              },
              child: Navigator(
                key: NavigatorKeys.secondaryNavigatorKey,
                onGenerateRoute: (settings) {
                  return MaterialPageRoute(
                    builder: (context) => TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _tabController,
                      children: const [
                        ProgressScreen(),
                        PreparationScreen(),
                      ],
                    ),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomNavigationTabBar(
                tabController: _tabController,
                onTabChange: (index) {},
              ),
            ),
          ],
        )),
      ),
    );
  }
}
