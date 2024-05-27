import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_running_demo/controllers/map_direction.dart';
import 'package:flutter_running_demo/models/route_model/route_model.dart';
import 'package:flutter_running_demo/screens/preparation/data/list_top_route_model.dart';
import 'package:get/get.dart';
// ignore: unused_import
import 'package:logger/logger.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

import '../config/colors.dart';
import '../utils/map_annotation_click_listener.dart';

class MapController extends GetxController {
  RxString currentMapViewStyle = MapboxStyles.MAPBOX_STREETS.obs;
  MapDirection currentMapDirection = MapDirection.north;
  late Rxn<MapboxMap> mapboxMap;
  late Rxn<PointAnnotationManager> pointManager;
  late Rxn<PolylineAnnotationManager> polylineManager;
  late RxDouble zoomLevel;

  late Rxn<RouteModel> selectedRoute;
  late Rxn<RouteModel> selectedRouteToAdd;
  late RxList<RouteModel> listRoute;

  final RxBool isRouteSelected = false.obs;
  final RxBool isRouteAdd = false.obs;
  final RxBool isReadyToRun = false.obs;

  @override
  void onInit() {
    super.onInit();
    mapboxMap = Rxn<MapboxMap>();
    pointManager = Rxn<PointAnnotationManager>();
    polylineManager = Rxn<PolylineAnnotationManager>();
    zoomLevel = 15.0.obs;
    selectedRoute = Rxn<RouteModel>();
    selectedRouteToAdd = Rxn<RouteModel>();
    listRoute = tempTopRoute.obs;
  }

  void resetPointAndAnotation() {
    pointManager.value?.deleteAll();
    polylineManager.value?.deleteAll();
    // pointManager.value = polylineManager.value = null;
  }

  onMapCreated(MapboxMap mapboxMapCreate) {
    mapboxMap.value = mapboxMapCreate;
    mapboxMap.value?.scaleBar.updateSettings(ScaleBarSettings(enabled: false));
    mapboxMap.value?.compass.updateSettings(CompassSettings(enabled: false));
  }

  selectAnotation(int anotationIndex) {
    if (listRoute.isNotEmpty &&
        (anotationIndex >= 0 && anotationIndex < listRoute.length) &&
        selectedRouteToAdd.value == null) {
      resetPointAndAnotation();
      selectedRoute.value = listRoute[anotationIndex];

      centerCameraOnCoordinate(
        selectedRoute.value?.longitude ?? 0,
        selectedRoute.value?.latitude ?? 0,
        anotationPng: "selected_route",
      );
    }
  }

  void zoomIn() {
    zoomLevel.value++;
    mapboxMap.value?.flyTo(
        CameraOptions(
            anchor: ScreenCoordinate(x: 0, y: 0),
            zoom: zoomLevel.value,
            bearing: 0,
            pitch: 0),
        MapAnimationOptions(duration: 2000, startDelay: 0));
  }

  void zoomOut() {
    zoomLevel.value--;
    mapboxMap.value?.flyTo(
        CameraOptions(
          anchor: ScreenCoordinate(x: 0, y: 0),
          zoom: zoomLevel.value,
          bearing: 0,
          pitch: 0,
        ),
        MapAnimationOptions(duration: 2000, startDelay: 0));
  }

  changeMapStyle() {
    if (currentMapViewStyle.value == MapboxStyles.MAPBOX_STREETS) {
      currentMapViewStyle.value = MapboxStyles.SATELLITE_STREETS;
      mapboxMap.value?.loadStyleURI(MapboxStyles.SATELLITE_STREETS);
    } else {
      currentMapViewStyle.value = MapboxStyles.MAPBOX_STREETS;
      mapboxMap.value?.loadStyleURI(MapboxStyles.MAPBOX_STREETS);
    }
  }

  changeMapDirection() {
    currentMapDirection = currentMapDirection.next;
    mapboxMap.value?.flyTo(
      CameraOptions(bearing: currentMapDirection.numericValue.toDouble()),
      MapAnimationOptions(duration: 500),
    );
  }

  Position _getCenterPoint(List<Position> points) {
    if (points.isEmpty) {
      return Position(0, 0);
    } else if (points.length == 1) {
      return points[0];
    }
    double lowerX = points[0].lat.toDouble();
    double lowerY = points[0].lng.toDouble();
    double higherX = points[0].lat.toDouble();
    double higherY = points[0].lng.toDouble();
    for (int i = 1; i < points.length; i++) {
      if (points[i].lat.toDouble() > higherX) {
        higherX = points[i].lat.toDouble();
      }
      if (points[i].lat.toDouble() < lowerX) {
        lowerX = points[i].lat.toDouble();
      }
      if (points[i].lng.toDouble() > higherY) {
        higherY = points[i].lng.toDouble();
      }
      if (points[i].lng.toDouble() < lowerY) {
        lowerY = points[i].lng.toDouble();
      }
    }
    return Position((higherY + lowerY) / 2, (higherX + lowerX) / 2);
  }

