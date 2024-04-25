import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/colors.dart';
import '../../../../../../config/fonts.dart';

class TrailDetailsFooter extends StatelessWidget {
  final double distance, pace, ascent, calories;
  final String time;
  const TrailDetailsFooter({
    super.key,
    required this.distance,
    required this.pace,
    required this.ascent,
    required this.calories,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 60,
      color: const Color(0xFF2F2828).withOpacity(0.65),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Distance',
                style: CustomGoogleFonts.roboto(
                  fontSize: 12.r,
                  fontWeight: FontWeight.w300,
                  color: const Color(0xFFB4AEAB),
                ),
              ),
              Text(
                '$distance km',
                style: CustomGoogleFonts.roboto(
                  fontSize: 16.r,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white100,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Time',
                style: CustomGoogleFonts.roboto(
                  fontSize: 12.r,
                  fontWeight: FontWeight.w300,
                  color: const Color(0xFFB4AEAB),
                ),
              ),
              Text(
                time,
                style: CustomGoogleFonts.roboto(
                  fontSize: 16.r,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white100,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Pace',
                style: CustomGoogleFonts.roboto(
                  fontSize: 12.r,
                  fontWeight: FontWeight.w300,
                  color: const Color(0xFFB4AEAB),
                ),
              ),
              Text(
                '$pace/km',
                style: CustomGoogleFonts.roboto(
                  fontSize: 16.r,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white100,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Ascent',
                style: CustomGoogleFonts.roboto(
                  fontSize: 12.r,
                  fontWeight: FontWeight.w300,
                  color: const Color(0xFFB4AEAB),
                ),
              ),
              Text(
                '${ascent}m',
                style: CustomGoogleFonts.roboto(
                  fontSize: 16.r,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white100,
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Calories',
                  textAlign: TextAlign.start,
                  style: CustomGoogleFonts.roboto(
                    fontSize: 12.r,
                    fontWeight: FontWeight.w300,
                    color: const Color(0xFFB4AEAB),
                  ),
                ),
                Text(
                  calories.toStringAsFixed(0),
                  style: CustomGoogleFonts.roboto(
                    fontSize: 16.r,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white100,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
