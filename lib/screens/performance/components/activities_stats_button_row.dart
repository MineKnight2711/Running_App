import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/config_export.dart';
import 'package:flutter_running_demo/screens/performance/components/period_button_row.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ActivityStatsRow extends StatelessWidget {
  final List<String> listButton;
  final double size;
  final Function(int)? onSelectedIndex;

  const ActivityStatsRow(
      {super.key,
      required this.listButton,
      required this.size,
      this.onSelectedIndex});

  @override
  Widget build(BuildContext context) {
    final RxInt selectedIndex = 0.obs;
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      // margin: EdgeInsets.symmetric(horizontal: 5.w),
      width: 1.sw,
      height: 35.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: listButton
            .asMap()
            .entries
            .map(
              (entry) => Obx(
                () => PillButton(
                  size: size,
                  textColor: selectedIndex.value == entry.key
                      ? AppColors.white100
                      : Colors.black,
                  buttonBackgroundColor: selectedIndex.value == entry.key
                      ? const Color(0xfff26322)
                      : AppColors.white100,
                  buttonText: entry.value,
                  isSelected: selectedIndex.value == entry.key,
                  onPressed: () {
                    selectedIndex.value = entry.key;
                    if (onSelectedIndex != null) {
                      onSelectedIndex!(selectedIndex.value);
                    }
                  },
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
