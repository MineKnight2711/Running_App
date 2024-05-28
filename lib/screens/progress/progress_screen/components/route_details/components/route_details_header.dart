import 'package:flutter/material.dart';
import 'package:flutter_running_demo/extensions/datetime_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../config/colors.dart';
import '../../../../../../config/fonts.dart';
import '../../../../../../models/route_model/route_model.dart';
import '../../share_sheet/share_sheet.dart';

class RouteDetailsHeader extends StatelessWidget {
  final RouteModel route;

  const RouteDetailsHeader({
    super.key,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.h,
      color: AppColors.basicActivitiesCard,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 35.w,
            height: 35.w,
            margin: EdgeInsets.symmetric(vertical: 10.w),
            decoration: BoxDecoration(
              color: const Color(0x0DFFFFFF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: SizedBox(
                width: 25.w,
                height: 25.w,
                child: SvgPicture.asset("assets/svg/walk.svg"),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 0.8.sw,
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      route.title,
                      style: CustomGoogleFonts.roboto(
                          fontSize: 16.r, color: AppColors.white100),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    SvgPicture.asset("assets/svg/people.svg"),
                    const Spacer(),
                    route.haveInfo
                        ? SvgPicture.asset("assets/svg/info.svg")
                        : const SizedBox.shrink(),
                    SizedBox(
                      width: 10.w,
                    ),
                    GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            backgroundColor: const Color(0xff222222),
                            builder: (context) {
                              return ShareSheet(
                                route: route,
                              );
                            },
                          );
                        },
                        child: SvgPicture.asset("assets/svg/share.svg"))
                  ],
                ),
              ),
              SizedBox(
                width: 0.8.sw,
                child: Row(
                  children: [
                    Text(
                      route.date.dateTimeFormat(),
                      style: CustomGoogleFonts.roboto(
                          fontSize: 12.r,
                          fontWeight: FontWeight.w300,
                          color: const Color(0xFFB4AEAB)),
                    ),
                    Flexible(
                      child: Text(
                        ' | ${route.place}',
                        overflow: TextOverflow.ellipsis,
                        style: CustomGoogleFonts.roboto(
                          fontSize: 12.r,
                          fontWeight: FontWeight.w300,
                          color: const Color(0xFFB4AEAB),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
