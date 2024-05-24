import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../../config/config_export.dart';

class RouteDetailsGenkiCommunityChart extends StatelessWidget {
  const RouteDetailsGenkiCommunityChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Genki community",
          style: CustomGoogleFonts.roboto(
              fontSize: AppFontSizes.size18,
              fontWeight: FontWeight.w700,
              color: TextColor.white),
        ),
        SizedBox(height: AppSpacings.vs10),
        SizedBox(
          width: AppSpacings.sw(1),
          height: AppSpacings.sh(0.3),
          child: LineChart(
            LineChartData(
              maxX: 3,
              maxY: 100,
              minX: 0,
              minY: 0,
              gridData: FlGridData(
                getDrawingHorizontalLine: (value) {
                  return const FlLine(color: AppColors.basicActivitiesCard);
                },
                getDrawingVerticalLine: (value) {
                  return const FlLine(color: AppColors.basicActivitiesCard);
                },
              ),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 30,
                    interval: 0.5,
                    getTitlesWidget: (value, meta) {
                      String label = "";
                      switch (value.toStringAsFixed(1)) {
                        case "0.0":
                          label = 'h';
                          break;
                        case "0.5":
                          label = '0.5';
                          break;
                        case "1.0":
                          label = '1';
                          break;
                        case "1.5":
                          label = '1.5';
                          break;
                        case "2.0":
                          label = '2';
                          break;
                        case "2.5":
                          label = '2.5';
                          break;
                        case "3.0":
                          label = '';
                          break;
                        default:
                          break;
                      }
                      return Column(
                        children: [
                          (value > meta.min && value < meta.max)
                              ? Container(
                                  width: AppSpacings.chs(1),
                                  height: AppSpacings.vs5,
                                  color: AppColors.white100,
                                )
                              : SizedBox(
                                  height: AppSpacings.vs5,
                                ),
                          Text(
                            label,
                            style: CustomGoogleFonts.roboto(
                                fontSize: AppFontSizes.size10,
                                color: TextColor.primaryText),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 45,
                    interval: 20,
                    getTitlesWidget: (value, meta) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Text(
                          textAlign: TextAlign.end,
                          value.toInt() == 0
                              ? "runners"
                              : value.toInt() == meta.max.toInt()
                                  ? ""
                                  : value.toStringAsFixed(0),
                          style: CustomGoogleFonts.roboto(
                              fontSize: AppFontSizes.size10,
                              color: TextColor.primaryText),
                        ),
                      );
                    },
                  ),
                ),
                topTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              borderData: FlBorderData(
                border: Border(
                  left: BorderSide(color: TextColor.primaryText, width: 1),
                  bottom: BorderSide(color: TextColor.primaryText, width: 1),
                ),
              ),
              lineBarsData: [
                LineChartBarData(
                  color: const Color(0xff00d688),
                  dotData: FlDotData(
                    show: true,
                    checkToShowDot: (spot, barData) =>
                        spot == barData.mostLeftSpot ||
                        spot == barData.mostRightSpot,
                    getDotPainter: (p0, p1, p2, p3) {
                      return FlDotCirclePainter(
                          color: const Color(0xff00d688),
                          radius: 5,
                          strokeColor: Colors.white,
                          strokeWidth: 2);
                    },
                  ),
                  spots: [
                    const FlSpot(0.75, 37),
                    const FlSpot(1.35, 81),
                    const FlSpot(2.4, 20),
                  ],
                  isCurved: true,
                  curveSmoothness: 0.5,
                  barWidth: 2,
                  belowBarData: BarAreaData(show: false),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
