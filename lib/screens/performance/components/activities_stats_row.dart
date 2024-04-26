import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/config_export.dart';
import 'package:flutter_running_demo/screens/performance/components/period_button_row.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivityStatsRow extends StatefulWidget {
  final List<String> listButton;
  const ActivityStatsRow({super.key, required this.listButton});

  @override
  State<ActivityStatsRow> createState() => _ActivityStatsRowState();
}

class _ActivityStatsRowState extends State<ActivityStatsRow> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      // margin: EdgeInsets.symmetric(horizontal: 5.w),
      width: 1.sw,
      height: 35.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: widget.listButton
            .asMap()
            .entries
            .map(
              (entry) => SizedBox(
                height: 35.h,
                child: PillButton(
                  size: 1.65,
                  textColor: selectedIndex == entry.key
                      ? AppColors.white100
                      : Colors.black,
                  buttonBackgroundColor: selectedIndex == entry.key
                      ? const Color(0xfff26322)
                      : AppColors.white100,
                  buttonText: entry.value,
                  isSelected: selectedIndex == entry.key,
                  onPressed: () {
                    setState(() {
                      selectedIndex = entry.key;
                    });
                  },
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
