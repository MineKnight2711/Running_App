import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/config_export.dart';
import 'package:flutter_running_demo/widgets/app_bar.dart';
import 'package:flutter_running_demo/screens/progress/activities/components/basic_activities/walk_report.dart';
import 'package:flutter_running_demo/screens/progress/activities/components/progress_banner.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../progress/activities/components/basic_activities/sleep_report.dart';

class HomeScreen extends GetView {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: "Be active",
        onBackPress: () => AppRoutes.navigateBack(),
      ),
      body: Container(
        clipBehavior: Clip.none,
        decoration: const BoxDecoration(gradient: AppColors.appTheme),
        padding: EdgeInsets.only(top: 70.h),
        child: SizedBox(
          width: 1.sw,
          height: 1.sh,
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
    );
  }
}
