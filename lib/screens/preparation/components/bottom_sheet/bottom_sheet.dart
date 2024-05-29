import 'package:flutter/material.dart';
import 'package:flutter_running_demo/controllers/map_controller.dart';
import 'package:flutter_running_demo/controllers/running_controller.dart';
import 'package:get/get.dart';
import 'components/components_export.dart';

class ScreenBottomSheets extends GetView<RunningController> {
  final BuildContext preparationScreenContext;
  final TabController tabController;
  ScreenBottomSheets(
      {super.key,
      required this.tabController,
      required this.preparationScreenContext});
  final mapController = Get.find<MapController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return mapController.isRouteSelected.value &&
                mapController.selectedRoute.value != null
            ? RouteAddBottomSheet(
                onCompletePressed: () {
                  mapController.isRouteSelected.toggle();
                  mapController.isRouteAdd.toggle();
                  mapController.isReadyToRun.value = true;
                  mapController.resetPointAndAnotation();
                  mapController.centerCameraOnCoordinate(
                      mapController.selectedRoute.value?.longitude ?? 0,
                      mapController.selectedRoute.value?.latitude ?? 0,
                      anotationPng: "position");
                  controller.selectedRoute.value =
                      mapController.selectedRoute.value;
                  mapController.selectedRoute.value = null;

                  showBottomSheet(
                    context: preparationScreenContext,
                    builder: (c) => ReadyToRunSheet(
                      secondaryNavigatorContext: context,
                    ),
                  );
                },
                distance: mapController.selectedRoute.value!.distance
                    .toStringAsFixed(1),
                elevation: '12',
              )
            : (mapController.isRouteAdd.value &&
                    mapController.selectedRouteToAdd.value != null
                ? RouteSaveToFavoriteBottomSheet(mapController: mapController)
                : PreparationBottomSheet(
                    mapController: mapController,
                    tabController: tabController,
                    onSelectedIndex: onSelectedIndex,
                  ));
      },
    );
  }

  onSelectedIndex(int index) {
    switch (index) {
      case 0:
        currentPreparationType.value = PreparationType.favorites;
        break;
      case 1:
        currentPreparationType.value = PreparationType.addNew;
        break;
      case 2:
        currentPreparationType.value = PreparationType.upcoming;
        break;
      default:
        break;
    }
  }
}
