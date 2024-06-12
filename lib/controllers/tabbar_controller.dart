import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabBarController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  final currentIndex = 0.obs;

  late List<String> bottomTabs = const [
    "Progress",
    "Preparation",
    "Ready",
    "Train",
    "Challenge"
  ];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: bottomTabs.length);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
