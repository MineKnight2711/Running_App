import 'package:flutter/material.dart';
import 'package:flutter_running_demo/config/colors.dart';
import 'package:flutter_svg/svg.dart';

class MapAnnotationItem extends StatelessWidget {
  final String assetSvg;
  final VoidCallback? onPressed;
  const MapAnnotationItem(
      {super.key, required this.assetSvg, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.annotationButton,
        shape: const CircleBorder(),
      ),
      onPressed: onPressed,
      child: SvgPicture.asset(
          "assets/svg/preparation/map_annotations/$assetSvg.svg"),
    );
  }
}
