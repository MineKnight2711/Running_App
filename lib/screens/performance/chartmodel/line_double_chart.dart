import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_running_demo/screens/performance/bargraph/bar_graph.dart';
import 'package:flutter_running_demo/screens/performance/components/dropdown_activities.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../config/temp.dart';
import 'line_chart_fl.dart';

List<double> monthSummary = [
  20.0, // January
  35.0, // February
  45.0, // March
  60.0, // April
  75.0, // May
  50.0, // June
  40.0, // July
  30.0, // August
  25.0, // September
  45.0, // October
  55.0, // November
  65.0, // December
];

class ChartExample extends StatelessWidget {
  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  ChartExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 0.95.sw,
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const DropDownActivitiesMenu(),
            AspectRatio(
              aspectRatio: 2.2,
              child: LineChart(
                LineChartData(
                  // baselineX: ,
                  maxY: 200,
                  minY: 60,
                  // maxX: 40,
                  // minX: 0,
                  titlesData: const FlTitlesData(
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(
                    border: const Border(
                      top: BorderSide.none,
                      left: BorderSide(width: 1, color: Colors.grey),
                      bottom: BorderSide(width: 1, color: Colors.grey),
                      right: BorderSide(width: 1, color: Colors.grey),
                    ),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                        color: const Color(0xFFFF8953),
                        spots: lineChartPoints
                            .map((point) => FlSpot(point.x, point.y))
                            .toList(),
                        isCurved: false,
                        dotData: const FlDotData(show: true)),
                    LineChartBarData(
                        color: const Color(0xFF00D688),
                        spots: rpePoints
                            .map((point) => FlSpot(point.x, point.y))
                            .toList(),
                        isCurved: false,
                        dotData: const FlDotData(show: true))
                  ],
                ),
              ),
            ),
            AspectRatio(
              aspectRatio: 2,
              child: LineChartFLWidget(),
            ),
            AspectRatio(
              aspectRatio: 2,
              child: LineChartFL2Widget(),
            ),
            AspectRatio(
                aspectRatio: 2, child: MyBarGraph(monthSummary: monthSummary)),
          ],
        ),
      ),
    );
  }
}
