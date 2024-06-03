import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/config_export.dart';

class CustomBottomSheet extends StatelessWidget {
  final bool showSheetTitle;
  final String? sheetTitle;
  final double? sheetHeight;
  final Widget? sheetBody, sheetFooter;
  const CustomBottomSheet({
    super.key,
    this.showSheetTitle = true,
    this.sheetHeight,
    this.sheetTitle,
    this.sheetBody,
    this.sheetFooter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sheetHeight != null
          ? AppSpacings.sh(sheetHeight!)
          : AppSpacings.sh(0.85),
      decoration: const BoxDecoration(
        color: Color(0xFF222222),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      padding: EdgeInsets.only(
        left: AppSpacings.chs(10),
        right: AppSpacings.chs(10),
        bottom: MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showSheetTitle)
            const SizedBox(
              height: 10,
            )
          else
            const SizedBox.shrink(),
          if (showSheetTitle)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  sheetTitle ?? 'Bottom Sheet Title',
                  style: CustomGoogleFonts.roboto(
                    fontSize: AppFontSizes.size18,
                    color: AppColors.white100,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(CupertinoIcons.xmark),
                  color: AppColors.white100,
                ),
              ],
            )
          else
            const SizedBox.shrink(),
          if (showSheetTitle)
            const Divider(
              thickness: 0.5,
              height: 20,
            )
          else
            const SizedBox.shrink(),
          sheetBody ?? const SizedBox.shrink(),
          const SizedBox(
            height: 20,
          ),
          sheetFooter ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}

class CustomBottomSheetButton extends StatelessWidget {
  final String buttonLabel;
  const CustomBottomSheetButton({super.key, required this.buttonLabel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSpacings.sw(1),
      height: AppSpacings.cvs(40),
      child: ElevatedButton(
        onPressed: () {
          // Xử lý khi nhấn nút "Complete"
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.appButton,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          buttonLabel,
          style: CustomGoogleFonts.roboto(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
