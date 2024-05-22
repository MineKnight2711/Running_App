import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../config/config_export.dart';

class BottomNavigationTabBar extends StatelessWidget {
  final TabController tabController;
  final Function(int index) onTabChange;
  const BottomNavigationTabBar(
      {super.key, required this.onTabChange, required this.tabController});

  @override
  Widget build(BuildContext context) {
    final RxInt currentIndex = 0.obs;
    return Container(
      color: AppColors.sheetBackground,
      height: 50.h,
      child: Obx(
        () => TabBar(
          isScrollable: false,
          onTap: (index) {
            currentIndex.value = tabController.index = index;
            onTabChange(index);
          },
          tabs: [
            Tab(
              icon: SvgPicture.asset(
                "assets/svg/bottom_bar/progress.svg",
                colorFilter: ColorFilter.mode(
                  currentIndex.value == 0
                      ? AppColors.appButton
                      : AppColors.white100,
                  BlendMode.srcATop,
                ),
              ),
              child: Text(
                "Progress",
                style: CustomGoogleFonts.roboto(
                  fontSize: 12.r,
                  color: currentIndex.value == 0
                      ? AppColors.appButton
                      : AppColors.white100,
                ),
              ),
            ),
            Tab(
              icon: SvgPicture.asset(
                "assets/svg/bottom_bar/preparation.svg",
                colorFilter: ColorFilter.mode(
                  currentIndex.value == 1
                      ? AppColors.appButton
                      : AppColors.white100,
                  BlendMode.srcATop,
                ),
              ),
              child: Text(
                "Preparation",
                style: CustomGoogleFonts.roboto(
                  fontSize: 12.r,
                  color: currentIndex.value == 1
                      ? AppColors.appButton
                      : AppColors.white100,
                ),
              ),
            ),
          ],
          unselectedLabelColor: AppColors.white100,
          controller: tabController,
          indicatorColor: Colors.transparent,
          indicatorPadding: EdgeInsets.symmetric(horizontal: 5.w),
          labelPadding: EdgeInsets.symmetric(horizontal: 5.w),
          dividerHeight: 0,
        ),
      ),
    );
  }
}
