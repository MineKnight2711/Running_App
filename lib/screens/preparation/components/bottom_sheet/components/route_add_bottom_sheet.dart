import 'package:flutter/material.dart';
import 'package:flutter_running_demo/widgets/custom_bottom_sheet/custom_bottom_sheet.dart';
import '../../../../../config/config_export.dart';

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
    return CustomBottomSheet(
      showSheetTitle: false,
      sheetHeight: 0.24,
      sheetBody: AddBottomSheet(
        onCompletePressed: onCompletePressed,
        distance: distance,
        elevation: elevation,
      ),
    );
  }
}

class AddBottomSheet extends StatelessWidget {
  final VoidCallback onCompletePressed;
  const AddBottomSheet({
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
                width: AppSpacings.chs(135),
                height: AppSpacings.cvs(60),
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
                width: AppSpacings.chs(135),
                height: AppSpacings.cvs(60),
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
          SizedBox(
            height: AppSpacings.vs30 * 1.2,
            width: AppSpacings.sw(1),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.appButton,
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
          ),
        ],
      ),
    );
  }
}
