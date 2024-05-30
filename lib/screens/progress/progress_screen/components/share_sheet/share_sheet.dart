import 'package:flutter/material.dart';
import '../../../../../config/config_export.dart';
import '../../../../../models/route_model/route_model.dart';
import '../route_details/components/route_details_map.dart';

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

class ShareOption extends StatelessWidget {
  final String image, option;
  final VoidCallback onTap;
  const ShareOption({
    super.key,
    required this.image,
    required this.option,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        height: AppSpacings.cvs(40),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: const Color(0xFFFFFFFF).withOpacity(0.2),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/activities_details/$image.png",
            ),
            SizedBox(
              width: AppSpacings.chs(12),
            ),
            Text(
              option,
              style: CustomGoogleFonts.roboto(
                fontSize: AppFontSizes.size14,
                color: AppColors.white100,
              ),
            )
          ],
        ),
      ),
    );
  }
}
