import 'dart:math';
import 'package:flutter/material.dart';
import '../../../.././config/config_export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../progress/details_route_screen/components/route_details_elevation_chart.dart';
import '../../../progress/details_route_screen/components/route_details_map_terrain.dart';

class RunFinished extends StatelessWidget {
  const RunFinished({super.key});

  @override
  Widget build(BuildContext context) {
    List<double> generateFakeData(int count) {
      final random = Random();
      return List.generate(
        count,
        (index) {
          if (index >= 0 && index <= 8 || index >= 13 && index <= 20) {
            return 5 + random.nextDouble() * (15 - 5);
          } else if (index >= 9 && index <= 12) {
            return 15 + random.nextDouble() * (25 - 15);
          } else {
            throw Exception('Index out of range');
          }
        },
      );
    }

    return Scaffold(
      body: Container(
        height: 1.sh,
        decoration: const BoxDecoration(
          color: Color(0xFF222222),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                'Running finished',
                style: CustomGoogleFonts.roboto(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: TextEditingController(),
                style:
                    CustomGoogleFonts.roboto(fontSize: 16, color: Colors.white),
                decoration: InputDecoration(
                    hintText: 'Name your route',
                    hintStyle: CustomGoogleFonts.roboto(
                        fontSize: 16, color: Colors.white)),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'How are you feeling now? Rate RPE',
                        style: CustomGoogleFonts.roboto(
                            fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset('assets/svg/preparation/rate_rpe/1.svg'),
                      SvgPicture.asset(
                          'assets/svg/preparation/rate_rpe/2-3.svg'),
                      SvgPicture.asset(
                          'assets/svg/preparation/rate_rpe/4-5.svg'),
                      SvgPicture.asset(
                          'assets/svg/preparation/rate_rpe/10.svg'),
                      SvgPicture.asset(
                          'assets/svg/preparation/rate_rpe/8-9.svg'),
                      SvgPicture.asset(
                          'assets/svg/preparation/rate_rpe/6-7.svg'),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const RouteDetailsMapAndTerrain(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                      "assets/svg/runing_finished_stastitic/route.svg"),
                  Text(
                    ' 1,6km',
                    style: CustomGoogleFonts.roboto(
                        color: Colors.white, fontSize: 14),
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                      "assets/svg/runing_finished_stastitic/time.svg"),
                  Text(
                    ' 2h 15p',
                    style: CustomGoogleFonts.roboto(
                        color: Colors.white, fontSize: 14),
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                      "assets/svg/runing_finished_stastitic/velocity.svg"),
                  Text(
                    ' 5.21/km',
                    style: CustomGoogleFonts.roboto(
                        color: Colors.white, fontSize: 14),
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                      "assets/svg/runing_finished_stastitic/pace.svg"),
                  Text(
                    ' 5m',
                    style: CustomGoogleFonts.roboto(
                        color: Colors.white, fontSize: 14),
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                      "assets/svg/runing_finished_stastitic/water_drop.svg"),
                  Text(
                    ' 32%',
                    style: CustomGoogleFonts.roboto(
                        color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
              RouteDetailsElevationChart(datas: generateFakeData(20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 22),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Discard',
                      style: CustomGoogleFonts.roboto(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.appButton,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.star, color: Colors.white),
                        const SizedBox(width: 8),
                        Text(
                          'Save to favorite',
                          style: CustomGoogleFonts.roboto(
                              fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
