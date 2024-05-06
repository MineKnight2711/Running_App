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

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/config_export.dart';
import 'package:flutter_running_demo/extensions/duration_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'data/pulse_rate_chart_data.dart';
import 'data/threshold.dart';

// class HeartRateChart extends StatelessWidget {
//   const HeartRateChart({super.key});

//   List<BarChartRodStackItem> loopBarRodItem(List<PulseRateChartData> datas) {
//     List<BarChartRodStackItem> rodStackItems = [];
//     double previousToY = 0;

//     for (int i = 0; i < datas.length; i++) {
//       double fromY = previousToY;
//       double toY = previousToY + datas[i].pulseRateZones;

//       rodStackItems.add(BarChartRodStackItem(
//           fromY.toDouble(), toY.toDouble(), Color(datas[i].color)));

//       previousToY = toY;
//     }
//     return rodStackItems;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final List<PulseRateChartData> chartDatas = [
//       PulseRateChartData(color: 0xFFD795FF, pulseRateZones: 4.55),
//       PulseRateChartData(color: 0xffac4fe5, pulseRateZones: 15.9),
//       PulseRateChartData(color: 0xff891ecb, pulseRateZones: 19.32),
//       PulseRateChartData(color: 0xffff8b8b, pulseRateZones: 15.91),
//       PulseRateChartData(color: 0xFFFF4747, pulseRateZones: 19.32),
//       PulseRateChartData(color: 0xffb91d1d, pulseRateZones: 25)
//     ];
//     final List<BarChartGroupData> data = [
//       BarChartGroupData(
//         x: 0,
//         barRods: [
//           BarChartRodData(
//               borderRadius: BorderRadius.circular(4),
//               width: 50.w,
//               fromY: 0,
//               toY: 100,
//               rodStackItems: loopBarRodItem(chartDatas)),
//         ],
//       ),
//     ];
//     int numOfDashes = 44;
//     double range = 100;
//     bool isBigInterval = false;
//     double interval = range / (numOfDashes + 1);

//     for (int i = 1; i <= numOfDashes + 1; i++) {
//       if (i % 5 == 0) {
//         isBigInterval = true;
//         print("True");
//       } else {
//         isBigInterval = false;
//       }
//     }
//     return Stack(
//       children: [
//         Positioned(
//             top: 100,
//             child: Container(
//               color: Colors.white,
//               height: 2,
//               width: 100,
//             )),
//         SizedBox(
//           height: 1000,
//           width: 1.sw,
//           child: BarChart(
//             BarChartData(
//               alignment: BarChartAlignment.start,
//               titlesData: FlTitlesData(
//                 leftTitles: AxisTitles(
//                   sideTitles: SideTitles(
//                     showTitles: true,
//                     reservedSize: 10,
//                     interval: 100 / (44 + 1),
//                     getTitlesWidget: (value, meta) => const Divider(
//                       thickness: 1,
//                     ),
//                   ),
//                 ),
//               ),
//               maxY: 100,
//               gridData: const FlGridData(show: false),
//               borderData: FlBorderData(show: false),
//               extraLinesData: ExtraLinesData(
//                 horizontalLines: [
//                   HorizontalLine(
//                     y: 20,
//                     strokeWidth: 1.5,
//                     color: Colors.white,
//                   )
//                 ],
//               ),

//               // rangeAnnotations: RangeAnnotations(
//               //   horizontalRangeAnnotations: [
//               //     HorizontalRangeAnnotation(
//               //       y1: 10,
//               //       y2: 11,
//               //     )
//               //   ],
//               // ),
//               barGroups: data,
//               // Customize other chart properties as needed
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

