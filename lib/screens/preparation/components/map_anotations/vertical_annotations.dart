import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controllers/map_controller.dart';
import 'map_annotation_item.dart';

class VerticalAnnotations extends StatelessWidget {
  final mapController = Get.find<MapController>();
  VerticalAnnotations({super.key});

  @override
  Widget build(BuildContext context) {
    print(mapController.currentMapViewStyle.value);
    return Column(
      children: [
        MapAnnotationItem(onPressed: () {}, assetSvg: "compass"),
        SizedBox(
          height: 10.h,
        ),
        MapAnnotationItem(
            onPressed: () {
              mapController.changeMapStyle();
            },
            assetSvg: "viewmode_2d"),
        SizedBox(
          height: 10.h,
        ),
        MapAnnotationItem(onPressed: () {}, assetSvg: "layer"),
        SizedBox(
          height: 10.h,
        ),
        MapAnnotationItem(onPressed: () {}, assetSvg: "target"),
      ],
    );
  }
}
