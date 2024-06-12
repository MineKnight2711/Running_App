import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'map_annotation_item.dart';

class HorizontalAnnotations extends StatelessWidget {
  final VoidCallback onBackPressed;
  const HorizontalAnnotations({super.key, required this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MapAnnotationItem(
            onPressed: onBackPressed,
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
