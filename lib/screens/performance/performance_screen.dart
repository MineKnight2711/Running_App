import 'package:flutter/material.dart';
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
                SizedBox(width: 0.8.sw, height: 260.h, child: HeartRateChart())

                // AspectRatio(aspectRatio: 2, child: TestChart()),
              ],
            ),
          ),
        ),
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
