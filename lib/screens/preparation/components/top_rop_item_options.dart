import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../config/colors.dart';

class RouteItemOption extends StatelessWidget {
  const RouteItemOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(
        color: AppColors.basicActivitiesCard,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {},
            child: SvgPicture.asset(
                "assets/svg/preparation/route_item_options/check.svg"),
          ),
          InkWell(
            onTap: () {},
            child: SvgPicture.asset(
                "assets/svg/preparation/route_item_options/info.svg"),
          ),
          InkWell(
            onTap: () {},
            child: SvgPicture.asset(
                "assets/svg/preparation/route_item_options/share.svg"),
          ),
          InkWell(
            onTap: () {},
            child: SvgPicture.asset(
                "assets/svg/preparation/route_item_options/edit.svg"),
          ),
          InkWell(
            radius: 20,
            splashColor: Colors.redAccent,
            onTap: () {},
            child: SvgPicture.asset(
                "assets/svg/preparation/route_item_options/delete.svg"),
          ),
        ],
      ),
    );
  }
}
