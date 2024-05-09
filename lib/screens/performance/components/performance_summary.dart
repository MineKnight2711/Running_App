import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/colors.dart';
import '../../../config/fonts.dart';

class PerformanceSummary extends StatelessWidget {
  final double totalDistance;
  final int totalRuns;
  const PerformanceSummary({
    super.key,
    required this.totalDistance,
    required this.totalRuns,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 135.w,
          height: 55.h,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: AppColors.basicActivitiesCard,
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${totalDistance.toStringAsFixed(0)} km",
                style: CustomGoogleFonts.roboto(
                    fontSize: 18.r, color: AppColors.white100),
              ),
              Text(
                "Total distance",
                style: CustomGoogleFonts.roboto(
                    fontSize: 14.r,
                    color: AppColors.white100,
                    fontWeight: FontWeight.w200),
              )
            ],
          ),
        ),
        Container(
          width: 135.w,
          height: 55.h,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: AppColors.basicActivitiesCard,
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$totalRuns",
                style: CustomGoogleFonts.roboto(
                    fontSize: 18.r, color: AppColors.white100),
              ),
              Text(
                "Total runs",
                style: CustomGoogleFonts.roboto(
                    fontSize: 14.r,
                    color: AppColors.white100,
                    fontWeight: FontWeight.w200),
              )
            ],
          ),
        ),
      ],
    );
  }
}
