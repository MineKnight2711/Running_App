import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/config_export.dart';
import '../../../../models/intensity_model/intensity_model.dart';

class IntensityLineChart extends StatelessWidget {
  const IntensityLineChart({
    super.key,
    required this.intensity,
  });

  final IntensityModel intensity;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minY: 90,
        maxY: intensity.rpmRange,
        maxX: intensity.distanceRange,
        borderData: FlBorderData(
            border: const Border(
                left: BorderSide(color: Color(0xffb4aeab)),
                bottom: BorderSide(color: Color(0xffb4aeab)))),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 20,
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
              interval: 5,
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
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            curveSmoothness: 0,
            lineChartStepData: const LineChartStepData(stepDirection: 10),
            dotData: const FlDotData(show: false),
            spots: intensity.bpms
                .asMap()
                .entries
                .map((entry) => FlSpot(
                    (entry.key + 1) *
                        (intensity.distanceRange / intensity.bpms.length),
                    entry.value))
                .toList(),
            isCurved: true,
            barWidth: 2,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