class HeartRateChart extends StatelessWidget {
  const HeartRateChart({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PulseRateChartData> chartDatas = [
      PulseRateChartData(
        color: 0xFFD795FF,
        intensityThresholdLabel: "Recovery",
        pulseRateZones: 4.55,
        intensityDuration: const Duration(minutes: 21),
      ),
      PulseRateChartData(
        color: 0xffac4fe5,
        intensityThresholdLabel: "Aerobic",
        pulseRateZones: 15.9,
        intensityDuration: const Duration(minutes: 52, seconds: 30),
      ),
      PulseRateChartData(
        color: 0xff891ecb,
        intensityThresholdLabel: "Tempo",
        pulseRateZones: 19.32,
        intensityDuration: const Duration(minutes: 16, seconds: 15),
      ),
      PulseRateChartData(
        color: 0xffff8b8b,
        intensityThresholdLabel: "Threshold",
        pulseRateZones: 15.91,
        intensityDuration: const Duration(minutes: 20, seconds: 50),
      ),
      PulseRateChartData(
        color: 0xFFFF4747,
        intensityThresholdLabel: "Speed",
        pulseRateZones: 19.32,
        intensityDuration: const Duration(seconds: 325),
      ),
      PulseRateChartData(
        color: 0xffb91d1d,
        intensityThresholdLabel: "Power",
        pulseRateZones: 25,
        intensityDuration: const Duration(),
      )
    ];
    final List<ThresholdModel> thresholds = [
      ThresholdModel(
          intensityPercent: 60, thresholdPercent: 0, bpmThreshold: 110),
      ThresholdModel(
          intensityPercent: 65, thresholdPercent: 11.13, bpmThreshold: 119),
      ThresholdModel(
          intensityPercent: 75, thresholdPercent: 33.46, bpmThreshold: 137),
      ThresholdModel(
          intensityPercent: 82, thresholdPercent: 49.15, bpmThreshold: 150),
      ThresholdModel(
          intensityPercent: 89, thresholdPercent: 69.1, bpmThreshold: 163),
      ThresholdModel(
          intensityPercent: 99, thresholdPercent: 84.8, bpmThreshold: 172),
    ];

    return SfCartesianChart(
      margin: EdgeInsets.zero,

      primaryXAxis: const CategoryAxis(
        axisLine: AxisLine(width: 0),
        minimum: 0.5,
        maximum: 5,
        interval: 1,
        majorGridLines: MajorGridLines(width: 0),
        majorTickLines: MajorTickLines(width: 0),
        // crossesAt: 10,
        isVisible: false,
      ),

      primaryYAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 0),
        axisLine: const AxisLine(
          width: 0,
        ),
        labelStyle: CustomGoogleFonts.roboto(
            color: AppColors.white100, fontWeight: FontWeight.w300),
        axisLabelFormatter: (axisLabelRenderArgs) => ChartAxisLabel("", null),
        minimum: 0,
        maximum: 100,
        interval: 100 / (44 + 1),
        majorTickLines: const MajorTickLines(width: 0),
      ),

      plotAreaBorderWidth: 0,
      plotAreaBorderColor: Colors.transparent,
      axes: const [
        CategoryAxis(
          crossesAt: 0.55,
          axisLine: AxisLine(dashArray: [1, 6.5], width: 9),
          interval: 100 / (44 + 1),
        )
      ],
      series: [
        //Fake column
        StackedColumn100Series<PulseRateChartData, double>(
          dataSource: chartDatas,
          xValueMapper: (data, _) => 0,
          yValueMapper: (data, _) => 0,
          pointColorMapper: (data, _) => Color(data.color),
          spacing: 0,
          width: 1,
        ),
        StackedColumn100Series<PulseRateChartData, double>(
          dataSource: chartDatas,
          xValueMapper: (data, _) => 1,
          yValueMapper: (data, _) => data.pulseRateZones,
          pointColorMapper: (data, _) => Color(data.color),
          spacing: 0.1,
          width: 1,
        ),
      ],

      // tooltipBehavior: TooltipBehavior(
      //   shouldAlwaysShow: false,
      //   format: '(%s, %s)',
      // ),
      annotations: [
        ...thresholds.map((threshold) => CartesianChartAnnotation(
              horizontalAlignment: ChartAlignment.center,
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${threshold.intensityPercent}",
                    style: CustomGoogleFonts.roboto(
                        fontSize: 12.r, color: AppColors.white100),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Container(
                    width: 0.21.sw,
                    height: 1,
                    padding: EdgeInsets.only(right: 10.w),
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Text(
                    "${threshold.bpmThreshold}",
                    style: CustomGoogleFonts.roboto(
                        fontSize: 12.r, color: AppColors.white100),
                  ),
                ],
              ),
              coordinateUnit: CoordinateUnit.point,
              x: 1,
              y: threshold.thresholdPercent,
            )),
        ...calculateYAxisOfThreshold(chartDatas).map(
          (threshold) => CartesianChartAnnotation(
              widget: Container(
                margin: EdgeInsets.only(left: 50.w),
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 85,
                      height: 1,
                      color: const Color(0xffffffff), // White line container
                    ),
                    Container(
                      width: 56.w,
                      decoration: BoxDecoration(
                          color: const Color(0x0DFFFFFF), // Container with text
                          borderRadius: BorderRadius.circular(4)),
                      alignment: Alignment.center,
                      child: Text(
                        threshold.intensityThresholdLabel,
                        style: CustomGoogleFonts.roboto(
                            color: Colors.white, fontSize: 10.r),
                      ),
                    ),
                    Container(
                      width: 20,
                      height: 1,
                      color: const Color(0xffffffff),
                    ),
                    Text(
                      "  ${threshold.intensityDuration.durationToString()}",
                      style: CustomGoogleFonts.roboto(
                          fontSize: 12.r, color: AppColors.white100),
                    ),
                    Text(
                      "  (${caculateDurationPercent(chartDatas.map((item) => item.intensityDuration).toList(), threshold.intensityDuration)}%)",
                      style: CustomGoogleFonts.roboto(
                          fontSize: 12.r, color: AppColors.white100),
                    )
                  ],
                ),
              ),
              coordinateUnit: CoordinateUnit.point,
              x: 3,
              y: threshold.pulseRateZones),
        ),
      ],
    );
  }
}

String caculateDurationPercent(
    List<Duration> durations, Duration otherDuration) {
  final totalDuration = durations.fold<Duration>(
    Duration.zero,
    (sum, duration) => sum.sum(duration),
  );
  final percent =
      (otherDuration.inMilliseconds / totalDuration.inMilliseconds) * 100;

  return percent.toStringAsFixed(0);
}

List<PulseRateChartData> calculateYAxisOfThreshold(
    List<PulseRateChartData> listY) {
  List<PulseRateChartData> yValues = [];
  double previousSum = 0;

  for (int i = 0; i < listY.length; i++) {
    double y;
    if (i == 0) {
      y = listY[i].pulseRateZones;
    } else {
      y = previousSum + listY[i].pulseRateZones;
    }
    yValues.add(PulseRateChartData(
        color: listY[i].color,
        intensityThresholdLabel: listY[i].intensityThresholdLabel,
        pulseRateZones: y,
        intensityDuration: listY[i].intensityDuration));
    previousSum = y;
  }

  if (yValues.isNotEmpty) {
    yValues[yValues.length - 1] = PulseRateChartData(
      color: listY.last.color,
      intensityThresholdLabel: listY.last.intensityThresholdLabel,
      pulseRateZones: 95, // Change the last value to -20
      intensityDuration: listY.last.intensityDuration,
    );
  }

  return yValues;
}
