import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/config_export.dart';
import 'package:flutter_running_demo/models/runner_model.dart/runner_model.dart';
import 'package:flutter_running_demo/widgets/app_bar.dart';
import 'package:get/get.dart';
import '../../../models/route_model/route_model.dart';
import 'components/components_export.dart';
import 'components/route_details_top_runner_list.dart';

class DetailsRouteScreen extends GetView {
  final RouteModel route = Get.arguments;
  DetailsRouteScreen({super.key});

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

    final topRunners = [
      RunnerModel(
        id: 1,
        name: "Nguyen The Anh",
        dateRecord: DateTime(2023, 6, 8),
        time: const Duration(minutes: 45, seconds: 32),
        record: 2.35,
      ),
      RunnerModel(
        id: 2,
        name: "Natalia Lee",
        dateRecord: DateTime(2023, 7, 15),
        time: const Duration(minutes: 50, seconds: 21),
        record: 3.01,
      ),
      RunnerModel(
        id: 3,
        name: "Lucalita",
        dateRecord: DateTime(2023, 7, 15),
        time: const Duration(minutes: 50, seconds: 21),
        record: 3.01,
      ),
    ];
    return Scaffold(
      appBar: CustomAppBar(
        onBackPress: () => Get.back(),
        title: "Detail route information",
        showHomeButton: false,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        padding: EdgeInsets.only(
            top: AppSpacings.vs20 * 4,
            left: AppSpacings.hs20,
            right: AppSpacings.hs20),
        // margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(gradient: AppColors.appTheme),
        child: SingleChildScrollView(
          child: Column(
            children: [
              RouteDetailInfo(route: route),
              SizedBox(height: AppSpacings.vs10),
              RouteDetailsImages(route: route),
              const RouteDetailsMapAndTerrain(),
              RouteDetailsElevationChart(datas: generateFakeData(20)),
              SizedBox(height: AppSpacings.vs30),
              const RouteDetailsGenkiCommunityChart(),
              SizedBox(height: AppSpacings.vs20),
              Container(
                width: AppSpacings.sw(1),
                height: AppSpacings.cvs(70),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.basicActivitiesCard,
                ),
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  "Most people run between 45m and 2h35m on this route.",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: CustomGoogleFonts.roboto(
                    color: TextColor.white,
                    fontSize: AppFontSizes.size14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              SizedBox(height: AppSpacings.vs20),
              RouteDetailsTopRunnerList(topRunners: topRunners),
              SizedBox(height: AppSpacings.vs30),
            ],
          ),
        ),
      ),
    );
  }
}
