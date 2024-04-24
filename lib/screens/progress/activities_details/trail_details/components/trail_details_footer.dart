import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/colors.dart';
import '../../../../../config/fonts.dart';

class TrailDetailsFooter extends StatelessWidget {
  const TrailDetailsFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.grey[800],
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
                '4.8 km',
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
                '00:15:57',
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
                '3:12/km',
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
                '2m',
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
                  '328',
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
