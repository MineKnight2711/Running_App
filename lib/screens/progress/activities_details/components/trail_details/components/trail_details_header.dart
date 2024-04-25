import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/colors.dart';
import '../../../../../../config/fonts.dart';

class TrailDetailsHeader extends StatelessWidget {
  final String title, date, place;
  final bool haveInfo;
  const TrailDetailsHeader({
    super.key,
    required this.title,
    required this.date,
    required this.place,
    required this.haveInfo,
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
                child: Image.asset(
                  "assets/images/actions/walk.png",
                  fit: BoxFit.contain,
                ),
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
                      title,
                      style: CustomGoogleFonts.roboto(
                          fontSize: 16.r, color: AppColors.white100),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Image.asset("assets/images/activities_details/people.png"),
                    const Spacer(),
                    haveInfo
                        ? Image.asset(
                            "assets/images/activities_details/info.png",
                            scale: 0.85,
                          )
                        : const SizedBox.shrink(),
                    SizedBox(
                      width: 5.w,
                    ),
                    Image.asset(
                      "assets/images/activities_details/share.png",
                      scale: 0.85,
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 0.8.sw,
                child: Row(
                  children: [
                    Text(
                      date,
                      style: CustomGoogleFonts.roboto(
                          fontSize: 12.r,
                          fontWeight: FontWeight.w300,
                          color: const Color(0xFFB4AEAB)),
                    ),
                    Flexible(
                      child: Text(
                        ' | $place',
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
