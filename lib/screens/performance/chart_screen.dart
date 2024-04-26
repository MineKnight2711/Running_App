import 'package:flutter/material.dart';
import 'package:flutter_running_demo/screens/performance/bargraph/bar_graph.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Chartscreen extends StatefulWidget {
  const Chartscreen({super.key});

  @override
  State<Chartscreen> createState() => _ChartscreenState();
}

class _ChartscreenState extends State<Chartscreen> {
  List<double> monthSummary = [
    4.40,
    2.50,
    43.42,
    10.50,
    100.20,
    88.89,
    90.10,
    4.40,
    2.50,
    43.42,
    10.50,
    100.20,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 50.h),
          height: 1.sh,
          width: 1.sw,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyBarGraph(
                monthSummary: monthSummary,
              ),
            ],
          )),
    );
  }
}
