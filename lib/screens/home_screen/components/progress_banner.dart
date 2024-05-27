import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/colors.dart';
import 'package:flutter_running_demo/config/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../config/fonts.dart';

List<Map<String, dynamic>> actions = [
  {
    'name': 'Gym',
    'imagePath': 'gym',
  },
  {
    'name': 'Hike',
    'imagePath': 'hike',
  },
  {
    'name': 'Qigong',
    'imagePath': 'qigong',
  },
  {
    'name': 'Ride',
    'imagePath': 'ride',
  },
  {
    'name': 'Swim',
    'imagePath': 'swim',
  },
  {
    'name': 'Walk',
    'imagePath': 'walk',
  },
  {
    'name': 'Yoga',
    'imagePath': 'yoga',
  },
];

class ProgressBanner extends StatelessWidget {
  const ProgressBanner({super.key});

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    return Container(
      width: 1.sw,
      height: 0.36.sh,
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
            height: 60.h,
            padding: EdgeInsets.all(5.h),
            alignment: Alignment.center,
            child: Image.asset("assets/images/g_logo.jpg"),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.w),
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
            padding: EdgeInsets.only(top: 20.h),
            width: 1.sw,
            //Caculate Swiper height
            height: 0.36.sh - (70.h + 34.r + 10.h),
            child: Swiper(
              itemCount: actions.length,
              viewportFraction: 0.5,
              scale: 0.5,
              onIndexChanged: (value) {
                currentIndex = value;
              },
              itemBuilder: (context, index) {
                final item = actions[index];

                return GestureDetector(
                  onTap: () => AppRoutes.navigateReplace(AppRoutes.tabbarview),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 45.r,
                        backgroundColor: currentIndex == index
                            ? AppColors.progressActionActive
                            : AppColors.progressAction,
                        child: SvgPicture.asset(
                          "assets/svg/activities/${item["imagePath"]}.svg",
                        ),
                      ),
                      Text(
                        item["name"],
                        style: CustomGoogleFonts.roboto(fontSize: 16.r),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
