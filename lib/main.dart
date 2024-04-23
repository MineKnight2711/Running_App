import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_running_demo/linechart/line_chart.dart';
import 'package:flutter_running_demo/linechart/pricePoints.dart';
import 'package:flutter_running_demo/screens/performance/chart_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'screens/performance/performance_screen.dart';
import 'screens/progress/progress_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LineChartWidget(pricePoints),
      ),
    );
  }
}
