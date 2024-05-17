import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/routes.dart';
import 'package:flutter_running_demo/controllers/map_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
  Get.put(MapController());
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
        initialRoute: AppRoutes.tabbarview,
        getPages: AppRoutes.getPages,
      ),
    );
  }
}
