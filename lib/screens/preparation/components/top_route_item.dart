import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../config/config_export.dart';
import '../../../models/top_route_model/top_route_model.dart';

class RouteItemWidget extends StatelessWidget {
  final TopRouteModel route;
  const RouteItemWidget({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 60.h,
      margin: EdgeInsets.symmetric(vertical: 10.h),
      padding: EdgeInsets.only(bottom: 10.h),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFFFFFFFF), width: 0.5),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 0.18.sw,
            height: 0.18.sw,
            decoration: BoxDecoration(
              color: AppColors.basicActivitiesCard,
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
                "assets/svg/preparation/route_vector/${route.imagePath}.svg"),
          ),
          SizedBox(width: 10.w),
          SizedBox(
            width: 1.sw - (10.w + 0.18.sw) - 48,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        route.routeTitle,
                        overflow: TextOverflow.ellipsis,
                        style: CustomGoogleFonts.roboto(
                            fontSize: 16.r, color: AppColors.white100),
                      ),
                    ),
                    // const Spacer(),
                    SvgPicture.asset("assets/svg/preparation/public.svg"),
                    SizedBox(
                      width: 15.w,
                    ),
                    SvgPicture.asset(
                        "assets/svg/preparation/rpe/${getRpeSvgAsset(route.rpePoint)}.svg"),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "RPE",
                      style: CustomGoogleFonts.roboto(
                          fontSize: 16.r, color: AppColors.white100),
                    ),
                  ],
                ),
                Row(
                  children: [],
                ),
                Row(
                  children: [],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  String getRpeSvgAsset(int rpePoint) {
    String rpe;
    if (rpePoint == 10) {
      rpe = '10';
    } else if (rpePoint == 9) {
      rpe = '9';
    } else if (rpePoint >= 7 && rpePoint <= 8) {
      rpe = '7-8';
    } else if (rpePoint >= 4 && rpePoint <= 6) {
      rpe = '4-6';
    } else if (rpePoint >= 2 && rpePoint <= 3) {
      rpe = '2-3';
    } else if (rpePoint == 1) {
      rpe = '1';
    } else {
      rpe = 'Invalid RPE Point';
    }
    return rpe;
  }
}
