import 'package:flutter/material.dart';
import 'package:flutter_running_demo/utils/navigator_key.dart';
import 'package:flutter_running_demo/widgets/custom_bottom_sheet/custom_bottom_sheet.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../config/config_export.dart';
import 'components/components.dart';

class ProgressScreen extends GetView {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      decoration: const BoxDecoration(gradient: AppColors.appTheme),
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverHeader(
              onChartPress: () =>
                  AppRoutes.navigate(AppRoutes.performanceMetrics),
              onSearchPress: () {
                showModalBottomSheet(
                  context: NavigatorKeys.mainNavigatorKey.currentContext!,
                  isScrollControlled: true,
                  isDismissible: true,
                  builder: (c) {
                    return CustomBottomSheet(
                      sheetTitle: "Search",
                      sheetHeight: 0.55,
                      sheetBody: LayoutBuilder(
                        builder: (context, constraints) => AnimatedPadding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(NavigatorKeys
                                      .mainNavigatorKey.currentContext!)
                                  .viewInsets
                                  .bottom),
                          duration: const Duration(milliseconds: 150),
                          curve: Curves.easeOut,
                          child: SearchSheet(),
                        ),
                      ),
                    );
                  },
                );
              },
              onHomeTap: () => AppRoutes.navigate(AppRoutes.home),
            ),
          ];
        },
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final route = routeTempList[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: RouteDetailsWidget(
                      route: route,
                    ),
                  );
                },
                childCount: routeTempList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
