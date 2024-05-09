import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

import '../../../controllers/map_controller.dart';

class CustomMapWidget extends StatelessWidget {
  final Function(MapLoadedEventData)? onMapLoad;
  CustomMapWidget({super.key, this.onMapLoad});
  final mapController = Get.find<MapController>();
  @override
  Widget build(BuildContext context) {
    mapController.mapboxMap.value?.scaleBar
        .updateSettings(ScaleBarSettings(enabled: false));
    mapController.mapboxMap.value?.compass
        .updateSettings(CompassSettings(enabled: false));
    return Obx(
      () => MapWidget(
        styleUri: mapController.currentMapViewStyle.value,
        onMapLoadedListener: onMapLoad,
        key: const ValueKey("mapWidget"),
        resourceOptions: ResourceOptions(
            accessToken:
                "pk.eyJ1IjoidGluaGthaXQiLCJhIjoiY2xoZXhkZmJ4MTB3MzNqczdza2MzcHE2YSJ9.tPQwbEWtA53iWlv3U8O0-g"),
        cameraOptions: CameraOptions(
          center: Point(coordinates: Position(106.722954, 10.726725)).toJson(),
          zoom: mapController.zoomLevel.value,
        ),
        textureView: true,
        onMapCreated: mapController.onMapCreated,
      ),
    );
  }
}
