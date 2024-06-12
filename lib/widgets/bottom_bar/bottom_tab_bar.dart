import 'package:flutter/material.dart';
import 'package:flutter_running_demo/controllers/tabbar_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../config/config_export.dart';

class BottomNavigationTabBar extends GetView<TabBarController> {
  const BottomNavigationTabBar({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bottomBarBackground,
      height: AppSpacings.vs25 * 2,
      child: TabBar(
        isScrollable: false,
        onTap: (index) {
          controller.currentIndex.value =
              controller.tabController.index = index;
        },
        tabs: controller.bottomTabs.asMap().entries.map((tab) {
          final index = tab.key;
          final value = tab.value;
          return Obx(
            () => Tab(
              iconMargin: const EdgeInsets.all(5),
              icon: SvgPicture.asset(
                "assets/svg/bottom_bar/${value.toLowerCase()}.svg",
                colorFilter: ColorFilter.mode(
                  controller.currentIndex.value == index
                      ? AppColors.appButton
                      : AppColors.white100,
                  BlendMode.srcATop,
                ),
              ),
              child: Text(
                value,
                style: CustomGoogleFonts.roboto(
                  fontSize: AppFontSizes.size12,
                  color: controller.currentIndex.value == index
                      ? AppColors.appButton
                      : AppColors.white100,
                ),
              ),
            ),
          );
        }).toList(),
        unselectedLabelColor: AppColors.white100,
        controller: controller.tabController,
        indicatorColor: Colors.transparent,
        indicatorPadding: EdgeInsets.symmetric(horizontal: AppSpacings.chs(2)),
        labelPadding: EdgeInsets.symmetric(horizontal: AppSpacings.chs(2)),
        dividerHeight: 0,
      ),
    );
  }
}
