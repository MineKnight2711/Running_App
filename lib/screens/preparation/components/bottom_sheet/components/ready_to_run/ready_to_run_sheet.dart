import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/config_export.dart';
import 'package:flutter_running_demo/controllers/preparation_map_controller.dart';
import 'package:flutter_running_demo/extensions/duration_extension.dart';
import 'package:flutter_running_demo/screens/preparation/components/bottom_sheet/components/ready_to_run/components/ready_to_run_sheet_item.dart';
import 'package:flutter_running_demo/screens/preparation/components/bottom_sheet/components/map_settings/map_setting_sheet.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'components/ready_to_run_sheet_go_button.dart';

class ReadyToRunSheet extends StatelessWidget {
  final BuildContext secondaryNavigatorContext;
  ReadyToRunSheet({
    super.key,
    required this.secondaryNavigatorContext,
  });
  final listItem = const [
    'road',
    'road_speaker',
    'heart',
    'sos',
    'music',
  ];
  final mapController = Get.find<MapController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.25.sh,
      width: 1.sw,
      decoration: const BoxDecoration(
        color: Color(0xFF222222),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ReadyToRunSheetItem(
                  label: mapController.isRunning.value
                      ? "${mapController.selectedRoute.value?.distance} m"
                      : null,
                  svgAssetsIcon:
                      mapController.isRunning.value ? "road_16" : "road",
                  onItemTap: mapController.isRunning.value
                      ? () {}
                      : () {
                          Navigator.pop(context);
                          showBottomSheet(
                            context: secondaryNavigatorContext,
                            builder: (context) {
                              return const RunMapSettingsSheet();
                            },
                          );
                        },
                ),
                ReadyToRunSheetItem(
                  label: mapController.isRunning.value
                      ? "${mapController.selectedRoute.value?.time.durationToString()} m"
                      : null,
                  svgAssetsIcon: mapController.isRunning.value
                      ? "time_16"
                      : "road_speaker",
                  onItemTap: () {},
                ),
                ReadyToRunSheetItem(
                  label: mapController.isRunning.value
                      ? "${mapController.selectedRoute.value?.pace}/km"
                      : null,
                  svgAssetsIcon:
                      mapController.isRunning.value ? "velocity_16" : "heart",
                  onItemTap: () {},
                ),
                ReadyToRunSheetItem(
                  label: mapController.isRunning.value
                      ? "${mapController.selectedRoute.value?.ascent}"
                      : null,
                  svgAssetsIcon:
                      mapController.isRunning.value ? "heart_16" : "sos",
                  onItemTap: () {},
                ),
                mapController.isRunning.value
                    ? const SizedBox.shrink()
                    : ReadyToRunSheetItem(
                        svgAssetsIcon: "music",
                        onItemTap: () {},
                      ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AnimatedSlide(
                    offset: mapController.isRunning.value
                        ? const Offset(0, 0)
                        : const Offset(0, 5),
                    duration: const Duration(milliseconds: 300),
                    child: ReadyToRunSheetItem(
                      svgAssetsIcon: "music",
                      onItemTap: () {},
                    ),
                  ),
                  ReadyToRunSheetGoButton(
                    buttonText: mapController.isRunning.value ? "Stop" : "Go",
                    goButtonColor: mapController.isRunning.value
                        ? AppColors.cancleButton
                        : AppColors.appButton,
                    onGoPressed: () {
                      mapController.isRunning.toggle();
                    },
                  ),
                  AnimatedSlide(
                    offset: mapController.isRunning.value
                        ? const Offset(0, 0)
                        : const Offset(0, 5),
                    duration: const Duration(milliseconds: 300),
                    child: ReadyToRunSheetItem(
                      svgAssetsIcon: "show_map",
                      onItemTap: () {},
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
