import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/routes.dart';
import 'package:flutter_running_demo/controllers/map_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'controllers/tabbar_controller.dart';

void main() {
  runApp(const MainApp());
  Get.put(MapController());
  Get.put(BottomTabBarController());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.activities,
        // routes: routes,
        getPages: AppRoutes.getPages,
      ),
    );
  }
}
