import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../config/config_export.dart';
import '../../controllers/tabbar_controller.dart';

class BottomNavigationTabBar extends StatelessWidget {
  final bottomTabBarController = Get.find<BottomTabBarController>();
  BottomNavigationTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff2c2a2d),
      child: TabBar(
        physics: const NeverScrollableScrollPhysics(),
        onTap: (value) => bottomTabBarController.selectTab(value),
        tabs: bottomTabBarController.tabs
            .map(
              (tab) => SizedBox(
                width: 1.sw / 4.5,
                height: 1.sh / 12,
                child: Tab(
                    icon: Obx(
                      () => SvgPicture.asset(
                        "assets/svg/bottom_bar/${tab.imagePath}.svg",
                        width: 24,
                        height: 24,
                        colorFilter: ColorFilter.mode(
                            bottomTabBarController.selectedTab.value?.tag ==
                                    tab.tag
                                ? Colors.orange
                                : Colors.white,
                            BlendMode.srcATop),
                      ),
                    ),
                    text: tab.name),
              ),
            )
            .toList(),
        labelStyle: CustomGoogleFonts.roboto(fontSize: 12.r),
        labelColor: Colors.orange,
        unselectedLabelColor: AppColors.white100,
        controller: bottomTabBarController.tabController.value,
        indicatorColor: Colors.transparent,
        indicatorPadding: EdgeInsets.symmetric(horizontal: 5.w),
        labelPadding: EdgeInsets.symmetric(horizontal: 5.w),
      ),
    );
  }
}
