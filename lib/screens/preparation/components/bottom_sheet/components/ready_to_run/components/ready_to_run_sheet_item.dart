import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/config_export.dart';
import 'package:flutter_svg/svg.dart';

class ReadyToRunSheetItem extends StatelessWidget {
  final String svgAssetsIcon;
  final VoidCallback? onItemTap;
  final Color itemBackGroundColor;
  final String? label;
  const ReadyToRunSheetItem({
    super.key,
    required this.svgAssetsIcon,
    this.onItemTap,
    this.itemBackGroundColor = AppColors.basicActivitiesCard,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onItemTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: label == null ? AppSpacings.hs25 * 2 : AppSpacings.hs25 * 3,
        height: AppSpacings.vs25 * 1.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: label == null ? itemBackGroundColor : null,
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(5),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: label != null
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/svg/ready_to_run/$svgAssetsIcon.svg'),
              if (label != null)
                Text(
                  " $label",
                  style: CustomGoogleFonts.roboto(
                    fontSize: AppFontSizes.size14,
                    color: AppColors.white100,
                    fontWeight: FontWeight.w400,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
