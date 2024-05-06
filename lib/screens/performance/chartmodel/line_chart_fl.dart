import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartFLWidget extends StatelessWidget {
  final List<Color> gradientColors = [
    const Color(0xff00d688),
    const Color(0xFF123B6E),
  ];
  final List<Color> gradientColors2 = [
    const Color(0xff00d688),
  ];

  LineChartFLWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 15,
        minY: 0,
        maxY: 20,
        gridData: FlGridData(
            show: true,
            getDrawingHorizontalLine: (value) {
              return const FlLine(
                color: Color(0xff00d688),
                strokeWidth: 1,
              );
            },
            drawVerticalLine: true,
            getDrawingVerticalLine: (value) {
              return const FlLine(
                color: Color(0xff00d688),
                strokeWidth: 1,
              );
            }),
        borderData: FlBorderData(
          show: true,
        ),
        lineBarsData: [
          LineChartBarData(
              spots: [
                const FlSpot(0, 5),
                const FlSpot(1.9, 10),
                const FlSpot(3, 11),
                const FlSpot(5, 10),
                const FlSpot(6.8, 12),
                const FlSpot(8.10, 6),
                const FlSpot(10, 18),
                const FlSpot(12, 16.7),
                const FlSpot(15, 9),
              ],
              isCurved: true,
              gradient: LinearGradient(colors: gradientColors),
              barWidth: 5,
              belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    colors:
                        gradientColors.map((c) => c.withOpacity(0.6)).toList(),
                  ))),
        ],
      ),
    );
  }
}

class LineChartFL2Widget extends StatelessWidget {
  final List<Color> gradientColors = [
    const Color(0xff00d688),
    const Color(0xff12b6e6),
  ];
  final List<Color> gradientColors2 = [
    const Color(0xff00d688),
  ];

  LineChartFL2Widget({super.key});
  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 2.5,
        minY: 0,
        maxY: 100,
        gridData: FlGridData(
            show: true,
            getDrawingHorizontalLine: (value) {
              return const FlLine(
                color: Color(0xff37438d),
                strokeWidth: 1,
              );
            },
            drawVerticalLine: true,
            getDrawingVerticalLine: (value) {
              return const FlLine(
                color: Color(0xff37437d),
                strokeWidth: 1,
              );
            }),
        borderData: FlBorderData(
          show: true,
        ),
        lineBarsData: [
          LineChartBarData(
              spots: [
                const FlSpot(0.8, 40),
                const FlSpot(1.3, 79),
                const FlSpot(2.2, 25),
              ],
              isCurved: true,
              gradient: LinearGradient(colors: gradientColors),
              barWidth: 5,
              belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    colors:
                        gradientColors.map((c) => c.withOpacity(0.6)).toList(),
                  ))),
        ],
      ),
    );
  }
}
