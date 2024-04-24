import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/temp.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../config/colors.dart';
import 'components/bottom_bar.dart';
import 'components/search_sheet.dart';
import 'components/sliver_header/sliver_header.dart';
import 'components/trail_details/trail_details.dart';

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
                    onChartPress: () {},
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
                          return SearchSheet();
                        },
                      );
                    },
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
                            title: trail.title,
                            date: trail.date,
                            place: trail.place,
                            haveInfo: trail.haveInfo,
                            distance: trail.distance,
                            totalTime: trail.totalTime,
                            pace: trail.pace,
                            ascent: trail.ascent,
                            calories: trail.calories,
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
              top: 60.h,
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
      bottomNavigationBar: const BottomBar(),
    );
  }
}
