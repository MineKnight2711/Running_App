import 'package:flutter/material.dart';
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
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  backgroundColor: const Color(0xff222222),
                  builder: (context) {
                    return const SearchSheet();
                  },
                );
              },
              onHomeTap: () => AppRoutes.navigateReplace(AppRoutes.home),
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
