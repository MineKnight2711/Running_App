import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controllers/map_controller.dart';
import 'map_annotation_item.dart';

class VerticalAnnotations extends GetView<MapController> {
  final bool isRouteSelected, isRouteAdd, showEditButton;
  final VoidCallback onPrepareRoutePressed,
      onClosePress,
      onCompassPress,
      onViewModePress,
      onHandPress,
      onTargetPress,
      onCheckPress,
      onAddUndoPress,
      onUndoPress;
  final VoidCallback? onRotateMapPressed, onChangeStylePressed;

  const VerticalAnnotations({
    super.key,
    required this.onPrepareRoutePressed,
    required this.onCompassPress,
    required this.onViewModePress,
    required this.onTargetPress,
    required this.isRouteSelected,
    required this.onClosePress,
    required this.onHandPress,
    required this.onCheckPress,
    required this.onUndoPress,
    required this.isRouteAdd,
    required this.onAddUndoPress,
    this.showEditButton = true,
    this.onRotateMapPressed,
    this.onChangeStylePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        MapAnnotationItem(
          onPressed: !isRouteSelected && !isRouteAdd ? onCompassPress : null,
          assetSvg: "compass",
        ),
        SizedBox(height: 10.h),
        !isRouteSelected
            ? Column(
                children: [
                  MapAnnotationItem(
                    onPressed: !isRouteSelected && !isRouteAdd
                        ? onViewModePress
                        : null,
                    assetSvg: "viewmode_2d",
                  ),
                  SizedBox(height: 10.h),
                ],
              )
            : const SizedBox.shrink(),
        MapAnnotationItem(
          onPressed: !isRouteSelected && !isRouteAdd ? () {} : null,
          assetSvg: "layer",
        ),
        SizedBox(height: 10.h),
        Obx(() {
          return controller.selectedRoute.value == null
              ? MapAnnotationItem(
                  onPressed: isRouteAdd ? null : onTargetPress,
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
                        onPressed: onCheckPress,
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
        Obx(() {
          return controller.selectedRoute.value == null &&
                  controller.selectedRouteToAdd.value == null
              ? showEditButton
                  ? MapAnnotationItem(
                      onPressed: !isRouteSelected && !isRouteAdd
                          ? onPrepareRoutePressed
                          : null,
                      assetSvg: "pen",
                    )
                  : const SizedBox.shrink()
              : Row(
                  children: [
                    AnimatedSlide(
                      offset: controller.selectedRouteToAdd.value != null
                          ? const Offset(0.25, 0)
                          : const Offset(-10, 0),
                      duration: const Duration(milliseconds: 500),
                      child: MapAnnotationItem(
                        onPressed: onAddUndoPress,
                        assetSvg: "undo",
                      ),
                    ),
                    MapAnnotationItem(
                      onPressed: controller.selectedRouteToAdd.value != null
                          ? onAddUndoPress
                          : null,
                      assetSvg: "pen",
                    )
                  ],
                );
        }),
      ],
    );
  }
}
