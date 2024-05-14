import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../config/config_export.dart';
import '../../controllers/tabbar_controller.dart';

class BottomNavigationTabBar extends StatefulWidget {
  final Function(int index) onTabChange;
  const BottomNavigationTabBar({super.key, required this.onTabChange});

  @override
  State<BottomNavigationTabBar> createState() => _BottomNavigationTabBarState();
}

class _BottomNavigationTabBarState extends State<BottomNavigationTabBar> {
  int currentIndex = 0;
  final bottomTabBarController = Get.find<BottomTabBarController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.sheetBackground,
      child: TabBar(
        isScrollable: false,
        onTap: (index) => setState(() {
          currentIndex = bottomTabBarController.currentTabIndex.value = index;
          widget.onTabChange(index);
        }),
        tabs: [
          Tab(
            icon: SvgPicture.asset(
              "assets/svg/bottom_bar/progress.svg",
              colorFilter: ColorFilter.mode(
                currentIndex == 0 ? AppColors.appButton : AppColors.white100,
                BlendMode.srcATop,
              ),
            ),
            child: Text(
              "Preparation",
              style: CustomGoogleFonts.roboto(
                fontSize: 12.r,
                color: currentIndex == 0
                    ? AppColors.appButton
                    : AppColors.white100,
              ),
            ),
          ),
          Tab(
            icon: SvgPicture.asset(
              "assets/svg/bottom_bar/preparation.svg",
              colorFilter: ColorFilter.mode(
                currentIndex == 1 ? AppColors.appButton : AppColors.white100,
                BlendMode.srcATop,
              ),
            ),
            child: Text(
              "Preparation",
              style: CustomGoogleFonts.roboto(
                fontSize: 12.r,
                color: currentIndex == 1
                    ? AppColors.appButton
                    : AppColors.white100,
              ),
            ),
            // text: "Preparation",
          ),
        ],
        unselectedLabelColor: AppColors.white100,
        controller: bottomTabBarController.tabController.value,
        indicatorColor: Colors.transparent,
        indicatorPadding: EdgeInsets.symmetric(horizontal: 5.w),
        labelPadding: EdgeInsets.symmetric(horizontal: 5.w),
      ),
    );
  }
}
