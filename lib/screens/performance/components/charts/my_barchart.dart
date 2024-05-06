import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_running_demo/extensions/integer_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/config_export.dart';
import '../../../../models/monthly_activity_model/individual_bar.dart';

class MyBarChart extends StatelessWidget {
  final List<IndividualBar> barData;
  const MyBarChart({super.key, required this.barData});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
          maxY: 20,
          minY: 0,
          gridData: const FlGridData(
              drawHorizontalLine: true, drawVerticalLine: false),
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
          barGroups: barData
              .map(
                (data) => BarChartGroupData(
                  x: data.x,
                  barRods: [
                    BarChartRodData(
                      width: 1,
                      toY: data.y,
                      color: const Color(0xffff8953),
                    ),
                  ],
                ),
              )
              .toList()),
    );
  }
}
