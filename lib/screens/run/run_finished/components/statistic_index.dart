import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../config/config_export.dart';

class StatisticIndex extends StatelessWidget {
  const StatisticIndex({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset("assets/svg/runing_finished_stastitic/route.svg"),
        Text(
          ' 1,6km',
          style: CustomGoogleFonts.roboto(
              color: Colors.white, fontSize: AppFontSizes.size14),
        ),
        const Spacer(),
        SvgPicture.asset("assets/svg/runing_finished_stastitic/time.svg"),
        Text(
          ' 2h 15p',
          style: CustomGoogleFonts.roboto(
              color: Colors.white, fontSize: AppFontSizes.size14),
        ),
        const Spacer(),
        SvgPicture.asset("assets/svg/runing_finished_stastitic/velocity.svg"),
        Text(
          ' 5.21/km',
          style: CustomGoogleFonts.roboto(
              color: Colors.white, fontSize: AppFontSizes.size14),
        ),
        const Spacer(),
        SvgPicture.asset("assets/svg/runing_finished_stastitic/pace.svg"),
        Text(
          ' 5m',
          style: CustomGoogleFonts.roboto(
              color: Colors.white, fontSize: AppFontSizes.size14),
        ),
        const Spacer(),
        SvgPicture.asset("assets/svg/runing_finished_stastitic/water_drop.svg"),
        Text(
          ' 32%',
          style: CustomGoogleFonts.roboto(
              color: Colors.white, fontSize: AppFontSizes.size14),
        ),
      ],
    );
  }
}
