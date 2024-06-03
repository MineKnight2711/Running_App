import 'package:flutter/material.dart';
import 'package:flutter_running_demo/extensions/duration_extension.dart';
import 'package:flutter_running_demo/extensions/integer_extension.dart';
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
          width: AppSpacings.sw(1),
          height: isSelected ? AppSpacings.cvs(134) : AppSpacings.cvs(74),
          padding: isSelected
              ? EdgeInsets.symmetric(vertical: AppSpacings.vs5)
              : EdgeInsets.zero,
          margin: EdgeInsets.symmetric(vertical: AppSpacings.vs5),
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
                      width: AppSpacings.sw(0.2),
                      height: AppSpacings.sw(0.2),
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
                    SizedBox(width: AppSpacings.chs(10)),
                    SizedBox(
                      width: AppSpacings.sw(1) -
                          (AppSpacings.chs(10) + AppSpacings.sw(0.2)) -
                          48,
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
                                      fontSize: AppFontSizes.size16,
                                      color: AppColors.white100),
                                ),
                              ),
                              // const Spacer(),
                              SvgPicture.asset(
                                  "assets/svg/preparation/public.svg"),
                              SizedBox(
                                width: AppSpacings.chs(15),
                              ),
                              SvgPicture.asset(
                                  "assets/svg/preparation/rpe/${route.rpe.getRpeSvgAsset()}.svg"),
                              SizedBox(
                                width: AppSpacings.chs(5),
                              ),
                              Text(
                                "RPE",
                                style: CustomGoogleFonts.roboto(
                                  fontSize: AppFontSizes.size16,
                                  color: AppColors.white100,
                                ),
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
                                    fontSize: AppFontSizes.size14,
                                    color: TextColor.secondaryText),
                              ),
                              SizedBox(
                                width: AppSpacings.chs(60),
                              ),
                              SvgPicture.asset(
                                  "assets/svg/preparation/time.svg"),
                              Text(
                                " ${route.time.durationToString()}",
                                style: CustomGoogleFonts.roboto(
                                    fontSize: AppFontSizes.size16,
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
                                          fontSize: AppFontSizes.size16,
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
                        height: AppSpacings.cvs(10),
                      )
                    : const SizedBox.shrink(),
                isSelected ? isSelectedWidget : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
        showDivider
            ? Divider(
                height: AppSpacings.cvs(5),
                thickness: 0.4,
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
