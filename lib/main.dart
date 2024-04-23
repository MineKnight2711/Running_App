import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_running_demo/test_widgets/test_animated_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'screens/progress/activities/activities_screen.dart';


void main() {
  runApp(const MainApp());
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

        home: const ActivitiesScreen(),
        initialRoute: 'activities_screen',
        routes: {
          'activities_screen': (context) => const ActivitiesScreen(),
          // 'test_screen': (context) => TestScreen(),
        },
      ),
    );
  }
}
