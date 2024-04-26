import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartFLWidget extends StatelessWidget {
  final List<Color> gradientColors = [
    const Color(0xff00d688),
    const Color(0xff123b6e6),
  ];
  final List<Color> gradientColors2 = [
    const Color(0xff00d688),
  ];
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
            getDrawingHorizontalLine: (Value) {
              return FlLine(
                color: const Color(0xff00d688),
                strokeWidth: 1,
              );
            },
            drawVerticalLine: true,
            getDrawingVerticalLine: (Value) {
              return FlLine(
                color: const Color(0xff00d688),
                strokeWidth: 1,
              );
            }),
        borderData: FlBorderData(
          show: true,
        ),
        lineBarsData: [
          LineChartBarData(
              spots: [
                FlSpot(0, 5),
                FlSpot(1.9, 10),
                FlSpot(3, 11),
                FlSpot(5, 10),
                FlSpot(6.8, 12),
                FlSpot(8.10, 6),
                FlSpot(10, 18),
                FlSpot(12, 16.7),
                FlSpot(15, 9),
              ],
              isCurved: true,
              gradient: LinearGradient(colors: gradientColors),
              barWidth: 5,
              belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    colors: gradientColors
                        .map((Color) => Color.withOpacity(0.6))
                        .toList(),
                  ))),
        ],
      ),
    );
  }
}

class LineChartFL2Widget extends StatelessWidget {
  final List<Color> gradientColors = [
    const Color(0xff00d688),
    const Color(0xff123b6e6),
  ];
  final List<Color> gradientColors2 = [
    const Color(0xff00d688),
  ];
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
            getDrawingHorizontalLine: (Value) {
              return FlLine(
                color: const Color(0xff37438d),
                strokeWidth: 1,
              );
            },
            drawVerticalLine: true,
            getDrawingVerticalLine: (Value) {
              return FlLine(
                color: const Color(0xff37437d),
                strokeWidth: 1,
              );
            }),
        borderData: FlBorderData(
          show: true,
        ),
        lineBarsData: [
          LineChartBarData(
              spots: [
                FlSpot(0.8, 40),
                FlSpot(1.3, 79),
                FlSpot(2.2, 25),
              ],
              isCurved: true,
              gradient: LinearGradient(colors: gradientColors),
              barWidth: 5,
              belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    colors: gradientColors
                        .map((Color) => Color.withOpacity(0.6))
                        .toList(),
                  ))),
        ],
      ),
    );
  }
}
