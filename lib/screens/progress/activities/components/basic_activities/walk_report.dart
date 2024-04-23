import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/colors.dart';
import '../../../../../config/fonts.dart';

class WalkReport extends StatelessWidget {
  const WalkReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: AppColors.basicActivitiesCard,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                width: 1,
                color: AppColors.basicActivitiesCard,
              )),
          child: Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    children: [
                      Container(
                        width: 52.w,
                        height: 52.w,
                        decoration: BoxDecoration(
                          color: const Color(0x0DFFFFFF),
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            scale: 1,
                            image: Image.asset(
                                    "assets/images/basic_activities/footprint.png")
                                .image,
                          ),
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildScore(),
                          SizedBox(height: 5.h),
                          buildDuration()
                        ],
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.chevron_right_sharp,
                        size: 40,
                        color: AppColors.white100,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                buildActivitiesRate()
              ],
            ),
          ),
        ),
      ],
    );
  }

  //Score
  Widget buildScore() {
    return Row(
      children: [
        Text(
          'Today',
          style: CustomGoogleFonts.roboto(
            color: Colors.white,
            fontSize: 12.r,
          ),
        ),
        SizedBox(width: 16.w),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: '4365',
                  style: CustomGoogleFonts.roboto(
                      fontSize: 16.r,
                      color: AppColors.white100,
                      fontWeight: FontWeight.bold)),
              TextSpan(
                text: ' steps',
                style: CustomGoogleFonts.roboto(
                  fontSize: 12.r,
                  color: AppColors.white100,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  //Duration
  Widget buildDuration() {
    return Row(
      children: [
        Text(
          'Week Avg',
          style: CustomGoogleFonts.roboto(
            color: AppColors.white100,
            fontSize: 12.r,
          ),
        ),
        SizedBox(width: 16.w),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: '3123',
                  style: CustomGoogleFonts.roboto(
                      fontSize: 16.r,
                      color: AppColors.white100,
                      fontWeight: FontWeight.bold)),
              TextSpan(
                text: ' steps',
                style: CustomGoogleFonts.roboto(
                  fontSize: 12.r,
                  color: AppColors.white100,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  //Activities Rate
  Widget buildActivitiesRate() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: const Color(0x80FF4747),
          borderRadius: BorderRadius.circular(20),
          shape: BoxShape.rectangle),
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16.0,
      ),
      child: Text(
        'Your activity level is low this week',
        style: CustomGoogleFonts.roboto(
          color: AppColors.white100,
          fontSize: 16.0,
        ),
      ),
    );
  }
}
