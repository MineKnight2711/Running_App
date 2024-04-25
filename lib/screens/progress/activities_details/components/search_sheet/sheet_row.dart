import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/colors.dart';
import '../../../../../config/fonts.dart';

class SheetRow extends StatelessWidget {
  final IconData? iconData;
  final String? rowTitle;
  final double? spaceBetween;
  final Widget trailing;
  const SheetRow(
      {super.key,
      this.iconData,
      this.rowTitle,
      required this.trailing,
      this.spaceBetween});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        iconData != null
            ? Icon(
                iconData,
                color: AppColors.white100,
                size: 24.r,
              )
            : const SizedBox.shrink(),
        rowTitle != null
            ? Text(
                rowTitle!,
                textAlign: TextAlign.center,
                style: CustomGoogleFonts.roboto(
                    fontSize: 16.r, color: AppColors.white100),
              )
            : const SizedBox.shrink(),
        SizedBox(
          width: (spaceBetween ?? 40).w,
        ),
        trailing
      ],
    );
  }
}
