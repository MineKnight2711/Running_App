import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/config_export.dart';
import 'package:flutter_running_demo/controllers/tabbar_controller.dart';
import 'package:flutter_running_demo/screens/preparation/preparation_screen.dart';
import 'package:flutter_running_demo/screens/progress/progress_screen/progress_screen.dart';
import 'package:flutter_running_demo/utils/navigator_key.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../widgets/bottom_bar/bottom_tab_bar.dart';

class TabBarViewScreen extends GetView<TabBarController> {
  const TabBarViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (!NavigatorKeys.mainNavigatorKey.currentState!.canPop()) {
          Logger().i('Main navigator was popped');
        }
        if (!NavigatorKeys.secondaryNavigatorKey.currentState!.canPop()) {
          Logger().i('Secondary navigator was popped');
        }
      },
      child: Scaffold(
          body: Stack(
        children: [
          SizedBox(
            height: AppSpacings.sh(1) - (AppSpacings.vs25 * 2),
            child: PopScope(
              canPop: false,
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
                      controller: controller.tabController,
                      children: [
                        const ProgressScreen(),
                        const PreparationScreen(),
                        Container(
                          decoration:
                              const BoxDecoration(gradient: AppColors.appTheme),
                          width: AppSpacings.sw(1),
                          height: AppSpacings.sh(1),
                          alignment: Alignment.center,
                          child: const Text(
                            "Ready",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        Container(
                          decoration:
                              const BoxDecoration(gradient: AppColors.appTheme),
                          width: AppSpacings.sw(1),
                          height: AppSpacings.sh(1),
                          alignment: Alignment.center,
                          child: const Text(
                            "Train",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        Container(
                          decoration:
                              const BoxDecoration(gradient: AppColors.appTheme),
                          width: AppSpacings.sw(1),
                          height: AppSpacings.sh(1),
                          alignment: Alignment.center,
                          child: const Text(
                            "Challenge",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: BottomNavigationTabBar(),
          ),
        ],
      )),
    );
  }
}
