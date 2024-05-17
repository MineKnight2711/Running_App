import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../config/config_export.dart';

class WarningAlertDialogs extends StatelessWidget {
  final String title, iconSvgPath;
  final Widget content;
  final Color? confirmButtonColor;
  final LinearGradient? confirmButtonColorGradient;
  const WarningAlertDialogs({
    super.key,
    required this.title,
    this.confirmButtonColor,
    this.confirmButtonColorGradient,
    required this.iconSvgPath,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.sheetBackground,
      icon: SvgPicture.asset(
        iconSvgPath,
        width: 80,
      ),
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
        ElevatedButton(
          style: TextButton.styleFrom(
            minimumSize: Size(0.4.sw, 0.05.sh),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'OK',
            style: CustomGoogleFonts.roboto(
                color: TextColor.primaryText, fontSize: 16.r),
          ),
        )
      ],
    );
  }
}
