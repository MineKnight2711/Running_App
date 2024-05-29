import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../config/config_export.dart';
import 'components/components.dart';
import '../../../widgets/image_picker/image_picker.dart';
import '../../progress/details_route_screen/components/route_details_elevation_chart.dart';
import '../../progress/details_route_screen/components/route_details_map_terrain.dart';

class RunFinished extends GetView {
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
        height: AppSpacings.sh(1),
        decoration: const BoxDecoration(
          color: Color(0xFF222222),
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
              ImagePickerWidget(
                onImageSelected: (selectedImage) {},
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
                  const RpeRating(),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const RouteDetailsMapAndTerrain(),
              const StatisticIndex(),
              const SizedBox(
                height: 30,
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
                        const Icon(Icons.star_border, color: Colors.white),
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
