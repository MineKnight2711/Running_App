import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_running_demo/screens/performance/components/charts/data/intensity_tempdata.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/config_export.dart';
import '../../../../models/intensity_model/intensity_model.dart';

class IntensityLineChart extends StatelessWidget {
  const IntensityLineChart({
    super.key,
    required this.intensity,
    this.pace,
    required this.intensityChartType,
  });
  final IntensityChartType intensityChartType;
  final IntensityModel? pace;
  final IntensityModel intensity;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minY: 80,
        maxY: intensity.rpmRange,
        maxX: intensity.distanceRange,
        borderData: FlBorderData(
            border: const Border(
                left: BorderSide(color: Color(0xffb4aeab)),
                bottom: BorderSide(color: Color(0xffb4aeab)))),
        gridData: FlGridData(
          show: true,
          horizontalInterval: 20,
          verticalInterval: 5,
          drawHorizontalLine: true,
          drawVerticalLine: true,
          getDrawingHorizontalLine: (value) {
            return FlLine(
                strokeWidth: 0.5,
                color: const Color(0xFFFFFFFF).withOpacity(0.2));
          },
          getDrawingVerticalLine: (value) {
            return FlLine(
                strokeWidth: 0.5,
                color: const Color(0xFFFFFFFF).withOpacity(0.2));
          },
        ),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 20,
              reservedSize: 30,
              getTitlesWidget: (value, meta) {
                return Text(
                  value.toStringAsFixed(0) == "80"
                      ? "BPM"
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
          intensityChartType == IntensityChartType.overlay
              ? LineChartBarData(
                  curveSmoothness: 0,
                  dotData: const FlDotData(show: false),
                  spots: pace!.bpms
                      .asMap()
                      .entries
                      .map((entry) => FlSpot(
                          (entry.key + 1) *
                              (intensity.distanceRange / intensity.bpms.length),
                          entry.value))
                      .toList(),
                  isCurved: true,
                  barWidth: 1.5,
                  color: const Color(0xff00d688),
                )
              : LineChartBarData(
                  show: false,
                ),
          LineChartBarData(
            curveSmoothness: 0,
            dotData: FlDotData(
              show: true,
              checkToShowDot: (spot, barData) =>
                  (barData.mostLeftSpot.x == spot.x ||
                      spot.x == barData.mostRightSpot.x),
              getDotPainter: (p0, p1, p2, p3) =>
                  FlDotCirclePainter(color: const Color(0xFFFF8953)),
            ),
            spots: intensity.bpms
                .asMap()
                .entries
                .map((entry) => FlSpot(
                    (entry.key + 1) *
                        (intensity.distanceRange / intensity.bpms.length),
                    entry.value))
                .toList(),
            isCurved: true,
            barWidth: 1.5,
            color: const Color(0xFFFFFFFF).withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}
