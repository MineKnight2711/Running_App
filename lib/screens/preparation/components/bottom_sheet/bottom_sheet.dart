import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/config_export.dart';
import 'package:flutter_running_demo/controllers/map_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../../../widgets/custom_draggable_sheet/custom_draggable_sheet.dart';
import 'components/components_export.dart';
import '../../data/list_top_route_model.dart';
import 'components/add_new/add_new_route_item_options.dart';

class PreparationScreenBottomSheet extends StatelessWidget {
  final MapController mapController;
  final TabController tabController;
  final Function(int)? onSelectedIndex;
  const PreparationScreenBottomSheet({
    super.key,
    required this.tabController,
    this.onSelectedIndex,
    required this.mapController,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> preTypes = [
      'Favorites',
      'Add-new',
      'Upcoming',
    ];
    return Align(
      alignment: Alignment.bottomCenter,
      child: CustomDraggableSheetWidget(
        grabberBottom: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PreparationTabbar(
              listButton: preTypes,
              tabController: tabController,
              onSelectedIndex: onSelectedIndex,
            ),
            SizedBox(height: AppSpacings.verticalSpacing10),
            const SheetGrabberTitle(),
            SizedBox(height: AppSpacings.verticalSpacing5),
          ],
        ),
        sheetBodyBuilder: (context, scrollController) {
          return TabBarView(
            controller: tabController,
            children: [
              RoutePreparationList(
                scrollController: scrollController,
                routes: tempTopRoute,
              ),
              Obx(() {
                return mapController.selectedRoute.value == null
                    ? const AddNewRouteActionGuideWidget()
                    : SingleChildScrollView(
                        child: RouteItemWidget(
                          showDivider: false,
                          route: mapController.selectedRoute.value!,
                          isSelected: true,
                          isSelectedWidget: const AddNewRouteItemOption(),
                        ),
                      );
              }),
              UpcomingListRoute(
                scrollController: scrollController,
                anyTimeRoutes: tempTopRoute.sublist(0, 2),
                byTimeRoutes: tempTopRoute.sublist(
                    tempTopRoute.length - 1, tempTopRoute.length),
              ),
            ],
          );
        },
      ),
    );
  }
}
