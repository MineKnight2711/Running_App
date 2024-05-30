import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../models/route_model/route_model.dart';
import 'components/route_details_header.dart';
import 'components/route_details_map.dart';

class RouteDetailsWidget extends StatelessWidget {
  final RouteModel route;

  const RouteDetailsWidget({
    super.key,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RouteDetailsHeader(
          route: route,
        ),
        Stack(
          children: [
            Container(
              width: 1.sw,
              height: 0.3.sh,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image:
                        Image.asset("assets/images/activities_details/map.png")
                            .image,
                    fit: BoxFit.cover),
              ),
              child: RouteDetailsMapWidget(route: route),
            ),
          ],
        )
      ],
    );
  }
}
