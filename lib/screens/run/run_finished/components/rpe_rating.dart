import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class RpeRating extends StatelessWidget {
  final rpeThresholds = const ["1", "2-3", "4-5", "6-7", "8-9", "10"];

  const RpeRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final selectedThreshold = "".obs;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: rpeThresholds.map((threshold) {
        return GestureDetector(
          onTap: () {
            selectedThreshold.value = threshold;
          },
          child: Obx(
            () => Container(
              decoration: BoxDecoration(
                color: selectedThreshold.value == threshold
                    ? const Color(0xfff26322).withOpacity(0.3)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SvgPicture.asset(
                'assets/svg/preparation/rate_rpe/$threshold.svg',
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
