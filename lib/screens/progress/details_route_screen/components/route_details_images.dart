import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/config_export.dart';
import '../../../../models/top_route_model/top_route_model.dart';

class RouteDetailsImages extends StatelessWidget {
  final TopRouteModel route;
  const RouteDetailsImages({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Photo",
              style: CustomGoogleFonts.roboto(
                  fontSize: 18.r,
                  fontWeight: FontWeight.w700,
                  color: TextColor.white),
            ),
            Text(
              "${route.images.length} photos",
              style: CustomGoogleFonts.roboto(
                  fontSize: 14.r,
                  fontWeight: FontWeight.w400,
                  color: TextColor.primaryText),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: 100.h,
          width: 1.sw,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: route.images
                .map((image) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Image.asset(
                          "assets/images/details_route_images/$image.png"),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
