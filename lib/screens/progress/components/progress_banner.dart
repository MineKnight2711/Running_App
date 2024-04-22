import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_running_demo/config/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/fonts.dart';

List<Map<String, dynamic>> actions = [
  {
    'name': 'Gym',
    'imagePath': 'assets/images/actions/gym.png',
  },
  {
    'name': 'Hike',
    'imagePath': 'assets/images/actions/hike.png',
  },
  {
    'name': 'Qigong',
    'imagePath': 'assets/images/actions/qigong.png',
  },
  {
    'name': 'Ride',
    'imagePath': 'assets/images/actions/ride.png',
  },
  {
    'name': 'Swim',
    'imagePath': 'assets/images/actions/swim.png',
  },
  {
    'name': 'Walk',
    'imagePath': 'assets/images/actions/walk.png',
  },
  {
    'name': 'Yoga',
    'imagePath': 'assets/images/actions/yoga.png',
  },
];

class ProgressBanner extends StatelessWidget {
  const ProgressBanner({super.key});

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    return Container(
      width: 1.sw,
      height: 0.4.sh,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: Image.asset("assets/images/progress_banner.png").image,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 58.w,
            height: 62.h,
            padding: EdgeInsets.all(10.w),
            alignment: Alignment.center,
            child: Image.asset("assets/images/g_logo.jpg"),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 50),
            child: Text(
              "Be Active, Be Healthy, Be Happy",
              style: CustomGoogleFonts.roboto(
                  fontSize: 20.r, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            "Swipe to select your workout to be active",
            style: CustomGoogleFonts.roboto(
              fontSize: 14.r,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10.h),

            // alignment: Alignment.center,
            width: 1.sw,
            height: 0.4.sh - 111.h,
            child: Swiper(
              itemCount: actions.length,
              viewportFraction: 0.5,
              scale: 0.5,
              onIndexChanged: (value) {
                currentIndex = value;
              },
              itemBuilder: (context, index) {
                final item = actions[index];

                return Column(
                  children: [
                    CircleAvatar(
                      radius: 45.r,
                      backgroundColor: currentIndex == index
                          ? AppColors.progressActionActive
                          : AppColors.progressAction,
                      child: Image.asset(
                        item["imagePath"],
                        scale: 0.7,
                      ),
                    ),
                    Text(
                      item["name"],
                      style: CustomGoogleFonts.roboto(fontSize: 16.r),
                    )
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
