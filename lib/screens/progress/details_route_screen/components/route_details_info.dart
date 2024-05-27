import 'package:flutter/material.dart';
import 'package:flutter_running_demo/extensions/duration_extension.dart';
import 'package:flutter_running_demo/extensions/integer_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../config/config_export.dart';
import '../../../../models/route_model/route_model.dart';

class RouteDetailInfo extends StatelessWidget {
  final RouteModel route;
  const RouteDetailInfo({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.basicActivitiesCard),
      height: 110.h,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 5,
                child: Text(
                  route.title,
                  style: CustomGoogleFonts.roboto(
                    color: AppColors.white100,
                    fontSize: 16.r,
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Spacer(),
              SvgPicture.asset("assets/svg/preparation/public.svg"),
              SizedBox(
                width: 10.w,
              ),
              SvgPicture.asset(
                  "assets/svg/preparation/rpe/${route.rpe.getRpeSvgAsset()}.svg"),
              Text(
                " RPE",
                style: CustomGoogleFonts.roboto(
                  color: AppColors.white100,
                  fontSize: 16.r,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset("assets/svg/preparation/route.svg"),
              SizedBox(
                width: 5.w,
              ),
              Text(
                "${route.distance} km",
                style: CustomGoogleFonts.roboto(
                  color: AppColors.white100,
                  fontSize: 14.r,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                width: 50.w,
              ),
              SvgPicture.asset("assets/svg/preparation/time.svg"),
              SizedBox(
                width: 5.w,
              ),
              Text(
                route.time.durationToHour(),
                style: CustomGoogleFonts.roboto(
                  color: AppColors.white100,
                  fontSize: 14.r,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
