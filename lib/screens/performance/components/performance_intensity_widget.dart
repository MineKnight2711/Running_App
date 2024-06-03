import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../config/config_export.dart';
import '../../../models/intensity_model/intensity_model.dart';
import 'activities_stats_button_row.dart';
import 'charts/data/intensity_tempdata.dart';
import 'charts/intensity_linechart.dart';

class PerformanceIntensityWidget extends StatelessWidget {
  const PerformanceIntensityWidget({
    super.key,
  });
  final List<String> chartButtonRow = const [
    'Pluse rate',
    'Pace',
    'Overlay',
  ];
  @override
  Widget build(BuildContext context) {
    final Rx<IntensityChartType> selectedIntensityChartType =
        IntensityChartType.pulseRate.obs;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Intensity",
          style: CustomGoogleFonts.roboto(
            color: AppColors.white100,
            fontSize: AppFontSizes.size18,
          ),
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
                fontSize: AppFontSizes.size14,
                color: AppColors.white100,
              ),
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
                selectedIntensityChartType.value = IntensityChartType.pulseRate;
                break;
              case 1:
                selectedIntensityChartType.value = IntensityChartType.pace;
                break;
              case 2:
                selectedIntensityChartType.value = IntensityChartType.overlay;
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
              intensity:
                  IntensityModel.mock(numPoints: 50, minBpm: 80, maxBpm: 160),
              pace: IntensityModel.mock(
                numPoints: 40,
                minBpm: 100,
                maxBpm: 180,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
