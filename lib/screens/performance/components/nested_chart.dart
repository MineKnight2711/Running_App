import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../models/monthly_activity_model/weekly_activity_model.dart';
import 'charts/my_barchart.dart';
import 'charts/my_linechart.dart';

class NestedChart extends StatelessWidget {
  const NestedChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<double> monthSummary =
        List<double>.generate(7, (i) => Random().nextDouble() * 20)..shuffle();
    WeeklyActivityDistanceModel weeklyBarData = WeeklyActivityDistanceModel(
      mon: monthSummary[0],
      tue: monthSummary[1],
      wed: monthSummary[2],
      thu: monthSummary[3],
      fri: monthSummary[4],
      sat: monthSummary[5],
      sun: monthSummary[6],
    );
    weeklyBarData.initalizeBarData();
    List<FlSpot> spots = weeklyBarData.barData
        .map(
          (e) => FlSpot(e.x.toDouble(), e.y),
        )
        .toList();
    return Stack(
      children: [
        MyLineChart(listSpots: spots),
        MyBarChart(
          barData: weeklyBarData.barData,
        ),
      ],
    );
  }
}
