import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomTabBarController extends GetxController {
  Rx<TabController?> tabController = Rx<TabController?>(null);
  late TickerProvider _tickerProvider;

  void initTabController(TickerProvider tickerProvider) {
    _tickerProvider = tickerProvider;
    tabController.value = TabController(
      length: 2,
      vsync: _tickerProvider,
    );
  }

  RxInt currentTabIndex = 0.obs;
}
