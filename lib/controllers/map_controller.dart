import 'package:flutter/services.dart';
import 'package:flutter_running_demo/models/route_model/route_model.dart';
import 'package:flutter_running_demo/screens/preparation/data/list_top_route_model.dart';
import 'package:get/get.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

import '../utils/map_annotation_click_listener.dart';

enum MapDirection {
  north,
  east,
  south,
  west,
}

extension MapDirectionExtension on MapDirection {
  double get numericValue {
    switch (this) {
      case MapDirection.north:
        return 0;
      case MapDirection.south:
        return 180;
      case MapDirection.west:
        return 270;
      case MapDirection.east:
        return 90;
      default:
        return 0;
    }
  }

  MapDirection get next {
    List<MapDirection> values = MapDirection.values;
    int currentIndex = values.indexOf(this);
    int nextIndex = (currentIndex + 1) % values.length;
    return values[nextIndex];
  }
}

class MapController extends GetxController {
  RxString currentMapViewStyle = MapboxStyles.MAPBOX_STREETS.obs;
  MapDirection currentMapDirection = MapDirection.north;
  Rx<MapboxMap?> mapboxMap = Rx<MapboxMap?>(null);
  Rx<PointAnnotationManager?> pointManager = Rx<PointAnnotationManager?>(null);
  Rx<PolylineAnnotationManager?> polylineManager =
      Rx<PolylineAnnotationManager?>(null);
  RxInt mapWidgetKey = 0.obs;
  RxDouble zoomLevel = 15.0.obs;

  RxBool isShow = false.obs;
  RxBool isHidden = true.obs;

  RxString searchText = "".obs;
  RxString latitude = "".obs;
  RxString longLatitude = "".obs;
  Rxn<RouteModel> selectedRoute = Rxn<RouteModel>();
  late RxList<RouteModel> listRoute;
  @override
  void onInit() {
    super.onInit();
    listRoute = tempTopRoute.obs;
  }

  @override
  void refresh() {
    super.refresh();
    searchText.value = latitude.value = longLatitude.value = "";
    isShow.value = false;
    isHidden.value = true;
    listRoute.clear();
  }

  onMapCreated(MapboxMap mapboxMapCreate) {
    mapboxMap.value = mapboxMapCreate;
    mapboxMap.value?.scaleBar.updateSettings(ScaleBarSettings(enabled: false));
    mapboxMap.value?.compass.updateSettings(CompassSettings(enabled: false));
  }

  selectAnotation(int anotationIndex) {
    if (listRoute.isNotEmpty) {
      selectedRoute.value = listRoute[anotationIndex];
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
            pitch: 0),
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

  Position getCentroid(List<Position> points) {
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

  void _centerCamera(List<Position> positions) async {
    final pos = getCentroid(positions);
    final centeredPoint = Point(coordinates: pos);

    final ByteData bytes =
        await rootBundle.load('assets/images/map_anotations/position.png');
    final Uint8List imagesData = bytes.buffer.asUint8List();
    pointManager.value?.create(PointAnnotationOptions(
      geometry: centeredPoint.toJson(),
      image: imagesData,
      iconSize: 1.5,
    ));
    _centerCameraOnCoordinate(
      pos.lat.toDouble(),
      pos.lng.toDouble(),
    );
  }

  void _centerCameraOnCoordinate(double lat, double longLat) {
    mapboxMap.value?.setCamera(CameraOptions(
        center: Point(
          coordinates: Position(longLat, lat),
        ).toJson(),
        zoom: 12.0));

    mapboxMap.value?.flyTo(
        CameraOptions(
            anchor: ScreenCoordinate(x: 0, y: 0),
            zoom: 14,
            bearing: MapDirection.north.numericValue,
            pitch: 30),
        MapAnimationOptions(duration: 3000, startDelay: 0));
  }

  void createTempTopRoutes() {
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
      final ByteData bytes =
          await rootBundle.load('assets/images/map_anotations/route.png');
      final Uint8List imagesData = bytes.buffer.asUint8List();
      _centerCamera(listRoute
          .map((route) => Position(route.longitude, route.latitude))
          .toList());
      pointAnnotationManager.createMulti(positions
          .map((e) => PointAnnotationOptions(
                iconSize: 3,
                geometry: Point(coordinates: e).toJson(),
                image: imagesData,
              ))
          .toList());
      pointAnnotationManager
          .addOnPointAnnotationClickListener(AnnotationClickListener());
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