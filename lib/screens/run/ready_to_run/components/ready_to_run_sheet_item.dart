import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/config_export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ReadyToRunSheetItem extends StatelessWidget {
  final String svgAssetsIcon;
  const ReadyToRunSheetItem({super.key, required this.svgAssetsIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      height: 25.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.basicActivitiesCard,
      ),
      padding: const EdgeInsets.all(5),
      child: SvgPicture.asset('assets/svg/ready_to_run/$svgAssetsIcon.svg'),
    );
  }
}
