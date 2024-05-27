import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../config/config_export.dart';

class AddNewRouteItemOption extends StatelessWidget {
  final VoidCallback? onFavoritePressed, onAddPressed, onInfoPressed;
  const AddNewRouteItemOption({
    super.key,
    this.onFavoritePressed,
    this.onAddPressed,
    this.onInfoPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: AppSpacings.hs20 * 8,
        height: AppSpacings.vs10 * 4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColors.basicActivitiesCard),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: onFavoritePressed,
              child: SvgPicture.asset(
                  "assets/svg/preparation/route_item_options/star.svg"),
            ),
            SizedBox(width: AppSpacings.hs10),
            InkWell(
              onTap: onAddPressed,
              child: SvgPicture.asset(
                  "assets/svg/preparation/route_item_options/check.svg"),
            ),
            SizedBox(width: AppSpacings.hs10),
            InkWell(
              onTap: onInfoPressed,
              child: SvgPicture.asset(
                  "assets/svg/preparation/route_item_options/info.svg"),
            ),
          ],
        ),
      ),
    );
  }
}
