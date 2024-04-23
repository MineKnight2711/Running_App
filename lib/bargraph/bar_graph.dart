import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_running_demo/bargraph/bar_data.dart';

class MyBarGraph extends StatelessWidget {
  final List monthSummary;
  const MyBarGraph({super.key, required this.monthSummary});

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
        janAmount: monthSummary[0],
        febAmount: monthSummary[1],
        marAmount: monthSummary[2],
        aprAmount: monthSummary[3],
        mayAmount: monthSummary[4],
        junAmount: monthSummary[5],
        julAmount: monthSummary[6],
        augAmount: monthSummary[7],
        sepAmount: monthSummary[8],
        octAmount: monthSummary[9],
        novAmount: monthSummary[10],
        decAmount: monthSummary[11]);

    myBarData.initalizeBarData();
    return BarChart(
      BarChartData(
          maxY: 100,
          minY: 0,
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(show: false),
          barGroups: myBarData.barData
              .map(
                (data) => BarChartGroupData(
                  x: data.x,
                  barRods: [BarChartRodData(toY: data.y)],
                ),
              )
              .toList()),
    );
  }
}
