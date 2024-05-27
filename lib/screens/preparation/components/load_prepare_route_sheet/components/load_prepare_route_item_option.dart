import '../../../../../config/config_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PreparedRouteItemActionWidget extends StatelessWidget {
  final bool haveCancleButton;
  final VoidCallback? onLoadPress, onCancelPress;
  const PreparedRouteItemActionWidget({
    super.key,
    this.haveCancleButton = true,
    this.onLoadPress,
    this.onCancelPress,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          haveCancleButton
              ? InkWell(
                  onTap: onCancelPress,
                  child: Container(
                    height: 30.h,
                    width: 120.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.appButton)),
                    alignment: Alignment.center,
                    child: Text(
                      "Cancel",
                      style: CustomGoogleFonts.roboto(
                          fontSize: AppFontSizes.size12,
                          color: AppColors.appButton),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
          SizedBox(
            width: 10.w,
          ),
          InkWell(
            onTap: onLoadPress,
            child: Container(
              height: 30.h,
              width: 120.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.appButton)),
              alignment: Alignment.center,
              child: Text(
                "Load",
                style: CustomGoogleFonts.roboto(
                    fontSize: AppFontSizes.size12, color: AppColors.appButton),
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          )
        ],
      ),
    );
  }
}
