import 'package:get/get.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import '../controllers/map_controller.dart';

///This class is used to listen to the click event on the map annotation
class AnnotationClickListener extends OnPointAnnotationClickListener {
  final mapController = Get.find<MapController>();
  @override
  void onPointAnnotationClick(PointAnnotation annotation) {
    mapController.selectAnotation(int.parse(annotation.id));
  }
}
