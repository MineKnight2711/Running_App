import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_running_demo/models/activity_record_model/activity_record_model.dart';
import 'package:flutter_running_demo/screens/performance/components/charts/components/bottom_chart_axis_tile.dart';
import 'package:flutter_running_demo/screens/performance/components/charts/components/left_chart_axis_tile.dart';
import 'data/nested_chart_tempdata.dart';

class MyLineChart extends StatelessWidget {
  final RecordType recordType;
  final DetailsRecordType detailsRecordType;
  final List<ActivityRecordModel> records;

  const MyLineChart({
    super.key,
    required this.recordType,
    required this.records,
    required this.detailsRecordType,
  });

  @override
  Widget build(BuildContext context) {
    final barData =
        NestedChartTempData.weeklyIndividualBar(records, detailsRecordType);
    List<FlSpot> spots = barData
        .map(
          (e) => FlSpot(e.x.toDouble(), e.y),
        )
        .toList();
    return LineChart(
      duration: const Duration(milliseconds: 500),
      LineChartData(
        // baselineX: 10,
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
        minX: 0,
        maxX: records.length.toDouble() + 1,
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(
          show: true,
          border: const Border(
              left: BorderSide(color: Colors.white, width: 0.5),
              bottom: BorderSide(color: Colors.white, width: 0.5)),
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
                    value: value.toInt(),
                    records: records,
                    recordType: recordType);
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
            spots: spots,
            dotData: FlDotData(
              getDotPainter: (flspot, p1, p2, p3) => FlDotCirclePainter(
                  radius: flspot.y == 0 ? 0 : 4,
                  color: const Color(0xffff8953)),
            ),
          ),
        ],
      ),
    );
  }
}
