import 'package:flutter/material.dart';
import 'package:flutter_running_demo/controllers/preparation_map_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'map_annotation_item.dart';

class HorizontalAnnotations extends StatelessWidget {
  final mapController = Get.find<MapController>();
  HorizontalAnnotations({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MapAnnotationItem(
            onPressed: () {},
            assetSvg: "back",
          ),
          const Spacer(),
          MapAnnotationItem(
            onPressed: () {},
            assetSvg: "info",
          ),
          MapAnnotationItem(
            onPressed: () {},
            assetSvg: "gps",
          ),
        ],
      ),
    );
  }
}
