import 'package:flutter/material.dart';
import 'package:flutter_running_demo/controllers/map_controller.dart';
import 'package:get/get.dart';
import '../../models/top_route_model/top_route_model.dart';
import '../../widgets/custom_draggable_sheet/custom_draggable_sheet.dart';
import '../performance/components/period_button_row.dart';
import 'components/components_export.dart';

class PreparationScreen extends StatefulWidget {
  const PreparationScreen({super.key});

  @override
  State<PreparationScreen> createState() => _PreparationScreenState();
}

class _PreparationScreenState extends State<PreparationScreen>
    with AutomaticKeepAliveClientMixin {
  final mapController = Get.find<MapController>();

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
      ),
      TopRouteModel(
        attemps: 11,
        rpePoint: 9,
        latitude: 10.7294681,
        longitude: 106.7173091,
        distance: 4,
        imagePath: "vector_3",
        routeTitle: "Saigon Exhibition and Convention Center",
        time: const Duration(minutes: 22),
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
              child: PeriodButtonRow(
                listButton: periodButtonRow,
              ),
            ),
            sheetBody: ListTopRoutes(
              topRoutes: tempTopRoute,
            ),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