  void _centerCameraOnCenterPoint(List<Position> positions) async {
    final pos = _getCenterPoint(positions);

    centerCameraOnCoordinate(
      pos.lng.toDouble(),
      pos.lat.toDouble(),
      anotationPng: "position",
    );
  }

  void centerCameraOnCoordinate(double lng, double lat,
      {required String anotationPng}) async {
    final position = Position(lng, lat);
    final centeredPoint = Point(coordinates: position);

    final Uint8List images = await loadImageToUnit8List(
        "assets/images/map_anotations/$anotationPng.png");
    pointManager.value?.create(
      PointAnnotationOptions(
        geometry: centeredPoint.toJson(),
        iconSize: 2.5,
        image: images,
      ),
    );
    mapboxMap.value?.flyTo(
      CameraOptions(
        anchor: ScreenCoordinate(x: 0, y: 0),
        zoom: 14,
        center: Point(
          coordinates: position,
        ).toJson(),
        bearing: MapDirection.north.numericValue,
      ),
      MapAnimationOptions(duration: 3000, startDelay: 0),
    );
  }

  void createTempTopRoutes() {
    resetPointAndAnotation();
    mapboxMap.value?.annotations
        .createPointAnnotationManager()
        .then((pointAnnotationManager) async {
      pointManager.value = pointAnnotationManager;

      final positions = <Position>[];

      for (var route in listRoute) {
        positions.add(
          Position(route.longitude, route.latitude),
        );
      }
      final Uint8List images =
          await loadImageToUnit8List("assets/images/map_anotations/route.png");
      _centerCameraOnCenterPoint(listRoute
          .map((route) => Position(route.longitude, route.latitude))
          .toList());
      pointManager.value?.createMulti(positions
          .map((e) => PointAnnotationOptions(
              iconSize: 2.5,
              geometry: Point(coordinates: e).toJson(),
              image: images))
          .toList());
      pointManager.value
          ?.addOnPointAnnotationClickListener(AnnotationClickListener());
    });
  }

  Future<Uint8List> loadImageToUnit8List(String path) async {
    final ByteData bytes = await rootBundle.load(path);
    return bytes.buffer.asUint8List();
  }

  void selectRouteToAdd() async {
    selectedRouteToAdd.value = selectedRoute.value;
    selectedRoute.value = null;
    resetPointAndAnotation();
    String jsonString =
        await rootBundle.loadString('assets/geojson/tranvantraroute.geojson');
    Map<String, dynamic> geoJson = jsonDecode(jsonString);
    List coordinates = geoJson['features'][0]['geometry']['coordinates'];

    int startPosition = 0;
    int middlePosition = (coordinates.length / 2).floor();
    int endPosition = coordinates.length - 1;
    centerCameraOnCoordinate(
      coordinates[middlePosition][0],
      coordinates[middlePosition][1],
      anotationPng: "position",
    );
    List<Map<int, String>> preparedRoutePolylineAndPoints = [
      {startPosition: "start"},
      {middlePosition: "position"},
      {endPosition: "stop"}
    ];

    final listPosition = <Map<Uint8List, Position>>[];
    for (final point in preparedRoutePolylineAndPoints) {
      Logger().i("Key index ${point.keys.first}");
      final Uint8List image = await loadImageToUnit8List(
          "assets/images/map_anotations/${point.values.first}.png");
      listPosition.add({
        image: Position(
          coordinates[point.keys.first][0],
          coordinates[point.keys.first][1],
        )
      });
    }

    pointManager.value?.createMulti(listPosition
        .map(
          (position) => PointAnnotationOptions(
            geometry: Point(coordinates: position.values.first).toJson(),
            iconSize: 2,
            image: position.keys.first,
          ),
        )
        .toList());
    final List<Position> routeLinePositions =
        coordinates.map((cor) => Position(cor[0], cor[1])).toList();
    mapboxMap.value?.annotations
        .createPolylineAnnotationManager()
        .then((polylineAnnotationManager) async {
      polylineManager.value = polylineAnnotationManager;
      polylineManager.value?.create(
        PolylineAnnotationOptions(
          geometry: LineString(
            coordinates: routeLinePositions,
          ).toJson(),
          lineColor: AppColors.appButton.value,
          lineWidth: 1,
        ),
      );
    });
  }
}




