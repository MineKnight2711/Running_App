import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_running_demo/config/config_export.dart';
import 'package:flutter_running_demo/screens/progress/activities_details/components/components.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RecordDropdown extends StatelessWidget {
  final double? horizontalButtonPadding, dropDownHeight;
  final String record, achievement;
  final IconData iconData;
  RecordDropdown({
    super.key,
    this.horizontalButtonPadding = 30,
    this.dropDownHeight = 200,
    required this.record,
    required this.achievement,
    required this.iconData,
  });
  final RxBool _isExpanded = false.obs;

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          InkWell(
            onTap: () => _isExpanded.value = !_isExpanded.value,
            child: Container(
              height: 35.h,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              margin:
                  EdgeInsets.symmetric(horizontal: horizontalButtonPadding!),
              decoration: BoxDecoration(
                color: AppColors.basicActivitiesCard,
                // border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(iconData, color: AppColors.white100),
                  SizedBox(width: 20.w),
                  Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: '$record - ',
                        style: CustomGoogleFonts.roboto(
                          fontSize: 16.r,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: achievement,
                        style: CustomGoogleFonts.roboto(
                          fontSize: 14.r,
                          color: const Color(0xFFB4AEAB),
                        ),
                      )
                    ]),
                    overflow: TextOverflow.ellipsis,
                  ),
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
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            margin: const EdgeInsets.symmetric(vertical: 10),
            height: _isExpanded.value ? dropDownHeight : 0,
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: TrailDetailsWidget(
                trail: trailTempList.first,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
