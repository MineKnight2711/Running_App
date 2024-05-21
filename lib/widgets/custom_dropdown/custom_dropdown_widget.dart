import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/config_export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomDropdownWidget extends StatelessWidget {
  final double horizontalButtonPadding, dropDownHeight;
  final String title, subtitle;
  final Widget? dropDownWidget;
  final IconData? iconData;
  CustomDropdownWidget({
    super.key,
    this.horizontalButtonPadding = 30,
    this.dropDownHeight = 200,
    required this.title,
    this.dropDownWidget,
    this.iconData,
    this.subtitle = "",
  });
  final RxBool _isExpanded = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () => _isExpanded.value = !_isExpanded.value,
            child: Container(
              height: 35.h,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              margin: EdgeInsets.symmetric(horizontal: horizontalButtonPadding),
              decoration: BoxDecoration(
                color: AppColors.basicActivitiesCard,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  iconData != null
                      ? Icon(
                          iconData,
                          color: Colors.white,
                        )
                      : const SizedBox.shrink(),
                  SizedBox(width: 20.w),
                  Text(
                    title,
                    style: CustomGoogleFonts.roboto(
                      fontSize: 16.r,
                      color: Colors.white,
                    ),
                  ),
                  subtitle.isNotEmpty
                      ? Text(
                          " - $subtitle",
                          style: CustomGoogleFonts.roboto(
                            fontSize: 16.r,
                            color: Colors.white,
                          ),
                        )
                      : const SizedBox.shrink(),
                  const Spacer(),
                  AnimatedRotation(
                    turns: _isExpanded.value ? 0.25 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: AppColors.white100,
                    ),
                  ),
                ],
              ),
            ),
          ),
          dropDownWidget != null
              ? AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  height: _isExpanded.value ? dropDownHeight : 0,
                  curve: Curves.easeInOutCubic,
                  child: _isExpanded.value ? dropDownWidget : dropDownWidget,
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
