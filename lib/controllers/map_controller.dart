import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_running_demo/apis/goong_api.dart';
import 'package:flutter_running_demo/controllers/map_direction.dart';
import 'package:flutter_running_demo/models/direction_model/route_model/location_model/location_model.dart';
import 'package:flutter_running_demo/models/route_model/route_model.dart';
import 'package:flutter_running_demo/screens/preparation/data/list_top_route_model.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import '../config/colors.dart';
import '../utils/map_annotation_click_listener.dart';

class MapController extends GetxController {
  final _mapApi = GoongApi();
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
      // isRouteSelected.value = true;
      selectedRoute.value = listRoute[anotationIndex];

      centerCameraOnCoordinate(
        selectedRoute.value?.longitude ?? 0,
        selectedRoute.value?.latitude ?? 0,
        anotationPng: "selected_route",
      );
    }
  }

  selectDirection(ScreenCoordinate coordinate) async {
    if (selectedRoute.value != null && isRouteSelected.value) {
      resetPointAndAnotation();
      //Get api đường đi từ điểm bắt đầu đến điểm kết thúc
      final direction = await _mapApi.getRoute(
        startLocation: LocationModel(
          lat: selectedRoute.value!.latitude,
          lng: selectedRoute.value!.longitude,
        ),
        endLocation: LocationModel(
          lat: coordinate.x,
          lng: coordinate.y,
        ),
      );
      //Tạo điểm bắt đầu và kết thúc
      final startAndEndPoint = <Position>[
        Position(selectedRoute.value!.longitude, selectedRoute.value!.latitude),
        Position(coordinate.y, coordinate.x),
      ];

      final Uint8List images = await loadImageToUnit8List(
          "assets/images/map_anotations/position.png");
      //Tạo điểm bắt đầu và kết thúc
      pointManager.value?.createMulti(
        startAndEndPoint
            .map(
              (e) => PointAnnotationOptions(
                geometry: Point(coordinates: e).toJson(),
                iconSize: 2.5,
                image: images,
              ),
            )
            .toList(),
      );
      //khởi tạo listWayPoint sau đó duyệt qua các điểm trong direction.routes[0].legs[0].steps
      //Thêm các điểm bắt đầu và kết thúc vào listWayPoint
      final listWayPoint = <List<Position>>[];
      for (var route in direction.routes[0].legs[0].steps) {
        listWayPoint.add([
          Position(
            route.startLocation.lng,
            route.startLocation.lat,
          ),
          Position(
            route.endLocation.lng,
            route.endLocation.lat,
          )
        ]);
      }
      //Tạo các polyline từ các điểm trong listWayPoint
      mapboxMap.value?.annotations
          .createPolylineAnnotationManager()
          .then((polylineAnnotationManager) async {
        polylineManager.value = polylineAnnotationManager;
        polylineManager.value?.createMulti(
          listWayPoint
              .map(
                (lineStartEndPositions) => PolylineAnnotationOptions(
                  geometry:
                      LineString(coordinates: lineStartEndPositions).toJson(),
                ),
              )
              .toList(),
        );
      });
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
