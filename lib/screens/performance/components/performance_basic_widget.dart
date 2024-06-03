import 'package:flutter/material.dart';
import '../../../config/config_export.dart';
import 'package:get/get.dart';

import 'activities_stats_button_row.dart';
import 'charts/data/nested_chart_tempdata.dart';
import 'nested_chart.dart';
import 'performance_summary.dart';
import 'period_button_row.dart';

class PerformanceBasicWidget extends StatelessWidget {
  const PerformanceBasicWidget({
    super.key,
  });
  final List<String> periodButtonRow = const [
    'Week',
    'Month',
    'Year',
  ];
  final List<String> activityStatsButtonRow = const [
    'Distance',
    'Time',
    'Ascent',
    'Calories'
  ];

  @override
  Widget build(BuildContext context) {
    final Rx<RecordType> selectedType = RecordType.weekly.obs;
    final Rx<DetailsRecordType> selectedDetailsType =
        DetailsRecordType.distance.obs;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: AppSpacings.vs5,
        ),
        Text(
          "Basic",
          style: CustomGoogleFonts.roboto(
              color: AppColors.white100, fontSize: AppFontSizes.size18),
        ),
        SizedBox(
          height: AppSpacings.vs20,
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
          height: AppSpacings.vs15,
        ),
        ActivityStatsRow(
          size: 1.65,
          onSelectedIndex: (index) {
            switch (index) {
              case 0:
                selectedDetailsType.value = DetailsRecordType.distance;
                break;
              case 1:
                selectedDetailsType.value = DetailsRecordType.time;
                break;
              case 2:
                selectedDetailsType.value = DetailsRecordType.ascent;
                break;
              case 3:
                selectedDetailsType.value = DetailsRecordType.calories;
                break;
              default:
                break;
            }
          },
          listButton: activityStatsButtonRow,
        ),
        SizedBox(
          height: AppSpacings.vs15,
        ),
        SizedBox(
          width: AppSpacings.sw(1),
          height: AppSpacings.sh(0.2),
          child: Obx(
            () => NestedChart(
              detailsRecordType: selectedDetailsType.value,
              recordType: selectedType.value,
            ),
          ),
        ),
        SizedBox(
          height: AppSpacings.vs10,
        ),
        const PerformanceSummary(
          totalDistance: 41,
          totalRuns: 3,
        ),
        SizedBox(
          height: AppSpacings.vs20,
        ),
      ],
    );
  }
}
