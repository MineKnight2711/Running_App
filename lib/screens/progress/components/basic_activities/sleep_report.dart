import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/fonts.dart';

class SleepReport extends StatelessWidget {
  const SleepReport({super.key});

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
                            scale: 0.7,
                            image: Image.asset(
                                    "assets/images/basic_activities/zz.png")
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
          'Score',
          style: CustomGoogleFonts.roboto(
            color: Colors.white,
            fontSize: 12.r,
          ),
        ),
        SizedBox(width: 16.w),
        Text(
          '83/100',
          style: CustomGoogleFonts.roboto(
            color: Colors.white,
            fontSize: 16.r,
          ),
        ),
        SizedBox(width: 16.w),
        Text(
          '83/100',
          style: CustomGoogleFonts.roboto(
            color: Colors.white,
            fontSize: 16.r,
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
          'Duration',
          style: CustomGoogleFonts.roboto(
            color: AppColors.white100,
            fontSize: 16.0,
          ),
        ),
        SizedBox(width: 16.w),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: '06:32',
                  style: CustomGoogleFonts.roboto(
                      fontSize: 16.r,
                      color: AppColors.white100,
                      fontWeight: FontWeight.bold)),
              TextSpan(
                text: ' hours',
                style: CustomGoogleFonts.roboto(
                  fontSize: 14.r,
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
          color: const Color(0x7f00d688),
          borderRadius: BorderRadius.circular(20),
          shape: BoxShape.rectangle),
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16.0,
      ),
      child: Text(
        'You have GOOD sleep last night! Awesome!',
        style: CustomGoogleFonts.roboto(
          color: AppColors.white100,
          fontSize: 16.0,
        ),
      ),
    );
  }
}
