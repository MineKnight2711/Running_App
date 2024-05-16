import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/fonts.dart';
import '../../../../../../models/route_model/route_model.dart';
import 'route_details_footer.dart';

class RouteDetailsMapWidget extends StatelessWidget {
  final RouteModel route;
  final bool? haveRPE, titleInFooter;
  const RouteDetailsMapWidget({
    super.key,
    this.haveRPE = true,
    this.titleInFooter = false,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 8,
          left: 8,
          child: SizedBox(
            width: 30.w,
            height: 40.h,
            child:
                Image.asset("assets/images/activities_details/g_logo_bw.png"),
          ),
        ),
        haveRPE!
            ? Positioned(
                top: 8,
                right: 8,
                child: Container(
                  width: 75.w,
                  height: 38.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: (() {
                      int color = 0;
                      switch (route.rpe) {
                        case 1:
                          color = 0x4D00D688;

                        case 2:
                          color = 0x4D76B5FF;

                        default:
                          color = 0x4DF0EC94;
                      }
                      return Color(color);
                    })(),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      (() {
                        String image = "";
                        switch (route.rpe) {
                          case 1:
                            image = "green_rpe";

                          case 2:
                            image = "blue_rpe";

                          default:
                            image = "yellow_rpe";
                        }
                        return Image.asset(
                            "assets/images/activities_details/$image.png");
                      })(),
                      Text(
                        "RPE",
                        style: CustomGoogleFonts.roboto(
                          fontSize: 12.r,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : const SizedBox.shrink(),
        Positioned(
          top: 70,
          left: 50,
          child: Image.asset("assets/images/activities_details/vertor.png"),
        ),
        Positioned(
          top: 168,
          left: 382,
          child: GestureDetector(
            onTap: () {},
            child: CircleAvatar(
              backgroundColor: const Color(0xA62F2828),
              child: Image.asset("assets/images/activities_details/image.png"),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: RouteDetailsFooter(
            titleInFooter: titleInFooter,
            route: route,
          ),
        ),
      ],
    );
  }
}
