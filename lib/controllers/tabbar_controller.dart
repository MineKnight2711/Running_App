import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabModel {
  final String tag;
  final String name;
  final String imagePath;

  TabModel({
    required this.tag,
    required this.name,
    required this.imagePath,
  });
}

class BottomTabBarController extends GetxController {
  final tabs = <TabModel>[].obs;
  final Rx<TabModel?> selectedTab = Rx<TabModel?>(null);
  Rx<TabController?> tabController = Rx<TabController?>(null);
  late TickerProvider _tickerProvider;
  double tabSpacing(double screenWidth) {
    double maxSpacingWidth = screenWidth / tabs.length;

    return maxSpacingWidth / (tabs.length - 1);
  }

  void initTabController(TickerProvider tickerProvider) {
    _tickerProvider = tickerProvider;
    tabController.value = TabController(
      length: tabs.length,
      vsync: _tickerProvider,
    );
    tabs.stream.listen(_onTabChanged);
    createConstantTabs();
    selectedTab.value = tabs.first;
  }

  void selectTab(int index) {
    selectedTab.value = tabs[index];
  }

  void _onTabChanged(List<TabModel>? tabs) {
    int newLength = tabs?.length ?? 0;
    if (newLength != tabController.value?.length) {
      initTabController(_tickerProvider);
    }
  }

  void createConstantTabs() {
    tabs.value = [
      TabModel(tag: "Progress", name: "Progress", imagePath: 'progress'),
      TabModel(
          tag: "Preparation", name: "Preparation", imagePath: 'preparation'),
      // TabModel(tag: "Ready", name: "Ready", imagePath: 'ready'),
      // TabModel(tag: "Train", name: "Train", imagePath: 'train'),
      // TabModel(tag: "Challenge", name: "Challenge", imagePath: 'challenge'),
    ];
  }
}
