import 'package:flutter/material.dart';
import '../../../config/config_export.dart';
import 'charts/heart_rate_chart.dart';

class PerformancePulseRate extends StatelessWidget {
  const PerformancePulseRate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Heart pulse rate",
              style: CustomGoogleFonts.roboto(
                color: AppColors.white100,
                fontSize: AppFontSizes.size18,
              ),
            ),
            SizedBox(
              width: AppSpacings.chs(105),
            ),
            Text(
              "Time",
              style: CustomGoogleFonts.roboto(
                  color: AppColors.white100, fontSize: AppFontSizes.size18),
            ),
            SizedBox(
              width: AppSpacings.hs5,
            ),
          ],
        ),
        SizedBox(
          height: AppSpacings.vs20,
        ),
        SizedBox(
          width: AppSpacings.sw(1),
          height: AppSpacings.cvs(260),
          child: const HeartRateChart(),
        ),
        SizedBox(
          height: AppSpacings.cvs(20),
        ),
      ],
    );
  }
}
