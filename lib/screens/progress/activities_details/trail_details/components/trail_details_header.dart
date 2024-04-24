import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/colors.dart';
import '../../../../../config/fonts.dart';

class TrailDetailsHeader extends StatelessWidget {
  const TrailDetailsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      color: Colors.grey[800],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 42.w,
            height: 52.w,
            margin: EdgeInsets.symmetric(vertical: 10.w),
            decoration: BoxDecoration(
              color: const Color(0x0DFFFFFF),
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.contain,
                image: Image.asset(
                  "assets/images/actions/walk.png",
                ).image,
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
                      "Dam sen Trail",
                      style: CustomGoogleFonts.roboto(
                          fontSize: 16.r, color: AppColors.white100),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Image.asset("assets/images/activities_details/people.png"),
                    const Spacer(),
                    Image.asset(
                      "assets/images/activities_details/info.png",
                      scale: 0.85,
                    ),
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
              Row(
                children: [
                  Text(
                    '8/16/2023 | 6:45 AM',
                    style: CustomGoogleFonts.roboto(
                        fontSize: 12.r,
                        fontWeight: FontWeight.w300,
                        color: const Color(0xFFB4AEAB)),
                  ),
                  Text(
                    '| District 11, HCMC',
                    style: CustomGoogleFonts.roboto(
                      fontSize: 12.r,
                      fontWeight: FontWeight.w300,
                      color: const Color(0xFFB4AEAB),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
