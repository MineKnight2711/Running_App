import 'package:flutter/material.dart';

import '../../../config/spacings.dart';
import '../../../widgets/custom_draggable_sheet/custom_draggable_sheet.dart';
import '../components/components_export.dart';
import '../data/list_top_route_model.dart';

class PreparationScreenBottomSheet extends StatelessWidget {
  final TabController tabController;
  final Function(int)? onSelectedIndex;
  const PreparationScreenBottomSheet(
      {super.key, required this.tabController, this.onSelectedIndex});

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
              const AddNewRouteActionGuideWidget(),
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
