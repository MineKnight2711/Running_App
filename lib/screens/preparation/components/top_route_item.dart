import 'package:flutter/material.dart';
import 'package:flutter_running_demo/extensions/duration_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../config/config_export.dart';
import '../../../models/top_route_model/top_route_model.dart';
import 'top_rop_item_options.dart';

class RouteItemWidget extends StatelessWidget {
  final bool isSelected;
  final TopRouteModel route;
  const RouteItemWidget(
      {super.key, required this.route, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 1.sw,
          height: isSelected ? 130.h : 80.h,
          padding: isSelected
              ? EdgeInsets.symmetric(vertical: 5.h)
              : EdgeInsets.zero,
          margin: EdgeInsets.symmetric(vertical: 5.h),
          decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.basicActivitiesCard
                  : Colors.transparent,
              borderRadius: isSelected ? BorderRadius.circular(20) : null),
          child: AnimatedScale(
            duration: const Duration(milliseconds: 500),
            scale: isSelected ? 0.95 : 1,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 0.2.sw,
                      height: 0.2.sw,
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
                      width: 1.sw - (10.w + 0.2.sw) - 48,
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
                                      fontSize: 16.r,
                                      color: AppColors.white100),
                                ),
                              ),
                              // const Spacer(),
                              SvgPicture.asset(
                                  "assets/svg/preparation/public.svg"),
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
                            children: [
                              SvgPicture.asset(
                                  "assets/svg/preparation/route.svg"),
                              Text(
                                " ${route.distance.toStringAsFixed(1)}",
                                style: CustomGoogleFonts.roboto(
                                    fontSize: 14.r,
                                    color: TextColor.secondaryText),
                              ),
                              SizedBox(
                                width: 60.w,
                              ),
                              SvgPicture.asset(
                                  "assets/svg/preparation/time.svg"),
                              Text(
                                " ${route.time.durationToString()}",
                                style: CustomGoogleFonts.roboto(
                                    fontSize: 16.r,
                                    color: TextColor.secondaryText),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                  "assets/svg/preparation/run.svg"),
                              Text(
                                " ${route.attemps} runners attempted",
                                style: CustomGoogleFonts.roboto(
                                    fontSize: 16.r,
                                    color: TextColor.secondaryText),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                isSelected
                    ? SizedBox(
                        height: 10.h,
                      )
                    : const SizedBox.shrink(),
                isSelected ? const RouteItemOption() : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
        const Divider(
          height: 0,
          thickness: 0.3,
        ),
      ],
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
