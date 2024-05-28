import 'package:flutter/material.dart';
import 'package:flutter_running_demo/screens/performance/components/charts/data/intensity_tempdata.dart';
import 'package:flutter_running_demo/screens/performance/components/charts/data/nested_chart_tempdata.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../config/config_export.dart';
import '../../models/intensity_model/intensity_model.dart';
import '../../widgets/custom_dropdown/custom_dropdown_widget.dart';
import '../../widgets/widget_export.dart';
import '../progress/progress_screen/components/route_details/route_details.dart';
import 'components/components_export.dart';
import 'components/charts/charts_export.dart';

class PerformanceMetricsScreen extends GetView {
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
    final Rx<RecordType> selectedType = RecordType.weekly.obs;
    final Rx<DetailsRecordType> selectedDetailsType =
        DetailsRecordType.distance.obs;
    final Rx<IntensityChartType> selectedIntensityChartType =
        IntensityChartType.pulseRate.obs;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        onBackPress: () => AppRoutes.navigateBack(),
        title: "Performance metrics",
        secondaryAction: ActionButton(
          imagePath: "assets/svg/info.svg",
          onTap: () {
            AppRoutes.navigate(AppRoutes.metricinfo);
          },
        ),
      ),
      body: Container(
        width: 1.sw,
        height: 1.sh,
        decoration: const BoxDecoration(gradient: AppColors.appTheme),
        // padding: EdgeInsets.only(top: 50.h, left: 20.w, right: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  "Record",
                  style: CustomGoogleFonts.roboto(
                      color: AppColors.white100, fontSize: 18.r),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              // DropDownActivitiesMenu(
              //   activitiesList: activitiesDropDownList,
              // ),
              CustomDropdownWidget(
                iconData: Icons.directions_walk,
                dropDownHeight: 0.38.sh,
                horizontalButtonPadding: 20.w,
                title: "23km",
                subtitle: "Longest Walking",
                dropDownWidget: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: RouteDetailsWidget(
                    route: routeTempList[2],
                  ),
                ),
              ),
              CustomDropdownWidget(
                iconData: Icons.route,
                dropDownHeight: 0.38.sh,
                horizontalButtonPadding: 20.w,
                title: "100km",
                subtitle: "Longest Route",
                dropDownWidget: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: RouteDetailsWidget(
                    route: routeTempList.first,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "Basic",
                      style: CustomGoogleFonts.roboto(
                          color: AppColors.white100, fontSize: 18.r),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    PeriodButtonRow(
                      onSelectedIndex: (value) {
                        switch (value) {
                          case 0:
                            selectedType.value = RecordType.weekly;
                            break;
                          case 1:
                            selectedType.value = RecordType.monthly;
                            break;
                          case 2:
                            selectedType.value = RecordType.yearly;
                            break;
                          default:
                            break;
                        }
                      },
                      listButton: periodButtonRow,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    ActivityStatsRow(
                      size: 1.65,
                      onSelectedIndex: (index) {
                        switch (index) {
                          case 0:
                            selectedDetailsType.value =
                                DetailsRecordType.distance;
                            break;
                          case 1:
                            selectedDetailsType.value = DetailsRecordType.time;
                            break;
                          case 2:
                            selectedDetailsType.value =
                                DetailsRecordType.ascent;
                            break;
                          case 3:
                            selectedDetailsType.value =
                                DetailsRecordType.calories;
                            break;
                          default:
                            break;
                        }
                      },
                      listButton: activityStatsButtonRow,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    SizedBox(
                      width: 1.sw,
                      height: 0.2.sh,
                      child: Obx(
                        () => NestedChart(
                          detailsRecordType: selectedDetailsType.value,
                          recordType: selectedType.value,
                        ),
                      ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          style: IconButton.styleFrom(
                              backgroundColor: AppColors.basicActivitiesCard),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.chevron_left,
                            color: AppColors.white100,
                          ),
                        ),
                        Text(
                          "Latest run, 27/06/2023",
                          style: CustomGoogleFonts.roboto(
                              fontSize: 14.r, color: AppColors.white100),
                        ),
                        IconButton(
                          style: IconButton.styleFrom(
                              backgroundColor: AppColors.basicActivitiesCard),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.chevron_right,
                            color: AppColors.white100,
                          ),
                        ),
                      ],
                    ),
                    ActivityStatsRow(
                      size: 1.9,
                      onSelectedIndex: (index) {
                        switch (index) {
                          case 0:
                            selectedIntensityChartType.value =
                                IntensityChartType.pulseRate;
                            break;
                          case 1:
                            selectedIntensityChartType.value =
                                IntensityChartType.pace;
                            break;
                          case 2:
                            selectedIntensityChartType.value =
                                IntensityChartType.overlay;
                            break;
                          default:
                            break;
                        }
                      },
                      listButton: chartButtonRow,
                    ),
                    AspectRatio(
                      aspectRatio: 2,
                      child: Obx(
                        () => IntensityLineChart(
                          intensityChartType: selectedIntensityChartType.value,
                          intensity: IntensityModel.mock(
                              numPoints: 50, minBpm: 80, maxBpm: 160),
                          pace: IntensityModel.mock(
                            numPoints: 40,
                            minBpm: 100,
                            maxBpm: 180,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Intensity",
                          style: CustomGoogleFonts.roboto(
                              color: AppColors.white100, fontSize: 18.r),
                        ),
                        SizedBox(
                          width: 105.w,
                        ),
                        Text(
                          "Time",
                          style: CustomGoogleFonts.roboto(
                              color: AppColors.white100, fontSize: 18.r),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                      ],
                    ),
                    SizedBox(
                        width: 1.sw,
                        height: 260.h,
                        child: const HeartRateChart()),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
