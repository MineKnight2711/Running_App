import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../config/config_export.dart';
import '../../controllers/tabbar_controller.dart';

class BottomNavigationTabBar extends StatefulWidget {
  const BottomNavigationTabBar({super.key});

  @override
  State<BottomNavigationTabBar> createState() => _BottomNavigationTabBarState();
}

class _BottomNavigationTabBarState extends State<BottomNavigationTabBar> {
  int currentIndex = 0;
  final bottomTabBarController = Get.find<BottomTabBarController>();
  @override
  void initState() {
    super.initState();
    bottomTabBarController.tabController.value?.addListener(() {
      if (bottomTabBarController.tabController.value!.indexIsChanging) {
        setState(() {
          currentIndex = bottomTabBarController.tabController.value!.index;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff2c2a2d),
      child: TabBar(
        physics: const NeverScrollableScrollPhysics(),
        tabs: bottomTabBarController.tabs
            .map(
              (tab) => SizedBox(
                width: 1.sw / 4.5,
                height: 1.sh / 12,
                child: Tab(
                    icon: SvgPicture.asset(
                      "assets/svg/bottom_bar/${tab.imagePath}.svg",
                      width: 24,
                      height: 24,
                      colorFilter: ColorFilter.mode(
                          currentIndex ==
                                  bottomTabBarController.tabs.indexOf(tab)
                              ? Colors.orange
                              : Colors.white,
                          BlendMode.srcATop),
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
