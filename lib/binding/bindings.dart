import 'package:flutter_running_demo/controllers/map_controller.dart';
import 'package:flutter_running_demo/controllers/running_controller.dart';
import 'package:flutter_running_demo/controllers/tabbar_controller.dart';
import 'package:get/get.dart';

class TabbarControllerBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabBarController>(() => TabBarController());
  }
}

class MapControllerBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapController>(() => MapController());
  }
}

class RunningControllerBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RunningController>(() => RunningController());
  }
}
