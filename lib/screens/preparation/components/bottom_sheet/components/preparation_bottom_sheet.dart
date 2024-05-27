import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/config_export.dart';
import 'package:flutter_running_demo/controllers/preparation_map_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../../../../widgets/custom_draggable_sheet/custom_draggable_sheet.dart';
import 'components_export.dart';
import '../../../data/list_top_route_model.dart';
import 'add_new/add_new_route_item_options.dart';

class PreparationBottomSheet extends StatelessWidget {
  final MapController mapController;
  final TabController tabController;
  final Function(int)? onSelectedIndex;
  const PreparationBottomSheet({
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
    return CustomDraggableSheetWidget(
      inititalSize: 0.25,
      maxSize: 0.85,
      minSize: 0.25,
      grabberBottom: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PreparationTabbar(
            listButton: preTypes,
            tabController: tabController,
            onSelectedIndex: onSelectedIndex,
          ),
          SizedBox(height: AppSpacings.vs10),
          const SheetGrabberTitle(),
          SizedBox(height: AppSpacings.vs5),
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
    );
  }
}
