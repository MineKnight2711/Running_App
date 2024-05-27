import 'package:flutter/material.dart';
import 'package:flutter_running_demo/controllers/map_controller.dart';
import 'package:flutter_running_demo/screens/preparation/components/bottom_sheet/components/ready_to_run/components/run_music_bottom_sheet.dart';
import 'package:get/get.dart';
import '../../../../../../../config/config_export.dart';
import '../../../../../../../controllers/running_controller.dart';
import 'ready_to_run_sheet_go_button.dart';
import 'ready_to_run_sheet_item.dart';

class RunningButtons extends GetView<RunningController> {
  final String showMapButtonSvg;
  final Color showMapButtonColor;
  final MapController mapController;
  final VoidCallback onShowMapPressed;
  const RunningButtons({
    super.key,
    required this.onShowMapPressed,
    this.showMapButtonColor = AppColors.basicActivitiesCard,
    this.showMapButtonSvg = "show_map",
    required this.mapController,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AnimatedSlide(
              offset: controller.isRunning.value
                  ? const Offset(0, 0)
                  : const Offset(0, 5),
              duration: const Duration(milliseconds: 300),
              child: ReadyToRunSheetItem(
                svgAssetsIcon: "music",
                onItemTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => const RunMusicBottomSheet(),
                  );
                },
              ),
            ),
            ReadyToRunSheetGoButton(
              buttonText: controller.isRunning.value ? "Stop" : "Go",
              goButtonColor: controller.isRunning.value
                  ? AppColors.cancleButton
                  : AppColors.appButton,
              onGoPressed: () {
                controller.startStopwatch();
              },
            ),
            AnimatedSlide(
              offset: controller.isRunning.value
                  ? const Offset(0, 0)
                  : const Offset(0, 5),
              duration: const Duration(milliseconds: 300),
              child: ReadyToRunSheetItem(
                  itemBackGroundColor: showMapButtonColor,
                  svgAssetsIcon: showMapButtonSvg,
                  onItemTap: onShowMapPressed),
            ),
          ],
        ));
  }
}
