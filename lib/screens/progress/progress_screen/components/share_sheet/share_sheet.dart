import 'package:flutter/material.dart';
import '../../../../../config/config_export.dart';
import '../../../../../models/route_model/route_model.dart';
import '../route_details/components/route_details_map.dart';
import 'share_sheet_options.dart';

class ShareSheet extends StatelessWidget {
  final RouteModel route;
  const ShareSheet({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: AppSpacings.sw(1),
          height: AppSpacings.sh(0.3),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: Image.asset("assets/images/activities_details/map.png")
                      .image,
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(12)),
          child: RouteDetailsMapWidget(
            haveRPE: false,
            titleInFooter: true,
            route: route,
          ),
        ),
        SizedBox(
          height: AppSpacings.cvs(24),
        ),
        ShareOption(
          image: "location_map",
          option: "Publish on running map",
          onTap: () {},
        ),
        SizedBox(
          height: AppSpacings.cvs(24),
        ),
        ShareOption(
          image: "g_logo_white",
          option: "Share to genki community",
          onTap: () {},
        ),
        SizedBox(
          height: AppSpacings.cvs(24),
        ),
        ShareOption(
          image: "more_option",
          option: "More option",
          onTap: () {},
        ),
      ],
    );
  }
}
