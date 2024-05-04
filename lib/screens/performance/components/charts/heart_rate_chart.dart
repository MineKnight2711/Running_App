// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_running_demo/config/config_export.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';

// class HeartRateChart extends StatelessWidget {
//   final List<HeartRateZone> heartRateZones = [
//     HeartRateZone(
//       name: 'Power',
//       min: 172,
//       max: 183,
//       color: Colors.red,
//       duration: '00:00:00',
//       percentage: 0,
//     ),
//     HeartRateZone(
//       name: 'Speed',
//       min: 163,
//       max: 172,
//       color: Colors.red,
//       duration: '00:05:25',
//       percentage: 5,
//     ),
//     HeartRateZone(
//       name: 'Threshold',
//       min: 150,
//       max: 163,
//       color: Colors.red,
//       duration: '00:20:50',
//       percentage: 10,
//     ),
//     HeartRateZone(
//       name: 'Tempo',
//       min: 137,
//       max: 150,
//       color: Colors.purple,
//       duration: '00:16:15',
//       percentage: 15,
//     ),
//     HeartRateZone(
//       name: 'Aerobic',
//       min: 119,
//       max: 137,
//       color: Colors.purple,
//       duration: '00:52:30',
//       percentage: 50,
//     ),
//     HeartRateZone(
//       name: 'Recovery',
//       min: 110,
//       max: 119,
//       color: Colors.purple,
//       duration: '00:21:00',
//       percentage: 20,
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return BarChart(
//       BarChartData(
//         maxY: 200, // Adjust the maximum Y-axis value as needed
//         barTouchData: BarTouchData(enabled: false),
//         titlesData: FlTitlesData(
//           leftTitles: AxisTitles(
//             sideTitles: SideTitles(
//               showTitles: true,
//               getTitlesWidget: (value, meta) {
//                 return Text(value.toStringAsFixed(0));
//               },
//               reservedSize: 30,
//             ),
//           ),
//         ),
//         barGroups: [
//           BarChartGroupData(x: 0, barRods: [
//             BarChartRodData(
//                 toY: 180,
//                 width: 56.w,
//                 borderRadius: BorderRadius.circular(4),
//                 rodStackItems: heartRateZones.map((zone) {
//                   return BarChartRodStackItem(
//                       zone.min.toDouble(), zone.max.toDouble(), zone.color);
//                 }).toList())
//           ]),
//         ],
//         borderData: FlBorderData(show: false),
//         gridData: FlGridData(
//           drawHorizontalLine: true,
//           horizontalInterval: 10,
//           checkToShowHorizontalLine: (value) => T,
//           drawVerticalLine: false,
//           getDrawingHorizontalLine: (value) {
//             return const FlLine(
//               color: AppColors.white100,
//               strokeWidth: 1,
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class HeartRateZone {
//   final String name;
//   final int min;
//   final int max;
//   final Color color;
//   final String duration;
//   final double percentage;

//   HeartRateZone({
//     required this.name,
//     required this.min,
//     required this.max,
//     required this.color,
//     required this.duration,
//     required this.percentage,
//   });
// }

import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/config_export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'data/pulse_rate_chart_data.dart';

class HeartRateChart extends StatelessWidget {
  const HeartRateChart({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PulseRateChartData> chartDatas = [
      PulseRateChartData(color: 0xFFD795FF, pulseRateZones: 4.55),
      PulseRateChartData(color: 0xffac4fe5, pulseRateZones: 15.9),
      PulseRateChartData(color: 0xff891ecb, pulseRateZones: 19.32),
      PulseRateChartData(color: 0xffff8b8b, pulseRateZones: 15.91),
      PulseRateChartData(color: 0xFFFF4747, pulseRateZones: 19.32),
      PulseRateChartData(color: 0xffb91d1d, pulseRateZones: 25)
    ];
    return SfCartesianChart(
      primaryXAxis: const CategoryAxis(
        axisLine: AxisLine(width: 0),
        majorGridLines: MajorGridLines(width: 0),
        majorTickLines: MajorTickLines(width: 0),
      ),

      primaryYAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 0),
        axisLine: const AxisLine(dashArray: [1, 5], width: 10),
        labelStyle: CustomGoogleFonts.roboto(
            color: AppColors.white100, fontWeight: FontWeight.w300),
        axisLabelFormatter: (axisLabelRenderArgs) => ChartAxisLabel("", null),
        minimum: 0,
        maximum: 100,

        // desiredIntervals: 5,
        tickPosition: TickPosition.outside,
        axisBorderType: AxisBorderType.rectangle,
        majorTickLines: const MajorTickLines(width: 0),
      ),

      plotAreaBorderWidth: 0,
      plotAreaBorderColor: Colors.transparent,
      series: [
        StackedColumn100Series<PulseRateChartData, String>(
          dataSource: chartDatas,
          xValueMapper: (data, _) => "Rate",
          yValueMapper: (data, _) => data.pulseRateZones,
          pointColorMapper: (data, _) => Color(data.color),
          width: 1,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
          ),
        ),
        StackedColumn100Series<PulseRateChartData, String>(
          dataSource: chartDatas,
          xValueMapper: (data, _) => "Fake",
          yValueMapper: (data, _) => 0,
          pointColorMapper: (data, _) => Color(data.color),
          width: 1,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
          ),
        ),
      ],
      // tooltipBehavior: TooltipBehavior(
      //   shouldAlwaysShow: false,
      //   format: '(%s, %s)',
      // ),
      annotations: <CartesianChartAnnotation>[
        CartesianChartAnnotation(
            horizontalAlignment: ChartAlignment.center,
            widget: Container(
              width: 0.3.sw,
              height: 1,
              color: Colors.white,
            ),
            coordinateUnit: CoordinateUnit.point,
            x: "Rate",
            y: 20),
        CartesianChartAnnotation(
            widget: SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      color: const Color(0xffffffff), // White line container
                    ),
                  ),
                  Container(
                    width: 50,
                    decoration: BoxDecoration(
                        color: const Color(0x0DFFFFFF), // Container with text
                        borderRadius: BorderRadius.circular(4)),
                    alignment: Alignment.center,
                    child: Text(
                      "Hello",
                      style: CustomGoogleFonts.roboto(
                          color: Colors.white, fontSize: 14.r),
                    ),
                  ),
                  Container(
                    width: 25,
                    height: 1,
                    color: const Color(0xffffffff), // White line container
                  ),
                ],
              ),
            ),
            coordinateUnit: CoordinateUnit.point,
            x: 'Fake',
            y: 30)
      ],
    );
  }
}
