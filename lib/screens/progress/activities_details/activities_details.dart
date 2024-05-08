import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../config/config_export.dart';
import './components/components.dart';

class ActivitiesDetailsScreen extends GetView {
  const ActivitiesDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        clipBehavior: Clip.none,
        decoration: const BoxDecoration(gradient: AppColors.appTheme),
        child: Stack(
          children: [
            NestedScrollView(
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
                    onHomeTap: () => AppRoutes.navigate(AppRoutes.home),
                  ),
                ];
              },
              body: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final trail = trailTempList[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: TrailDetailsWidget(
                            trail: trail,
                          ),
                        );
                      },
                      childCount: trailTempList.length,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0.07.sh,
              child: SizedBox(
                width: 1.sw,
                child: Image.asset(
                  "assets/images/activities_details/activities_details_banner.png",
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
