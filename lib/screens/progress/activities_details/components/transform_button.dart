import 'package:flutter/material.dart';
import 'package:flutter_running_demo/widgets/home_action_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/colors.dart';
import '../../../../config/fonts.dart';

class TransformButton extends StatelessWidget {
  final bool transForm;
  final String title, imageAsset;
  final VoidCallback onPressed;

  const TransformButton(
      {super.key,
      required this.transForm,
      required this.title,
      required this.onPressed,
      required this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return transForm
        ? ActionButton(imagePath: imageAsset, onTap: onPressed)
        : InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: onPressed,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.basicActivitiesCard,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              width: 130.w,
              height: 30.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    imageAsset,
                    // fit: BoxFit.fill,
                    scale: 1,
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Text(title,
                      style: CustomGoogleFonts.roboto(
                          fontSize: 14.r, color: AppColors.white100))
                ],
              ),
            ),
          );
  }
}
