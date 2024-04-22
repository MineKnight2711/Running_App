import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/colors.dart';
import 'package:flutter_running_demo/config/fonts.dart';
import 'package:flutter_running_demo/screens/progress/components/app_bar.dart';
import 'package:flutter_running_demo/screens/progress/components/basic_activities/walk_report.dart';
import 'package:flutter_running_demo/screens/progress/components/progress_banner.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components/basic_activities/sleep_report.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const ProgressAppBar(),
      body: Container(
        clipBehavior: Clip.none,
        decoration: const BoxDecoration(gradient: AppColors.appTheme),
        padding: EdgeInsets.only(top: 60.h),
        child: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const ProgressBanner(),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Basic Activities",
                        style: CustomGoogleFonts.roboto(
                          fontSize: 18.r,
                          color: AppColors.white100,
                        ),
                      ),
                      const SleepReport(),
                      SizedBox(
                        height: 20.h,
                      ),
                      const WalkReport()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
