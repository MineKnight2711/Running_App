import 'package:flutter/material.dart';
import 'package:flutter_running_demo/screens/performance/bargraph/bar_graph.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/temp.dart';

class Chartscreen extends StatefulWidget {
  const Chartscreen({super.key});

  @override
  State<Chartscreen> createState() => _ChartscreenState();
}

class _ChartscreenState extends State<Chartscreen> {
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
              MyBarGraph(),
            ],
          )),
    );
  }
}
