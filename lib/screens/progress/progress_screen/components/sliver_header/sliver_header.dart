import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/config_export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../config/colors.dart';
import '../../../../../widgets/home_action_button.dart';
import 'sliver_header_buttons.dart';

class SliverHeader extends StatelessWidget {
  final VoidCallback onSearchPress;
  final VoidCallback onChartPress;
  final VoidCallback onHomeTap;
  const SliverHeader({
    super.key,
    required this.onSearchPress,
    required this.onChartPress,
    required this.onHomeTap,
  });

  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(
      builder: (context, constraints) {
        final isScrolledUnder = (constraints.scrollOffset > 165.h);

        return SliverAppBar(
          backgroundColor: AppColors.appTheme.colors.first,
          expandedHeight: 165.h,
          floating: true,
          pinned: true,
          collapsedHeight: 105.h,
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            background: SliverHeaderButtons(
              isScrolledUnder: isScrolledUnder,
              onChartPress: onChartPress,
              onSearchPress: onSearchPress,
            ),
            // centerTitle: ,
            titlePadding: isScrolledUnder
                ? EdgeInsets.zero
                : EdgeInsets.only(bottom: 50.h),
            title: AnimatedSlide(
              duration: const Duration(milliseconds: 500),
              offset:
                  isScrolledUnder ? const Offset(0, 0.15) : const Offset(0, 0),
              child: SizedBox(
                width: 1.sw,
                child: Image.asset(
                  "assets/images/activities_details/activities_details_banner.png",
                  fit: BoxFit.cover,
                ),
              ),
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
                  imagePath: "assets/images/activities_details/search.png",
                  onTap: onSearchPress),
            ),
            const SizedBox(width: 12),
            AnimatedScale(
              duration: const Duration(milliseconds: 500),
              scale: isScrolledUnder ? 1 : 0,
              child: ActionButton(
                imagePath: "assets/images/activities_details/chart.png",
                onTap: onChartPress,
              ),
            ),
            const SizedBox(width: 12),
            ActionButton(
              imagePath: "assets/images/home.png",
              onTap: onHomeTap,
            ),
            const SizedBox(width: 12),
          ],
        );
      },
    );
  }
}