// Future<String> predictLocation(String predictString) async {
  //   ResponseBaseModel responseBaseModel =
  //       await _mapApi.getPredictLocation(predictString);

  //   if (responseBaseModel.message == "Success") {
  //     PredictLocationResponse locationResponse =
  //         PredictLocationResponse.fromJson(responseBaseModel.data);
  //     places.value = locationResponse.predictions;
  //     isShow.value = true;
  //     isHidden.value = true;

  //     return "Success";
  //   }

  //   return responseBaseModel.message ?? "";
  // }

  // Future<String> getLocation(String placesID) async {
  //   searchController.clear();
  //   isShow.value = false;
  //   isHidden.value = false;
  //   ResponseBaseModel responseBaseModel =
  //       await _mapApi.getLocationByID(placesID);

  //   if (responseBaseModel.message == "Success") {
  //     LocationResponse locationResult =
  //         LocationResponse.fromJson(responseBaseModel.data);
  //     details.value = locationResult.results;
  //     latitude.value = "${details.value?.geometry.location.lat}";
  //     longLatitude.value = "${details.value?.geometry.location.lng}";
  //     centerCameraOnCoordinate(
  //         double.parse(latitude.value), double.parse(longLatitude.value));
  //     selectedLocation.value = locationResult;
  //   }

  //   return responseBaseModel.message ?? "";
  // }

  // Future<String> findCurrentLocation() async {
  //   return await getCurrentPosition();
  // }

  // void selectAddress() {}
  // Future<String> getCurrentPosition() async {
  //   String result = "";
  //   geolocator.LocationPermission permission =
  //       await geolocator.Geolocator.checkPermission();
  //   if (permission == geolocator.LocationPermission.deniedForever) {
  //     result = 'DeniedForever';
  //   } else if (permission == geolocator.LocationPermission.denied) {
  //     result = "Denied";
  //     geolocator.LocationPermission requestPermission =
  //         await geolocator.Geolocator.requestPermission();
  //     if (requestPermission == geolocator.LocationPermission.deniedForever) {
  //       return "DeniedForever";
  //     }
  //   } else if (permission == geolocator.LocationPermission.whileInUse ||
  //       permission == geolocator.LocationPermission.always) {
  //     gpi.Position position = await geolocator.Geolocator.getCurrentPosition(
  //         desiredAccuracy: geolocator.LocationAccuracy.high);
  //     Position getPositon = Position(position.longitude, position.latitude);
  //     final locationResult =
  //         await getLocationByLatitude("${getPositon.lat}", "${getPositon.lng}");
  //     if (locationResult == "Success") {
  //       centerCameraOnCoordinate(
  //           getPositon.lat.toDouble(), getPositon.lng.toDouble());
  //     }
  //     return "Success";
  //   }

  //   return result;
  // }

  // Future<String> getLocationByLatitude(String lat, String longLat) async {
  //   searchController.clear();
  //   isShow.value = false;
  //   isHidden.value = false;
  //   ResponseBaseModel responseBaseModel =
  //       await _mapApi.getLocationByLatitude(lat, longLat);

  //   if (responseBaseModel.message == "Success") {
  //     LocationByLatitudeResponse locationResult =
  //         LocationByLatitudeResponse.fromJson(responseBaseModel.data);
  //     final resultAddress = locationResult.results[0];
  //     selectedLocation.value =
  //         LocationResponse(results: resultAddress, status: "OK");
  //     return responseBaseModel.message ?? "";
  //   }

  //   return responseBaseModel.message ?? "";
  // }

  // void centerCameraOnCoordinate(double lat, double longLat) {
  //   circleManager.value?.deleteAll();
  //   mapboxMap.value?.setCamera(CameraOptions(
  //       center: Point(
  //         coordinates: Position(longLat, lat),
  //       ).toJson(),
  //       zoom: 12.0));

  //   mapboxMap.value?.flyTo(
  //       CameraOptions(
  //           anchor: ScreenCoordinate(x: 0, y: 0),
  //           zoom: 15,
  //           bearing: 180,
  //           pitch: 30),
  //       MapAnimationOptions(duration: 3000, startDelay: 0));
  //   mapboxMap.value?.annotations
  //       .createCircleAnnotationManager()
  //       .then((value) async {
  //     circleManager.value = value;
  //     value.create(
  //       CircleAnnotationOptions(
  //         geometry: Point(coordinates: Position(longLat, lat)).toJson(),
  //         circleColor: Colors.orange.value,
  //         circleRadius: 12.0,
  //       ),
  //     );
  //   });
  // }