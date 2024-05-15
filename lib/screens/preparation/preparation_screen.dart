import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/config_export.dart';
import 'package:flutter_running_demo/controllers/map_controller.dart';
import 'package:get/get.dart';
import '../../models/top_route_model/top_route_model.dart';
import '../../widgets/custom_draggable_sheet/custom_draggable_sheet.dart';
import 'components/components_export.dart';
import 'components/preparation_tabbar.dart';

enum PreparationType { favorites, addNew, upcoming }

class PreparationScreen extends StatefulWidget {
  const PreparationScreen({super.key});

  @override
  State<PreparationScreen> createState() => _PreparationScreenState();
}

class _PreparationScreenState extends State<PreparationScreen>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  late Rx<TabController> _tabController;
  final currentPreparationType = PreparationType.favorites.obs;
  final mapController = Get.find<MapController>();
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: PreparationType.values.length, vsync: this).obs;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final tempTopRoute = [
      TopRouteModel(
        attemps: 100,
        rpePoint: 7,
        latitude: 10.727392,
        longitude: 106.724228,
        distance: 10,
        imagePath: "vector_1",
        routeTitle: "Raymondienne",
        time: const Duration(minutes: 55),
        images: [
          "photo_1",
          "photo_2",
          "photo_3",
          "photo_4",
          "photo_5",
          "photo_6",
          "photo_7",
          "photo_8",
        ],
      ),
      TopRouteModel(
        attemps: 3,
        rpePoint: 9,
        latitude: 10.726371,
        longitude: 106.724881,
        distance: 3,
        imagePath: "vector_2",
        routeTitle: "Tran Van Tra",
        time: const Duration(minutes: 11),
        images: [
          "photo_1",
          "photo_2",
          "photo_3",
          "photo_4",
          "photo_5",
          "photo_6",
          "photo_7",
          "photo_8",
        ],
      ),
      TopRouteModel(
        attemps: 32,
        rpePoint: 4,
        latitude: 10.727318,
        longitude: 106.721855,
        distance: 20,
        imagePath: "vector_2",
        routeTitle: "Morison",
        time: const Duration(minutes: 32),
        images: [
          "photo_1",
          "photo_2",
          "photo_3",
          "photo_4",
          "photo_5",
          "photo_6",
          "photo_7",
          "photo_8",
        ],
      ),
      TopRouteModel(
        attemps: 11,
        rpePoint: 9,
        latitude: 10.725190,
        longitude: 106.722959,
        distance: 4,
        imagePath: "vector_3",
        routeTitle: "Nam Sai Gon School",
        time: const Duration(minutes: 22),
        images: [
          "photo_1",
          "photo_2",
          "photo_3",
          "photo_4",
          "photo_5",
          "photo_6",
          "photo_7",
          "photo_8",
        ],
      ),
      TopRouteModel(
        attemps: 11,
        rpePoint: 9,
        latitude: 10.7285405,
        longitude: 106.7161719,
        distance: 4,
        imagePath: "vector_1",
        routeTitle: "Cresent Mall route",
        time: const Duration(minutes: 22),
        images: [
          "photo_1",
          "photo_2",
          "photo_3",
          "photo_4",
          "photo_5",
          "photo_6",
          "photo_7",
          "photo_8",
        ],
      ),
      TopRouteModel(
        attemps: 11,
        rpePoint: 9,
        latitude: 10.7294681,
        longitude: 106.7173091,
        distance: 4,
        imagePath: "vector_3",
        routeTitle: "Saigon Exhibition and Convention Center",
        time: const Duration(minutes: 89),
        images: [
          "photo_1",
          "photo_2",
          "photo_3",
          "photo_4",
          "photo_5",
          "photo_6",
          "photo_7",
          "photo_8",
        ],
      ),
    ];
    final List<String> periodButtonRow = [
      'Favorites',
      'Add-new',
      'Upcoming',
    ];

    return Scaffold(
      body: Stack(
        children: [
          CustomMapWidget(
            onMapCreate: (mapBoxMap) {
              mapController.onMapCreated(mapBoxMap);
              mapController.createTempTopRoutes(tempTopRoute);
            },
          ),
          Positioned(
            top: 40,
            // left: 10,
            child: HorizontalAnnotations(),
          ),
          Positioned(top: 200, right: 0, child: VerticalAnnotations()),
          CustomDraggableSheet(
              dragSensitivity: 800,
              grabberBottomWidget: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Obx(
                  () => PreparationTypeTabbar(
                    tabController: _tabController.value,
                    onSelectedIndex: (index) {
                      switch (index) {
                        case 0:
                          currentPreparationType.value =
                              PreparationType.favorites;

                          break;
                        case 1:
                          currentPreparationType.value = PreparationType.addNew;

                          break;
                        case 2:
                          currentPreparationType.value =
                              PreparationType.upcoming;

                          break;
                        default:
                      }
                    },
                    listButton: periodButtonRow,
                  ),
                ),
              ),
              sheetBody: SizedBox(
                width: AppSpacings.widthByScreenWidth(1),
                height: AppSpacings.heightByScreenHeight(0.8),
                child: TabBarView(
                  controller: _tabController.value,
                  children: [
                    ListTopRoutes(topRoutes: tempTopRoute),
                    ListTopRoutes(topRoutes: tempTopRoute),
                    ListTopRoutes(topRoutes: tempTopRoute),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
