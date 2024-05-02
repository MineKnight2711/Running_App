import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_running_demo/extensions/integer_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/config_export.dart';

class MyLineChart extends StatelessWidget {
  final List<FlSpot> listSpots;
  const MyLineChart({super.key, required this.listSpots});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        maxY: 20,
        minY: 0,
        minX: 0,
        maxX: 8,
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                return Text(
                  value.toStringAsFixed(0) == "0"
                      ? "km"
                      : value.toStringAsFixed(0),
                  style: CustomGoogleFonts.roboto(
                      fontSize: 10.r,
                      color: AppColors.white100,
                      fontWeight: FontWeight.w200),
                );
              },
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              getTitlesWidget: (value, meta) {
                return Text(
                  value.toInt().getDayLabel(),
                  style: CustomGoogleFonts.roboto(
                      fontSize: 10.r,
                      color: AppColors.white100,
                      fontWeight: FontWeight.w200),
                );
              },
            ),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            color: Colors.transparent,
            spots: listSpots,
            dotData: FlDotData(
              getDotPainter: (p0, p1, p2, p3) =>
                  FlDotCirclePainter(radius: 4, color: const Color(0xffff8953)),
            ),
          ),
        ],
      ),
    );
  }
}
