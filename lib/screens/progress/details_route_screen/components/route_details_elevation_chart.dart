import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../../config/config_export.dart';

class RouteDetailsElevationChart extends StatelessWidget {
  final List<double> datas;
  const RouteDetailsElevationChart({
    super.key,
    required this.datas,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Elevation",
          style: CustomGoogleFonts.roboto(
              fontSize: AppFontSizes.size18,
              fontWeight: FontWeight.w700,
              color: TextColor.white),
        ),
        SizedBox(height: AppSpacings.verticalSpacing10),
        SizedBox(
          width: AppSpacings.widthByScreenWidth(1),
          height: AppSpacings.heightByScreenHeight(0.3),
          child: LineChart(
            LineChartData(
              maxX: 20,
              minX: 0,
              minY: 0,
              maxY: 30,
              borderData: FlBorderData(
                border: Border(
                  left: BorderSide(color: TextColor.primaryText, width: 1),
                  bottom: BorderSide(color: TextColor.primaryText, width: 1),
                ),
              ),
              titlesData: FlTitlesData(
                show: true,
                leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                  showTitles: true,
                  interval: 5,
                  getTitlesWidget: (value, meta) {
                    return Text(
                      value.toInt() == 0
                          ? "m"
                          : value.toInt() == meta.max.toInt()
                              ? ""
                              : value.toStringAsFixed(0),
                      style: CustomGoogleFonts.roboto(
                          fontSize: AppFontSizes.size10,
                          color: TextColor.primaryText),
                    );
                  },
                )),
                bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                  showTitles: true,
                  interval: 5,
                  reservedSize: 30,
                  getTitlesWidget: (value, meta) {
                    return Column(
                      children: [
                        (value.toInt() > meta.min.toInt() &&
                                value.toInt() < meta.max.toInt())
                            ? Container(
                                width: AppSpacings.customHorizontalSpacing(1),
                                height: AppSpacings.verticalSpacing5,
                                color: AppColors.white100,
                              )
                            : SizedBox(
                                height: AppSpacings.verticalSpacing5,
                              ),
                        Text(
                          value.toInt() == 0
                              ? "km"
                              : value.toInt() == meta.max.toInt()
                                  ? ""
                                  : value.toStringAsFixed(0),
                          style: CustomGoogleFonts.roboto(
                              fontSize: AppFontSizes.size10,
                              color: TextColor.primaryText),
                        ),
                      ],
                    );
                  },
                )),
                topTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              gridData: FlGridData(
                verticalInterval: 5,
                getDrawingHorizontalLine: (value) {
                  return const FlLine(color: AppColors.basicActivitiesCard);
                },
                getDrawingVerticalLine: (value) {
                  return const FlLine(color: AppColors.basicActivitiesCard);
                },
              ),
              lineBarsData: [
                LineChartBarData(
                  isCurved: true,
                  curveSmoothness: 0.5,
                  dotData: const FlDotData(show: false),
                  spots: datas
                      .asMap()
                      .entries
                      .map((entry) => FlSpot(entry.key.toDouble(), entry.value))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
