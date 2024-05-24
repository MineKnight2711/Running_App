import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/fonts.dart';

class ConfirmAlertDialogs extends StatelessWidget {
  final String title, confirmButtonText, iconSvgPath;
  final Widget content;
  final Color? confirmButtonColor;
  final LinearGradient? confirmButtonColorGradient;
  const ConfirmAlertDialogs({
    super.key,
    required this.title,
    required this.content,
    required this.confirmButtonText,
    this.confirmButtonColor,
    this.confirmButtonColorGradient,
    required this.iconSvgPath,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.sheetBackground,
      icon: SvgPicture.asset(
          "assets/svg/preparation/alert_dialog/$iconSvgPath.svg"),
      title: Text(
        title,
        style: CustomGoogleFonts.roboto(
          fontSize: 20.r,
          color: AppColors.white100,
          fontWeight: FontWeight.w700,
        ),
      ),
      content: content,
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        Column(
          children: [
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: 300.w,
                height: 45.h,
                decoration: BoxDecoration(
                  color: confirmButtonColorGradient != null
                      ? null
                      : (confirmButtonColor ?? AppColors.cancleButton),
                  gradient: confirmButtonColorGradient,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Text(
                  confirmButtonText,
                  style: CustomGoogleFonts.roboto(
                      fontSize: 16.r,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            TextButton(
              style: TextButton.styleFrom(
                minimumSize: Size(0.4.sw, 0.04.sh),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: CustomGoogleFonts.roboto(
                    color: TextColor.primaryText, fontSize: 16.r),
              ),
            ),
          ],
        )
      ],
    );
  }
}
