import 'package:flutter/services.dart';
import 'package:flutter_running_demo/models/top_route_model/top_route_model.dart';
import 'package:get/get.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class MapController extends GetxController {
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

  // Rx<List<Prediction>> places = Rx<List<Prediction>>([]);
  // final TextEditingController searchController = TextEditingController();
  // Rx<Result?> details = Rx<Result?>(null);
  // Rx<LocationResponse?> selectedLocation = Rx<LocationResponse?>(null);
  @override
  void onInit() {
    super.onInit();
    // _mapApi = MapApi();
    createTempTopRoutes();
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

  void centerCamera(List<Position> positions) async {
    final pos = getCentroid(positions);
    print("Lat: ${pos.lat}");
    print("Lng: ${pos.lng}");
    final centeredPoint = Point(coordinates: pos);

    final ByteData bytes =
        await rootBundle.load('assets/images/map_anotations/position.png');
    final Uint8List imagesData = bytes.buffer.asUint8List();
    pointManager.value?.create(PointAnnotationOptions(
      geometry: centeredPoint.toJson(),
      image: imagesData,
      iconSize: 1.5,
    ));
    centerCameraOnCoordinate(
      pos.lat.toDouble(),
      pos.lng.toDouble(),
    );
  }

  void centerCameraOnCoordinate(double lat, double longLat) {
    mapboxMap.value?.setCamera(CameraOptions(
        center: Point(
          coordinates: Position(longLat, lat),
        ).toJson(),
        zoom: 12.0));

    mapboxMap.value?.flyTo(
        CameraOptions(
            anchor: ScreenCoordinate(x: 0, y: 0),
            zoom: 15,
            bearing: 180,
            pitch: 30),
        MapAnimationOptions(duration: 3000, startDelay: 0));
  }

  void createTempTopRoutes() {
    final tempTopRoute = [
      TopRouteModel(
        attemps: 100,
        rpePoint: 7,
        latitude: 10.727392,
        longitude: 106.724228,
        distance: 10,
        routeTitle: "Raymondienne",
        time: const Duration(minutes: 55),
      ),
      TopRouteModel(
        attemps: 3,
        rpePoint: 9,
        latitude: 10.726371,
        longitude: 106.724881,
        distance: 3,
        routeTitle: "Tran Van Tra",
        time: const Duration(minutes: 11),
      ),
      TopRouteModel(
        attemps: 32,
        rpePoint: 4,
        latitude: 10.727318,
        longitude: 106.721855,
        distance: 20,
        routeTitle: "Morison",
        time: const Duration(minutes: 32),
      ),
      TopRouteModel(
        attemps: 11,
        rpePoint: 9,
        latitude: 10.725190,
        longitude: 106.722959,
        distance: 4,
        routeTitle: "Nam Sai Gon School",
        time: const Duration(minutes: 22),
      ),
      TopRouteModel(
        attemps: 11,
        rpePoint: 9,
        latitude: 10.7285405,
        longitude: 106.7161719,
        distance: 4,
        routeTitle: "Cresent Mall route",
        time: const Duration(minutes: 22),
      ),
      TopRouteModel(
        attemps: 11,
        rpePoint: 9,
        latitude: 10.7294681,
        longitude: 106.7173091,
        distance: 4,
        routeTitle: "Cresent Mall route",
        time: const Duration(minutes: 22),
      ),
    ];

    mapboxMap.value?.annotations
        .createPointAnnotationManager()
        .then((pointAnnotationManager) async {
      pointManager.value = pointAnnotationManager;

      final positions = <Position>[];

      for (var route in tempTopRoute) {
        positions.add(
          Position(route.longitude, route.latitude),
        );
      }
      final ByteData bytes =
          await rootBundle.load('assets/images/map_anotations/route.png');
      final Uint8List imagesData = bytes.buffer.asUint8List();
      centerCamera(tempTopRoute
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

  @override
  void refresh() {
    super.refresh();
    searchText.value = latitude.value = longLatitude.value = "";
    isShow.value = false;
    isHidden.value = true;
    // selectedLocation.value = null;
    // searchController.clear();
  }

  onMapCreated(MapboxMap mapboxMapCreate) {
    mapboxMap.value = mapboxMapCreate;
  }

  void zoomIn() {
    print("Zoom level $zoomLevel");
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
    print("Zoom level $zoomLevel");
    zoomLevel.value--;
    mapboxMap.value?.flyTo(
        CameraOptions(
            anchor: ScreenCoordinate(x: 0, y: 0),
            zoom: zoomLevel.value,
            bearing: 0,
            pitch: 0),
        MapAnimationOptions(duration: 2000, startDelay: 0));
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
}

class AnnotationClickListener extends OnPointAnnotationClickListener {
  @override
  void onPointAnnotationClick(PointAnnotation annotation) {
    print("onAnnotationClick, id: ${annotation.id}");
  }
}
