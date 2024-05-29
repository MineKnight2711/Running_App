import 'package:flutter/material.dart';
import 'package:flutter_running_demo/controllers/running_controller.dart';
import 'package:flutter_running_demo/screens/preparation/components/bottom_sheet/components/sheet_grabber_title.dart';
import 'package:flutter_running_demo/utils/navigator_key.dart';
import 'package:logger/logger.dart';
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
  final runningController = Get.put(RunningController());

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
    return Scaffold(
      body: Stack(
        children: [
          CustomMapWidget(
            onTapListener: (coordinate) {
              mapController.selectDirection(coordinate);
              Logger().i("Coordinate: ${coordinate.x}, ${coordinate.y}");
            },
            onMapCreate: (mapBoxMap) {
              mapController.onMapCreated(mapBoxMap);
              mapController.createTempTopRoutes();
            },
          ),
          Obx(() {
            return mapController.isReadyToRun.value
                ? Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: ReadyToRunHeader(
                      onClosePressed: () {
                        runningController.selectedRoute.value = null;
                        mapController.isReadyToRun.value = false;
                        mapController.createTempTopRoutes();
                        if (NavigatorKeys.mainNavigatorKey.currentState!
                                .canPop() &&
                            mapController.isReadyToRun.value == false) {
                          NavigatorKeys.mainNavigatorKey.currentState!.pop();
                        }
                      },
                    ),
                  )
                : Positioned(top: 40, child: HorizontalAnnotations());
          }),
          Positioned(
            top: 150,
            right: 0,
            child: Obx(
              () => VerticalAnnotations(
                isRouteAdd: mapController.selectedRouteToAdd.value != null,
                isRouteSelected: mapController.isRouteSelected.value,
                showEditButton: runningController.selectedRoute.value == null,
                onCompassPress: () => mapController.changeMapDirection(),
                onViewModePress: () => mapController.changeMapStyle(),
                onTargetPress: () => AppRoutes.navigate(AppRoutes.runfinished),
                onUndoPress: () {
                  mapController.isRouteSelected.toggle();
                  mapController.selectedRoute.value = null;
                  mapController.createTempTopRoutes();
                },
                onRotateMapPressed: () => mapController.changeMapDirection(),
                onChangeStylePressed: () => mapController.changeMapStyle(),
                onCheckPress: () {
                  mapController.isRouteSelected.toggle();
                  mapController.isRouteAdd.toggle();
                  mapController.selectRouteToAdd();
                },
                onClosePress: () => mapController.isRouteSelected.toggle(),
                onHandPress: () {
                  mapController.resetPointAndAnotation();
                  mapController.isRouteSelected.toggle();
                  mapController.centerCameraOnCoordinate(
                      mapController.selectedRoute.value?.longitude ?? 0,
                      mapController.selectedRoute.value?.latitude ?? 0,
                      anotationPng: "position");
                },
                onAddUndoPress: () {
                  mapController.isRouteAdd.value =
                      mapController.isRouteSelected.value = false;
                  mapController.selectedRouteToAdd.value = null;
                  mapController.resetPointAndAnotation();
                  mapController.createTempTopRoutes();
                },
                onPrepareRoutePressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    useRootNavigator: false,
                    backgroundColor: AppColors.sheetBackground,
                    builder: (bottomSheetContext) => DraggableScrollableSheet(
                      expand: false,
                      maxChildSize: 0.9,
                      minChildSize: 0.25,
                      initialChildSize: 0.9,
                      builder: (con, scrollController) => SingleChildScrollView(
                        controller: scrollController,
                        child: PreparedRouteMapSheetWidget(
                          preparationScreenContext: context,
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
          Align(
            alignment: Alignment.bottomCenter,
            child: ScreenBottomSheets(
              preparationScreenContext: context,
              tabController: _tabController,
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
