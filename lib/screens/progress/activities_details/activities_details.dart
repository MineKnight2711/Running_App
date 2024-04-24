import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_running_demo/config/fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../config/colors.dart';
import '../../../widgets/home_action_button.dart';
import 'components/transform_button.dart';
import 'trail_details/trail_details.dart';

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
                  SliverLayoutBuilder(
                    builder: (context, constraints) {
                      final isScrolledUnder =
                          (constraints.scrollOffset > 190.h - 50);

                      return SliverAppBar(
                        backgroundColor: AppColors.appTheme.colors.first,
                        expandedHeight: 180.h,
                        floating: true,
                        pinned: true,
                        collapsedHeight: 120.h,
                        flexibleSpace: FlexibleSpaceBar(
                          collapseMode: CollapseMode.pin,
                          titlePadding: EdgeInsets.symmetric(vertical: 50.w),
                          background: Stack(
                            children: [
                              // Content to move up and from bottom to right
                              Positioned(
                                left: 0,
                                bottom: 15,
                                right: 0,
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 600),
                                  curve: Curves.easeInOut,
                                  transform: Matrix4.translationValues(
                                    isScrolledUnder
                                        ? 0.141.sw
                                        : 0, // Move to the right when scrolled under
                                    isScrolledUnder
                                        ? -0.172.sh
                                        : 0, // Move up when scrolled under
                                    1,
                                  ),
                                  child: FractionalTranslation(
                                    translation: Offset(
                                      isScrolledUnder ? (335 / 1000000).sw : 0,
                                      isScrolledUnder ? (5 / 100000).sh : 0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        AnimatedScale(
                                          duration:
                                              const Duration(milliseconds: 500),
                                          scale: isScrolledUnder ? 0 : 1,
                                          child: TransformButton(
                                            transForm: isScrolledUnder,
                                            title: "Search",
                                            onPressed: () {},
                                            imageAsset:
                                                "assets/images/activities_details/search.png",
                                          ),
                                        ),
                                        SizedBox(
                                          width: isScrolledUnder ? 10.w : 20.w,
                                        ),
                                        AnimatedScale(
                                          duration:
                                              const Duration(milliseconds: 500),
                                          scale: isScrolledUnder ? 0 : 1,
                                          child: TransformButton(
                                            transForm: isScrolledUnder,
                                            title: "Chart",
                                            onPressed: () {},
                                            imageAsset:
                                                "assets/images/activities_details/chart.png",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        leading: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: AppColors.white100,
                          ),
                          onPressed: () {},
                        ),
                        actions: [
                          AnimatedScale(
                            duration: const Duration(milliseconds: 500),
                            scale: isScrolledUnder ? 1 : 0,
                            child: ActionButton(
                              imagePath:
                                  "assets/images/activities_details/search.png",
                              onTap: () {},
                            ),
                          ),
                          const SizedBox(width: 12),
                          AnimatedScale(
                            duration: const Duration(milliseconds: 500),
                            scale: isScrolledUnder ? 1 : 0,
                            child: ActionButton(
                              imagePath:
                                  "assets/images/activities_details/chart.png",
                              onTap: () {},
                            ),
                          ),
                          const SizedBox(width: 12),
                          ActionButton(
                            imagePath: "assets/images/home.png",
                            onTap: () {},
                          ),
                          const SizedBox(width: 12),
                        ],
                      );
                    },
                  ),
                ];
              },
              body: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.h),
                          child: const TrailDetailsWidget(),
                        );
                      },
                      childCount: 4,
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
    );
  }
}
