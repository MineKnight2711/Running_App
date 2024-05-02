import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/config_export.dart';
import 'package:flutter_running_demo/config/routes.dart';
import 'package:flutter_running_demo/screens/performance/chartmodel/line_double_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'screens/performance/linechartmodel2/line_chart2.dart';

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
        home: ChartExample(),
        // initialRoute: AppRoutes.performanceMetrics,
        // getPages: AppRoutes.getPages,
      ),
    );
  }
}
