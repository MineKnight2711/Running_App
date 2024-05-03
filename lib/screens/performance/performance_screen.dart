import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_running_demo/screens/performance/components/nested_chart.dart';
import 'package:flutter_running_demo/screens/performance/components/activities_stats_button_row.dart';
import 'package:flutter_running_demo/screens/performance/components/dropdown_activities.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/config_export.dart';
import '../../models/intensity_model/intensity_model.dart';
import '../../widgets/widget_export.dart';
import 'components/charts/heart_rate_chart.dart';
import 'components/performance_summary.dart';
import 'components/period_button_row.dart';
import 'components/charts/intensity_linechart.dart';

class PerformanceMetricsScreen extends StatelessWidget {
  final List<String> periodButtonRow = [
    'Week',
    'Month',
    'Year',
  ];
  final List<String> activityStatsButtonRow = [
    'Distance',
    'Time',
    'Ascent',
    'Calories'
  ];
  final List<String> chartButtonRow = [
    'Pluse rate',
    'Pace',
    'Overlay',
  ];
  PerformanceMetricsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final IntensityModel intensity = IntensityModel.mock();
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(
          onBackPress: () => AppRoutes.navigateBack(),
          title: "Performance metrics",
          secondaryAction: ActionButton(
            imagePath: "assets/images/activities_details/info.png",
            onTap: () {},
          ),
        ),
        body: Container(
          width: 1.sw,
          height: 1.sh,
          decoration: const BoxDecoration(gradient: AppColors.appTheme),
          padding: EdgeInsets.only(top: 50.h, left: 20.w, right: 20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Record",
                  style: CustomGoogleFonts.roboto(
                      color: AppColors.white100, fontSize: 18.r),
                ),
                SizedBox(
                  height: 8.h,
                ),
                DropDownActivitiesMenu(
                  activitiesList: activitiesDropDownList,
                ),
                SizedBox(
                  height: 16.h,
                ),
                DropDownActivitiesMenu(
                  activitiesList: activitiesDropDownList2,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Basic",
                  style: CustomGoogleFonts.roboto(
                      color: AppColors.white100, fontSize: 18.r),
                ),
                PeriodButtonRow(
                  listButton: periodButtonRow,
                ),
                SizedBox(
                  height: 16.h,
                ),
                ActivityStatsRow(
                  size: 1.65,
                  listButton: activityStatsButtonRow,
                ),
                const AspectRatio(
                  aspectRatio: 2,
                  child: NestedChart(),
                ),
                SizedBox(
                  height: 10.h,
                ),
                const PerformanceSummary(
                  totalDistance: 41,
                  totalRuns: 3,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Intensity",
                  style: CustomGoogleFonts.roboto(
                      color: AppColors.white100, fontSize: 18.r),
                ),
                ActivityStatsRow(
                  size: 1.9,
                  listButton: chartButtonRow,
                ),
                AspectRatio(
                  aspectRatio: 2,
                  child: IntensityLineChart(intensity: intensity),
                ),
                SizedBox(width: 0.6.sw, height: 235.h, child: HeartRateChart())

                // AspectRatio(aspectRatio: 2, child: TestChart()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PulseRateChart extends StatelessWidget {
  const PulseRateChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        maxY: 190,
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        barTouchData: BarTouchData(
          enabled: false,
        ),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                return Text(value.toString());
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              getTitlesWidget: (double value, TitleMeta meta) {
                return Text(
                  value.toStringAsFixed(0),
                  style: CustomGoogleFonts.roboto(color: AppColors.white100),
                );
              },
            ),
          ),
        ),
        barGroups: [
          // Provide the data for each bar or zone

          BarChartGroupData(
            x: 0,
            barRods: [
              BarChartRodData(
                rodStackItems: [BarChartRodStackItem(40, 150, Colors.yellow)],
                width: 30.w,

                borderRadius: BorderRadius.circular(4),
                toY: 183, // Value or percentage for the "Power" zone
                color: Colors.red, // Color for the "Power" zone
              ),
              BarChartRodData(
                toY: 150, // Value or percentage for the "Power" zone
                color: Colors.yellow, // Color for the "Power" zone
              ),
            ],
          ),
          // Add more BarChartGroupData for other zones
        ],
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  final double dashHeight;
  final double dashWidth;
  final double dashSpace;
  final double strokeWidth;
  final Color color;

  DashedLinePainter({
    required this.dashSpace,
    required this.dashHeight,
    required this.dashWidth,
    required this.strokeWidth,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    double startX = size.width / 2 - dashWidth / 2;
    double startY = 0;

    while (startY < size.height) {
      canvas.drawRect(
        Rect.fromLTWH(
          startX,
          startY,
          dashWidth,
          dashHeight,
        ),
        paint,
      );
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
