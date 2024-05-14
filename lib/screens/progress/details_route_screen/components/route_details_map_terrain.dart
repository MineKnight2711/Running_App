import 'package:flutter/material.dart';
import '../../../../config/config_export.dart';
import '../../../../widgets/orange_oval.dart';

class RouteDetailsMapAndTerrain extends StatelessWidget {
  const RouteDetailsMapAndTerrain({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: AppSpacings.verticalSpacing10),
        Text(
          "Map & Terrain",
          style: CustomGoogleFonts.roboto(
              fontSize: AppFontSizes.size18,
              fontWeight: FontWeight.w700,
              color: TextColor.white),
        ),
        SizedBox(height: AppSpacings.horizontalSpacing10),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            width: AppSpacings.widthByScreenWidth(1),
            height: AppSpacings.heightByScreenHeight(0.3),
            child: Column(
              children: [
                Image.asset(
                  fit: BoxFit.cover,
                  "assets/images/details_route_images/map_terrain.png",
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: AppColors.basicActivitiesCard,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(12),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: AppSpacings.customVerticalSpacing(50),
                  child: Row(
                    children: [
                      const OrangeOval(
                        size: 0.05,
                      ),
                      Text(
                        "  Dirt and Rock",
                        style: CustomGoogleFonts.roboto(
                            fontSize: AppFontSizes.size14,
                            fontWeight: FontWeight.w400,
                            color: TextColor.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
