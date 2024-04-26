import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_running_demo/config/config_export.dart';

import 'package:flutter_running_demo/screens/performance/bargraph/bar_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBarGraph extends StatelessWidget {
  List<double> monthSummary =
      List<double>.generate(12, (i) => Random().nextDouble() * 20)..shuffle();

  MyBarGraph({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<FlSpot> spots = List.generate(monthSummary.length, (index) {
      return FlSpot(index.toDouble(), monthSummary[index]);
    });
    print("List month ${monthSummary}");
    print("List spots ${spots}");
    BarData myBarData = BarData(
        janAmount: monthSummary[0],
        febAmount: monthSummary[1],
        marAmount: monthSummary[2],
        aprAmount: monthSummary[3],
        mayAmount: monthSummary[4],
        junAmount: monthSummary[5],
        julAmount: monthSummary[6],
        augAmount: monthSummary[7],
        sepAmount: monthSummary[8],
        octAmount: monthSummary[9],
        novAmount: monthSummary[10],
        decAmount: monthSummary[11]);
    myBarData.initalizeBarData();
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 1.41,
          child: LineChart(
            LineChartData(
              maxY: 20,
              minY: 0,
              gridData: const FlGridData(show: false),
              lineBarsData: [
                LineChartBarData(
                    color: Colors.transparent,
                    spots: spots,
                    dotData: FlDotData(
                      getDotPainter: (p0, p1, p2, p3) => FlDotCirclePainter(
                          radius: 4, color: const Color(0xffff8953)),
                    )),
              ],
            ),
          ),
        ),
        BarChart(
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
                        value.toStringAsFixed(0),
                        style: CustomGoogleFonts.roboto(
                            fontSize: 10.r, color: AppColors.white100),
                      );
                    },
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      return Text(
                        value.toStringAsFixed(0),
                        style: CustomGoogleFonts.roboto(
                            fontSize: 10.r, color: AppColors.white100),
                      );
                    },
                  ),
                ),
              ),
              barGroups: myBarData.barData
                  .map(
                    (data) => BarChartGroupData(
                      x: data.x,
                      barRods: [
                        BarChartRodData(
                          width: 1,
                          // fromY: ,
                          // rodStackItems: [BarChartRodStackItem(5, 20, Colors.red)],
                          // backDrawRodData: BackgroundBarChartRodData(
                          //     show: true, fromY: 5, toY: 25, color: Colors.white),
                          toY: data.y,

                          color: const Color(0xffff8953),
                        ),
                      ],
                    ),
                  )
                  .toList()),
        ),
      ],
    );
  }
}
