import 'package:flutter/material.dart';
import 'package:flutter_running_demo/controllers/preparation_map_controller.dart';
import 'package:get/get.dart';
import 'components/components_export.dart';

class ScreenBottomSheets extends StatelessWidget {
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
        return mapController.isRouteSelected.value
            ? RouteAddBottomSheet(
                onCompletePressed: () {
                  mapController.isRouteSelected.toggle();
                  mapController.isRouteAdd.toggle();
                  mapController.isReadyToRun.value = true;
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
