// import 'package:flutter/material.dart';

// import 'sheet_grabber.dart';

import 'package:flutter/material.dart';

import '../../config/config_export.dart';

class CustomDraggableSheet extends StatelessWidget {
  final Widget Function(BuildContext context, ScrollController scrollController)
      child;
  final double? sheetPostiton, inititalSize, minSize, maxSize;
  const CustomDraggableSheet(
      {super.key,
      required this.child,
      this.sheetPostiton,
      this.inititalSize,
      this.minSize,
      this.maxSize});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: inititalSize ?? 0.25,
      maxChildSize: maxSize ?? 0.85,
      minChildSize: minSize ?? 0.25,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.sheetBackground,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: AppSpacings.hs15),
            child: child(context, scrollController),
          ),
        );
      },
    );
  }
}
