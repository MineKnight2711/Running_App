import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controllers/map_controller.dart';
import 'map_annotation_item.dart';

class VerticalAnnotations extends StatelessWidget {
  final bool isRouteSelected;
  final VoidCallback onPrepareRoutePressed,
      onClosePress,
      onHandPress,
      onUndoPress;
  final mapController = Get.find<MapController>();
  VerticalAnnotations(
      {super.key,
      required this.onPrepareRoutePressed,
      required this.isRouteSelected,
      required this.onClosePress,
      required this.onHandPress,
      required this.onUndoPress});

  @override
  Widget build(BuildContext context) {
    final isShowBottomSheet = false.obs;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        MapAnnotationItem(
          onPressed: !isRouteSelected
              ? () {
                  mapController.changeMapDirection();
                }
              : null,
          assetSvg: "compass",
        ),
        SizedBox(height: 10.h),
        !isRouteSelected
            ? Column(
                children: [
                  MapAnnotationItem(
                    onPressed: !isRouteSelected
                        ? () {
                            mapController.changeMapStyle();
                          }
                        : null,
                    assetSvg: "viewmode_2d",
                  ),
                  SizedBox(height: 10.h),
                ],
              )
            : const SizedBox.shrink(),
        MapAnnotationItem(
          onPressed: !isRouteSelected ? () {} : null,
          assetSvg: "layer",
        ),
        SizedBox(height: 10.h),
        Obx(() {
          return mapController.selectedRoute.value == null
              ? MapAnnotationItem(
                  onPressed: () {},
                  assetSvg: "target",
                )
              : Row(
                  children: [
                    AnimatedSlide(
                      offset: isRouteSelected
                          ? const Offset(0.5, 0)
                          : const Offset(-10, 0),
                      duration: const Duration(milliseconds: 500),
                      child: MapAnnotationItem(
                        onPressed: onUndoPress,
                        assetSvg: "undo",
                      ),
                    ),
                    AnimatedSlide(
                      offset: isRouteSelected
                          ? const Offset(0.25, 0)
                          : const Offset(-10, 0),
                      duration: const Duration(milliseconds: 500),
                      child: MapAnnotationItem(
                        onPressed: () {
                          isShowBottomSheet.value = true;
                        },
                        assetSvg: "check",
                      ),
                    ),
                    isRouteSelected
                        ? MapAnnotationItem(
                            onPressed: onClosePress,
                            assetSvg: "close",
                          )
                        : MapAnnotationItem(
                            onPressed: onHandPress,
                            assetSvg: "hand",
                          )
                  ],
                );
        }),
        SizedBox(height: 10.h),
        MapAnnotationItem(
          onPressed: !isRouteSelected ? onPrepareRoutePressed : null,
          assetSvg: "pen",
        ),
      ],
    );
  }
}
