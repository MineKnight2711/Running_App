import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_running_demo/controllers/map_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import '../../screens/performance/components/period_button_row.dart';
import 'components/sheet_grabber.dart';

class PreparationScreen extends StatefulWidget {
  const PreparationScreen({super.key});

  @override
  State<PreparationScreen> createState() => _PreparationScreenState();
}

class _PreparationScreenState extends State<PreparationScreen> {
  double _sheetPosition = 0.2;
  final double _dragSensitivity = 1000;

  final List<String> periodButtonRow = [
    'Favorites',
    'Add_new',
    'Upcoming',
  ];
  final mapController = Get.find<MapController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomMapWidget(),
          Align(
            alignment: Alignment.bottomCenter,
            child: DraggableScrollableSheet(
              // expand: false,

              minChildSize: 0.2,
              initialChildSize: _sheetPosition,
              maxChildSize: 0.9,
              builder: (context, scrollController) => Container(
                height: 02,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSurface,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SheetGrabber(
                        onVerticalDragUpdate: (DragUpdateDetails details) {
                          setState(() {
                            _sheetPosition -=
                                details.delta.dy / _dragSensitivity;
                            if (_sheetPosition < 0.25) {
                              _sheetPosition = 0.25;
                            }
                            if (_sheetPosition > 0.9) {
                              _sheetPosition = 0.9;
                            }
                          });
                        },
                      ),
                      PeriodButtonRow(
                        listButton: periodButtonRow,
                      ),
                      ElevatedButton(
                          onPressed: () => mapController.createTempTopRoutes(),
                          child: Text("Create points")),
                      Column(
                        children: [
                          SizedBox(
                            width: 1.sw,
                            height: 0.4.sh,
                            child: ListView.builder(
                              itemCount: 10,
                              itemBuilder: (context, index) => Container(
                                margin: EdgeInsets.symmetric(vertical: 5.h),
                                width: 1.sw,
                                height: 0.2.sh,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomMapWidget extends StatelessWidget {
  CustomMapWidget({super.key});
  final mapController = Get.find<MapController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => MapWidget(
        key: const ValueKey("mapWidget"),
        resourceOptions: ResourceOptions(
            accessToken:
                "pk.eyJ1IjoidGluaGthaXQiLCJhIjoiY2xoZXhkZmJ4MTB3MzNqczdza2MzcHE2YSJ9.tPQwbEWtA53iWlv3U8O0-g"),
        cameraOptions: CameraOptions(
          center: Point(coordinates: Position(106.722954, 10.726725)).toJson(),
          zoom: mapController.zoomLevel.value,
        ),
        styleUri: MapboxStyles.MAPBOX_STREETS,
        textureView: true,
        onMapCreated: mapController.onMapCreated,
      ),
    );
  }
}
