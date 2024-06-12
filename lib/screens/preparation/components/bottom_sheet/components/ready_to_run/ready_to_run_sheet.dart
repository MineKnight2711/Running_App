import 'package:flutter/material.dart';
import 'package:flutter_running_demo/controllers/map_controller.dart';
import 'package:flutter_running_demo/controllers/running_controller.dart';
import 'package:flutter_running_demo/utils/navigator_key.dart';
import 'package:flutter_running_demo/widgets/custom_bottom_sheet/custom_bottom_sheet.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../../../config/config_export.dart';
import 'components.dart';

class ReadyToRunSheet extends GetView<RunningController> {
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
    return PopScope(
      canPop: controller.runningSheetCanPop.value,
      onPopInvoked: (didPop) {
        if (NavigatorKeys.mainNavigatorKey.currentState!.canPop()) {
          Logger().i(
              "mainNavigatorKey was popped, the Ready to run sheet will pop");
        }
      },
      child: Container(
        height: AppSpacings.sh(0.3),
        width: AppSpacings.sw(1),
        decoration: const BoxDecoration(
          color: AppColors.sheetBackground,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReadyToRunSheetItem(
                    label: controller.isRunning.value
                        ? "${controller.selectedRoute.value?.distance} m"
                        : null,
                    svgAssetsIcon:
                        controller.isRunning.value ? "road_16" : "road",
                    onItemTap: controller.isRunning.value
                        ? () {}
                        : () {
                            Navigator.pop(context);
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: secondaryNavigatorContext,
                              builder: (context) => const CustomBottomSheet(
                                sheetHeight: 0.85,
                                sheetTitle: "Map Settings",
                                sheetBody: RunMapSettingsSheet(),
                                sheetFooter: CustomBottomSheetButton(
                                  buttonLabel: "Done",
                                ),
                              ),
                            ).whenComplete(
                              () => showBottomSheet(
                                enableDrag: controller.runningSheetCanPop.value,
                                context: NavigatorKeys
                                    .secondaryNavigatorKey.currentContext!,
                                builder: (context) => this,
                              ),
                            );
                          },
                  ),
                  Obx(
                    () => ReadyToRunSheetItem(
                      label: controller.isRunning.value
                          ? "${controller.elapsedTimeString} "
                          : null,
                      svgAssetsIcon: controller.isRunning.value
                          ? "time_16"
                          : "road_speaker",
                      onItemTap: !controller.isRunning.value
                          ? () {
                              Navigator.pop(context);
                              showModalBottomSheet(
                                isScrollControlled: true,
                                context: secondaryNavigatorContext,
                                builder: (context) => const CustomBottomSheet(
                                  sheetHeight: 0.85,
                                  sheetTitle: "Audio Guidance",
                                  sheetBody: AudioGuidance(),
                                  sheetFooter: CustomBottomSheetButton(
                                    buttonLabel: "Done",
                                  ),
                                ),
                              ).whenComplete(
                                () => showBottomSheet(
                                  enableDrag:
                                      controller.runningSheetCanPop.value,
                                  context: NavigatorKeys
                                      .secondaryNavigatorKey.currentContext!,
                                  builder: (context) => this,
                                ),
                              );
                            }
                          : () {},
                    ),
                  ),
                  ReadyToRunSheetItem(
                    label: controller.isRunning.value
                        ? "${controller.selectedRoute.value?.pace}/km"
                        : null,
                    svgAssetsIcon:
                        controller.isRunning.value ? "velocity_16" : "heart",
                    onItemTap: !controller.isRunning.value
                        ? () {
                            Navigator.pop(context);
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: secondaryNavigatorContext,
                              builder: (context) => const CustomBottomSheet(
                                sheetHeight: 0.85,
                                sheetTitle: "Sensor Status",
                                sheetBody: SensorStatus(),
                              ),
                            ).whenComplete(
                              () => showBottomSheet(
                                enableDrag: controller.runningSheetCanPop.value,
                                context: NavigatorKeys
                                    .secondaryNavigatorKey.currentContext!,
                                builder: (context) => this,
                              ),
                            );
                          }
                        : () {},
                  ),
                  ReadyToRunSheetItem(
                    label: controller.isRunning.value
                        ? "${controller.selectedRoute.value?.ascent}"
                        : null,
                    svgAssetsIcon:
                        controller.isRunning.value ? "heart_16" : "sos",
                    onItemTap: !controller.isRunning.value
                        ? () {
                            Navigator.pop(context);
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: secondaryNavigatorContext,
                              builder: (context) => const CustomBottomSheet(
                                sheetHeight: 0.85,
                                sheetTitle: "Sending location for safety",
                                sheetBody: SendingLocation(),
                                sheetFooter: CustomBottomSheetButton(
                                  buttonLabel: "Done",
                                ),
                              ),
                            ).whenComplete(
                              () => showBottomSheet(
                                enableDrag: controller.runningSheetCanPop.value,
                                context: NavigatorKeys
                                    .secondaryNavigatorKey.currentContext!,
                                builder: (context) => this,
                              ),
                            );
                          }
                        : () {},
                  ),
                  controller.isRunning.value
                      ? const SizedBox.shrink()
                      : ReadyToRunSheetItem(
                          svgAssetsIcon: "music",
                          onItemTap: !controller.isRunning.value
                              ? () {
                                  Navigator.pop(context);
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: secondaryNavigatorContext,
                                    builder: (context) =>
                                        const CustomBottomSheet(
                                      sheetHeight: 0.85,
                                      sheetTitle: "Authorize music provider",
                                      sheetBody: AuthorizeMusicProvider(),
                                      sheetFooter: CustomBottomSheetButton(
                                        buttonLabel: "Agree",
                                      ),
                                    ),
                                  ).whenComplete(
                                    () => showBottomSheet(
                                      enableDrag:
                                          controller.runningSheetCanPop.value,
                                      context: NavigatorKeys
                                          .secondaryNavigatorKey
                                          .currentContext!,
                                      builder: (context) => this,
                                    ),
                                  );
                                }
                              : () {},
                        ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Hero(
              tag: "running_buttons",
              child: Material(
                type: MaterialType.transparency,
                child: RunningButtons(
                  showMapButtonColor: const Color(0xfff26322).withOpacity(0.3),
                  mapController: mapController,
                  onShowMapPressed: () =>
                      AppRoutes.navigate(AppRoutes.runShowClock),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
