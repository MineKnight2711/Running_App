import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_running_demo/models/line_chart_point.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LineChartWidget extends StatelessWidget {
  final List<LineChartPoint> points;
  const LineChartWidget({super.key, required this.points});

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

class Containertotal extends StatefulWidget {
  const Containertotal({super.key});

  @override
  State<Containertotal> createState() => _ContainerState();
}

class _ContainerState extends State<Containertotal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      margin: const EdgeInsets.symmetric(horizontal: 80),
      width: 1.sw,
      height: 50.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              width: 0.3.sw,
              height: 50.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(12)),
              child: const Text('136km  Totaldistance')),
          const SizedBox(
            width: 20,
          ),
          Container(
              width: 0.2.sw,
              height: 50.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(12)),
              child: const Text('8               total run')),
        ],
      ),
    );
  }
}
