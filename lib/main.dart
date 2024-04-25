import 'package:flutter/material.dart';
import 'package:flutter_running_demo/screens/performance/bargraph/bar_graph.dart';
import 'package:flutter_running_demo/screens/performance/line_chart.dart';
import 'package:flutter_running_demo/screens/performance/linechart/pricePoints.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'screens/performance/line_double_chart.dart';
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
        home: ChartExample(),
        initialRoute: 'linechart_demo',
        routes: {
          'activities_screen': (context) => const ActivitiesScreen(),
          'linechart_demo': (context) => ChartExample(),
          'linechart_screen': (context) => LineChartWidget(
                points: pricePoints,
              ),
          'barchart_screen': (context) => const MyBarGraph(monthSummary: []),
        },
      ),
    );
  }
}
