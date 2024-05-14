import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_running_demo/extensions/integer_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/colors.dart';
import '../../../../../../config/fonts.dart';
import '../../../../../../models/route_model/route_model.dart';

class TrailDetailsFooter extends StatelessWidget {
  final bool? titleInFooter;
  final RouteModel trail;
  const TrailDetailsFooter({
    super.key,
    required this.trail,
    this.titleInFooter = false,
  });

  @override
  Widget build(BuildContext context) {
    int columnHeaderTextSize = 12;
    int trailDetailsTextSize = titleInFooter! ? 14 : 16;
    int columnGap = titleInFooter! ? 10 : 14;
    return Container(
      width: 1.sw,
      height: titleInFooter! ? 70.h : 50.h,
      color: const Color(0xFF2F2828).withOpacity(0.65),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          titleInFooter!
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Text(
                    trail.title,
                    style: CustomGoogleFonts.roboto(
                      fontSize: trailDetailsTextSize.r,
                      color: AppColors.white100,
                    ),
                  ),
                )
              : const SizedBox.shrink(),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 8.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Distance',
                    style: CustomGoogleFonts.roboto(
                      fontSize: columnHeaderTextSize.r,
                      fontWeight: FontWeight.w300,
                      color: const Color(0xFFB4AEAB),
                    ),
                  ),
                  Text(
                    '${trail.distance} km',
                    style: CustomGoogleFonts.roboto(
                      fontSize: trailDetailsTextSize.r,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white100,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: columnGap.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Time',
                    style: CustomGoogleFonts.roboto(
                      fontSize: columnHeaderTextSize.r,
                      fontWeight: FontWeight.w300,
                      color: const Color(0xFFB4AEAB),
                    ),
                  ),
                  Text(
                    trail.totalTime.totalTimeToString(),
                    style: CustomGoogleFonts.roboto(
                      fontSize: trailDetailsTextSize.r,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white100,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: columnGap.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Pace',
                    style: CustomGoogleFonts.roboto(
                      fontSize: columnHeaderTextSize.r,
                      fontWeight: FontWeight.w300,
                      color: const Color(0xFFB4AEAB),
                    ),
                  ),
                  Text(
                    '${trail.pace}/km',
                    style: CustomGoogleFonts.roboto(
                      fontSize: trailDetailsTextSize.r,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white100,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: columnGap.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Ascent',
                    style: CustomGoogleFonts.roboto(
                      fontSize: columnHeaderTextSize.r,
                      fontWeight: FontWeight.w300,
                      color: const Color(0xFFB4AEAB),
                    ),
                  ),
                  Text(
                    '${trail.pace}m',
                    style: CustomGoogleFonts.roboto(
                      fontSize: trailDetailsTextSize.r,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white100,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: columnGap.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Calories',
                    textAlign: TextAlign.start,
                    style: CustomGoogleFonts.roboto(
                      fontSize: columnHeaderTextSize.r,
                      fontWeight: FontWeight.w300,
                      color: const Color(0xFFB4AEAB),
                    ),
                  ),
                  Text(
                    trail.calories.toStringAsFixed(0),
                    style: CustomGoogleFonts.roboto(
                      fontSize: trailDetailsTextSize.r,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white100,
                    ),
                  ),
                  SizedBox(
                    width: columnGap.w,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
