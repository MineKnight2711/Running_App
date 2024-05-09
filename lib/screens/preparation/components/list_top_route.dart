import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../config/config_export.dart';
import '../../../models/top_route_model/top_route_model.dart';
import 'top_route_item.dart';

class ListTopRoutes extends StatelessWidget {
  final List<TopRouteModel> topRoutes;
  const ListTopRoutes({
    super.key,
    required this.topRoutes,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Top ${topRoutes.length} routes",
            style: CustomGoogleFonts.roboto(
              fontSize: 16.r,
              color: Colors.white,
            ),
          ),
          Column(
              children: topRoutes
                  .map((route) => RouteItemWidget(
                        route: route,
                      ))
                  .toList()),
          SizedBox(
            height: 16.h,
          ),
        ],
      ),
    );
  }
}
