import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/config_export.dart';
import '../../../../models/activity_record_model/activity_record_model.dart';
import 'components/bottom_chart_axis_tile.dart';
import 'data/nested_chart_tempdata.dart';
import 'components/left_chart_axis_tile.dart';

class MyBarChart extends StatelessWidget {
  final RecordType recordType;
  final DetailsRecordType detailsRecordType;
  final List<ActivityRecordModel> records;

  const MyBarChart({
    super.key,
    required this.recordType,
    required this.records,
    required this.detailsRecordType,
  });

  @override
  Widget build(BuildContext context) {
    final barData =
        NestedChartTempData.weeklyIndividualBar(records, detailsRecordType);
    return BarChart(
      swapAnimationDuration: const Duration(milliseconds: 500),
      BarChartData(
        maxY: (() {
          double maxY = 0;
          switch (detailsRecordType) {
            case DetailsRecordType.distance:
              maxY = 30;
              break;
            case DetailsRecordType.time:
              maxY = 2.5;
              break;
            case DetailsRecordType.ascent:
              maxY = 50;
              break;
            case DetailsRecordType.calories:
              maxY = 500;
              break;
            default:
              break;
          }
          return maxY;
        })(),
        minY: 0,
        gridData: FlGridData(
          drawHorizontalLine: true,
          drawVerticalLine: false,
          getDrawingHorizontalLine: (value) {
            return FlLine(
                strokeWidth: 0.5,
                color: const Color(0xFFFFFFFF).withOpacity(0.2));
          },
        ),
        borderData: FlBorderData(
          show: true,
          border: const Border(
            left: BorderSide(color: Colors.white, width: 0.5),
            bottom: BorderSide(color: Colors.white, width: 0.5),
          ),
        ),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              getTitlesWidget: (value, meta) {
                return LeftChartAxisTile(
                  value: value,
                  detailsRecordType: detailsRecordType,
                );
              },
            ),
          ),
          topTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                return BottomChartAxisTile(
                  recordType: recordType,
                  records: records,
                  value: value.toInt(),
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
        barTouchData: BarTouchData(
            touchTooltipData: BarTouchTooltipData(
          getTooltipItem: (group, groupIndex, rod, rodIndex) => BarTooltipItem(
            rod.toY.toStringAsFixed(1),
            CustomGoogleFonts.roboto(
              fontSize: 12.r,
              color: Colors.white,
            ),
          ),
        )),
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
            .toList(),
      ),
    );
  }
}
