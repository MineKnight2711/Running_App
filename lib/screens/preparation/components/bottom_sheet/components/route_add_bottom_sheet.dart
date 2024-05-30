import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../config/config_export.dart';
import '../../../../../widgets/custom_draggable_sheet/custom_draggable_sheet.dart';

class RouteAddBottomSheet extends StatelessWidget {
  final VoidCallback onCompletePressed;
  final String distance, elevation;
  const RouteAddBottomSheet({
    super.key,
    required this.distance,
    required this.elevation,
    required this.onCompletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomDraggableSheet(
      inititalSize: 0.28,
      maxSize: 0.28,
      minSize: 0.28,
      child: (context, scrollController) => AddBottomSheetGrabberBottom(
        onCompletePressed: onCompletePressed,
        distance: distance,
        elevation: elevation,
      ),
    );
  }
}

class AddBottomSheetGrabberBottom extends StatelessWidget {
  final VoidCallback onCompletePressed;
  const AddBottomSheetGrabberBottom({
    super.key,
    required this.distance,
    required this.elevation,
    required this.onCompletePressed,
  });

  final String distance;
  final String elevation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppSpacings.hs20, vertical: AppSpacings.vs15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 135.w,
                height: 60.h,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: AppColors.basicActivitiesCard,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total distance",
                      style: CustomGoogleFonts.roboto(
                          fontSize: AppFontSizes.size14,
                          color: TextColor.white,
                          fontWeight: FontWeight.w200),
                    ),
                    Text(
                      "$distance km",
                      style: CustomGoogleFonts.roboto(
                          fontSize: AppFontSizes.size18,
                          color: TextColor.white),
                    ),
                  ],
                ),
              ),
              Container(
                width: 135.w,
                height: 60.h,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: AppColors.basicActivitiesCard,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Elevation",
                      style: CustomGoogleFonts.roboto(
                          fontSize: AppFontSizes.size14,
                          color: TextColor.white,
                          fontWeight: FontWeight.w200),
                    ),
                    Text(
                      "$elevation m",
                      style: CustomGoogleFonts.roboto(
                          fontSize: AppFontSizes.size18,
                          color: TextColor.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: AppSpacings.vs20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.appButton,
              padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 105),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: onCompletePressed,
            child: Text(
              "Complete",
              style: CustomGoogleFonts.roboto(
                  fontSize: AppFontSizes.size16,
                  fontWeight: FontWeight.w600,
                  color: TextColor.white),
            ),
          ),
        ],
      ),
    );
  }
}
