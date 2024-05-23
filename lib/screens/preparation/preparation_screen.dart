import 'package:flutter/material.dart';
import 'package:flutter_running_demo/utils/navigator_key.dart';
import '../../config/config_export.dart';
import 'package:get/get.dart';
import '../../controllers/map_controller.dart';
import '../../widgets/custom_map_widget/custom_map_widget.dart';
import 'components/components_export.dart';
import 'data/list_top_route_model.dart';

class PreparationScreen extends StatefulWidget {
  const PreparationScreen({super.key});

  @override
  State<PreparationScreen> createState() => _PreparationScreenState();
}

class _PreparationScreenState extends State<PreparationScreen>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  late TabController _tabController;
  final mapController = Get.find<MapController>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: PreparationType.values.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final RxBool isRouteSelected = false.obs;
    final RxBool isRouteAdd = false.obs;
    return Stack(
      children: [
        CustomMapWidget(
          onMapCreate: (mapBoxMap) {
            mapController.onMapCreated(mapBoxMap);
            mapController.createTempTopRoutes();
          },
        ),
        Positioned(top: 40, child: HorizontalAnnotations()),
        Positioned(
          top: 150,
          right: 0,
          child: Obx(
            () => VerticalAnnotations(
              isRouteAdd: mapController.selectedRouteToAdd.value != null,
              isRouteSelected: isRouteSelected.value,
              onUndoPress: () {
                isRouteSelected.toggle();
                mapController.selectedRoute.value = null;
              },
              onCheckPress: () {
                isRouteSelected.toggle();
                isRouteAdd.toggle();
                mapController.selectRouteToAdd();
              },
              onClosePress: () => isRouteSelected.toggle(),
              onHandPress: () => isRouteSelected.toggle(),
              onAddUndoPress: () {
                isRouteAdd.value = isRouteSelected.value = false;
                mapController.selectedRouteToAdd.value = null;
                mapController.resetPointAndAnotation();
                mapController.createTempTopRoutes();
              },
              onPrepareRoutePressed: () {
                showModalBottomSheet(
                  context: NavigatorKeys.secondaryNavigatorKey.currentContext!,
                  isScrollControlled: true,
                  useRootNavigator: false,
                  backgroundColor: AppColors.sheetBackground,
                  builder: (context) => DraggableScrollableSheet(
                    expand: false,
                    maxChildSize: 0.9,
                    minChildSize: 0.25,
                    initialChildSize: 0.9,
                    builder: (context, scrollController) =>
                        SingleChildScrollView(
                      controller: scrollController,
                      child: PreparedRouteMapSheetWidget(
                        scrollController: scrollController,
                        scheduleRoutes: tempTopRoute.sublist(2, 4),
                        readyForAnytimeRoutes: tempTopRoute.sublist(3, 6),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Obx(() {
          return isRouteSelected.value
              ? RouteAddBottomSheet(
                  distance: mapController.selectedRoute.value!.distance
                      .toStringAsFixed(1),
                  elevation: '12',
                )
              : (isRouteAdd.value &&
                      mapController.selectedRouteToAdd.value != null
                  ? RouteSaveToFavoriteBottomSheet(mapController: mapController)
                  : PreparationScreenBottomSheet(
                      mapController: mapController,
                      tabController: _tabController,
                      onSelectedIndex: onSelectedIndex,
                    ));
        }),
      ],
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

  @override
  bool get wantKeepAlive => true;
}
