import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_running_demo/screens/performance/linechart/pricePoints.dart';
import 'line_chart.dart';

class ChartExample extends StatelessWidget {
  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AspectRatio(
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
                    spots: pricePoints
                        .map((point) => FlSpot(point.x, point.y))
                        .toList(),
                    isCurved: false,
                    dotData: const FlDotData(show: true))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
