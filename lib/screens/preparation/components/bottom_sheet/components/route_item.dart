import 'package:flutter/material.dart';
import 'package:flutter_running_demo/extensions/duration_extension.dart';
import 'package:flutter_running_demo/extensions/integer_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../config/config_export.dart';
import '../../../../../models/route_model/route_model.dart';

class RouteItemWidget extends StatelessWidget {
  final bool isSelected, showDivider, haveSelectedBackGround, haveRunnerAttemps;
  final Widget isSelectedWidget;
  final RouteModel route;
  const RouteItemWidget(
      {super.key,
      required this.route,
      required this.isSelected,
      this.isSelectedWidget = const SizedBox.shrink(),
      this.showDivider = true,
      this.haveSelectedBackGround = true,
      this.haveRunnerAttemps = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 1.sw,
          height: isSelected ? 134.h : 74.h,
          padding: isSelected
              ? EdgeInsets.symmetric(vertical: 5.h)
              : EdgeInsets.zero,
          margin: EdgeInsets.symmetric(vertical: 5.h),
          alignment: Alignment.center,
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
                        color: haveSelectedBackGround
                            ? (isSelected
                                ? AppColors.basicActivitiesCard
                                : Colors.transparent)
                            : Colors.transparent,
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
                                  route.title,
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
                                  "assets/svg/preparation/rpe/${route.rpe.getRpeSvgAsset()}.svg"),
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
                          haveRunnerAttemps
                              ? Row(
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
                              : const SizedBox.shrink()
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
                isSelected ? isSelectedWidget : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
        showDivider
            ? Divider(
                height: 5.h,
                thickness: 0.4,
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
