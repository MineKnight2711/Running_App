import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/config_export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PeriodButtonRow extends StatefulWidget {
  final List<String> listButton;
  const PeriodButtonRow({super.key, required this.listButton});

  @override
  PeriodButtonRowState createState() => PeriodButtonRowState();
}

class PeriodButtonRowState extends State<PeriodButtonRow> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0x33FFFFFF), width: 1),
          borderRadius: BorderRadius.circular(50)),
      width: 1.sw,
      height: 35.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: widget.listButton
            .asMap()
            .entries
            .map(
              (entry) => Row(
                children: [
                  PillButton(
                    size: 2,
                    buttonBackgroundColor: selectedIndex == entry.key
                        ? const Color(0xfff26322)
                        : AppColors.transparent,
                    buttonText: entry.value,
                    isSelected: selectedIndex == entry.key,
                    onPressed: () {
                      setState(() {
                        selectedIndex = entry.key;
                      });
                    },
                  ),
                  if (entry.key != widget.listButton.length - 1)
                    Container(
                      width: 1.w,
                      height: 18.h,
                      margin: EdgeInsets.symmetric(horizontal: 8.w),
                      color: AppColors.basicActivitiesCard,
                    )
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}

class PillButton extends StatelessWidget {
  final String buttonText;
  final bool isSelected;
  final VoidCallback onPressed;
  final double size;
  final Color? textColor, buttonBackgroundColor;
  const PillButton({
    super.key,
    required this.buttonText,
    required this.isSelected,
    required this.onPressed,
    required this.size,
    this.textColor = AppColors.white100,
    this.buttonBackgroundColor = AppColors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    final buttonWidth = (size / 2) * 90;
    final buttonHeight = buttonWidth / 3.5;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: buttonHeight.h,
        width: buttonWidth.w,
        alignment: Alignment.center,
        // padding: EdgeInsets.symmetric(horizontal: 8.w),
        margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
        decoration: BoxDecoration(
          color: buttonBackgroundColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(buttonText,
            style: CustomGoogleFonts.roboto(
                fontSize: (size / 2) * 14.r, color: textColor)),
      ),
    );
  }
}
