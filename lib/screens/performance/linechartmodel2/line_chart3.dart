import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_running_demo/models/line_chart_point.dart';
import 'package:flutter_running_demo/screens/performance/chartmodel/line_chart.dart';

class LineChart3Widget extends StatelessWidget {
  final List<LineChartPoint> points;
  const LineChart3Widget({super.key, required this.points});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: 2,
            child: LineChart(
              LineChartData(
                titlesData: const FlTitlesData(
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                lineBarsData: [
                  LineChartBarData(
                      // isStrokeCapRound: true,
                      spots: points
                          .map((point) => FlSpot(point.x, point.y))
                          .toList(),
                      isCurved: false,
                      dotData: const FlDotData(show: true)),
                  LineChartBarData(
                      spots: points
                          .map((point) => FlSpot(point.x, point.y))
                          .toList(),
                      isCurved: false,
                      dotData: const FlDotData(show: true))
                ],
              ),
            ),
          ),
          const Containertotal(),
        ],
      ),
    );
  }
}
