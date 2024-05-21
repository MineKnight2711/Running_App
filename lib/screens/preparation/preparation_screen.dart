import 'package:flutter/material.dart';
import 'package:flutter_running_demo/utils/navigator_key.dart';
import '../../config/config_export.dart';
import 'package:get/get.dart';
import '../../controllers/map_controller.dart';
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
  Widget build(BuildContext context) {
    super.build(context);

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
          top: 200,
          right: 0,
          child: VerticalAnnotations(
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
                  builder: (context, scrollController) => SingleChildScrollView(
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
        PreparationScreenBottomSheet(
          tabController: _tabController,
          onSelectedIndex: onSelectedIndex,
        )
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
