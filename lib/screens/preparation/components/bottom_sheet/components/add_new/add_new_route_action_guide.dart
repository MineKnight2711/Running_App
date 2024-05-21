import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../config/config_export.dart';

class AddNewRouteActionGuideWidget extends StatelessWidget {
  const AddNewRouteActionGuideWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            horizontalTitleGap: 10,
            leading: SvgPicture.asset(
              "assets/svg/preparation/add_new_route/run.svg",
            ),
            title: Text(
              "Press running man icon to check existing route and save to your favorite or upcoming run",
              style: CustomGoogleFonts.roboto(
                fontSize: AppFontSizes.size14,
                color: AppColors.white100,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            horizontalTitleGap: 10,
            leading: SvgPicture.asset(
                "assets/svg/preparation/add_new_route/hand.svg"),
            title: Text(
              "Press and hold a point on the map or press the hand icon to add waypoints along the route",
              style: CustomGoogleFonts.roboto(
                fontSize: AppFontSizes.size14,
                color: AppColors.white100,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            horizontalTitleGap: 10,
            leading: SvgPicture.asset(
                "assets/svg/preparation/add_new_route/pen.svg"),
            title: Text(
              "Use the pen icon to directly draw path",
              style: CustomGoogleFonts.roboto(
                fontSize: AppFontSizes.size14,
                color: AppColors.white100,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
