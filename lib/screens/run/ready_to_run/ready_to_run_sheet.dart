import 'package:flutter/material.dart';

import 'package:flutter_running_demo/screens/run/ready_to_run/components/ready_to_run_sheet_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components/ready_to_run_sheet_go_button.dart';

class ReadyToRunSheet extends StatelessWidget {
  const ReadyToRunSheet({super.key});
  final listItem = const [
    'road',
    'road_speaker',
    'heart',
    'sos',
    'music',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.2.sh,
      width: 1.sw,
      decoration: const BoxDecoration(
        color: Color(0xFF222222),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: listItem
                  .map((item) => ReadyToRunSheetItem(svgAssetsIcon: item))
                  .toList()),
          const SizedBox(height: 20),
          const ReadyToRunSheetGoButton(),
        ],
      ),
    );
  }
}
