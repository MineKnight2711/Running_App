import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/config_export.dart';

class CustomBottomSheet extends StatelessWidget {
  final String sheetTitle;
  final double? sheetHeight;
  final Widget? sheetBody, sheetFooter;
  const CustomBottomSheet({
    super.key,
    this.sheetHeight,
    required this.sheetTitle,
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sheetTitle,
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
          ),
          const Divider(
            thickness: 0.5,
            height: 32,
          ),
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
