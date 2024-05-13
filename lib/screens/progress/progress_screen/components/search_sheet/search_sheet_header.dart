import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/fonts.dart';

class SearchSheetHeader extends StatelessWidget {
  const SearchSheetHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Search",
          textAlign: TextAlign.center,
          style: CustomGoogleFonts.roboto(
              fontSize: 18.r, color: AppColors.white100),
        ),
        SizedBox(
          width: 40.w,
        ),
      ],
    );
  }
}
