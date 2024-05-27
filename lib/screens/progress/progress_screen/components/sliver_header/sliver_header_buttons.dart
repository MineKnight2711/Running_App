import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../transform_button.dart';

class SliverHeaderButtons extends StatelessWidget {
  final VoidCallback onSearchPress;
  final VoidCallback onChartPress;
  const SliverHeaderButtons({
    super.key,
    required this.isScrolledUnder,
    required this.onSearchPress,
    required this.onChartPress,
  });

  final bool isScrolledUnder;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
              isScrolledUnder ? -0.172.sh : 0, // Move up when scrolled under
              1,
            ),
            child: FractionalTranslation(
              translation: Offset(
                isScrolledUnder ? (335 / 1000000).sw : 0,
                isScrolledUnder ? (5 / 100000).sh : 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedScale(
                    duration: const Duration(milliseconds: 500),
                    scale: isScrolledUnder ? 0 : 1,
                    child: TransformButton(
                      transForm: isScrolledUnder,
                      title: "Search",
                      onPressed: onSearchPress,
                      imageAsset: "assets/images/activities_details/search.png",
                    ),
                  ),
                  SizedBox(
                    width: isScrolledUnder ? 10.w : 20.w,
                  ),
                  AnimatedScale(
                    duration: const Duration(milliseconds: 500),
                    scale: isScrolledUnder ? 0 : 1,
                    child: TransformButton(
                      transForm: isScrolledUnder,
                      title: "Chart",
                      onPressed: onChartPress,
                      imageAsset: "assets/images/activities_details/chart.png",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
