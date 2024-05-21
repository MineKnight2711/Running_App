import 'dart:math';
import 'package:dotted_border/dotted_border.dart';
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
            top: AppSpacings.verticalSpacing20 * 4,
            left: AppSpacings.horizontalSpacing20,
            right: AppSpacings.horizontalSpacing20),
        // margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(gradient: AppColors.appTheme),
        child: SingleChildScrollView(
          child: Column(
            children: [
              RouteDetailInfo(route: route),
              SizedBox(height: AppSpacings.verticalSpacing10),
              RouteDetailsImages(route: route),
              const RouteDetailsMapAndTerrain(),
              RouteDetailsElevationChart(datas: generateFakeData(20)),
              SizedBox(height: AppSpacings.verticalSpacing30),
              const RouteDetailsGenkiCommunityChart(),
              SizedBox(height: AppSpacings.verticalSpacing20),
              Container(
                width: AppSpacings.widthByScreenWidth(1),
                height: AppSpacings.customVerticalSpacing(70),
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
              SizedBox(height: AppSpacings.verticalSpacing20),
              RouteDetailsTopRunnerList(topRunners: topRunners),
              SizedBox(height: AppSpacings.verticalSpacing30),
              DottedBorder(
                radius: Radius.circular(20),
                padding: EdgeInsets.zero,
                borderType: BorderType.RRect,
                color: const Color(0xFFFFFFFF).withOpacity(0.2),
                strokeWidth: 1.5,
                dashPattern: [10, 5],
                child: Container(
                  width: 400,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFFFFFFF).withOpacity(0.2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
