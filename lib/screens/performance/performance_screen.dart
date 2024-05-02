import 'package:flutter/material.dart';
import 'package:flutter_running_demo/screens/performance/bargraph/bar_graph.dart';
import 'package:flutter_running_demo/screens/performance/chartmodel/line_double_chart.dart';
import 'package:flutter_running_demo/screens/performance/components/activities_stats_row.dart';
import 'package:flutter_running_demo/screens/performance/components/dropdown_activities.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/config_export.dart';
import '../../widgets/widget_export.dart';
import 'components/period_button_row.dart';

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

  PerformanceMetricsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                  listButton: activityStatsButtonRow,
                ),
                AspectRatio(
                  aspectRatio: 1.5,
                  child: MyBarGraph(),
                )
              ],
            )),
      ),
    );
  }
}
