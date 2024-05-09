import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SheetGrabber extends StatelessWidget {
  const SheetGrabber({
    super.key,
    required this.onVerticalDragUpdate,
    this.grabberBottomWidget = const SizedBox.shrink(),
  });

  final ValueChanged<DragUpdateDetails> onVerticalDragUpdate;
  final Widget? grabberBottomWidget;
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onVerticalDragUpdate: onVerticalDragUpdate,
      child: Container(
        width: double.infinity,
        height: 60.h,
        decoration: BoxDecoration(
          color: colorScheme.onSurface,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: colorScheme.surfaceVariant,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            grabberBottomWidget!
          ],
        ),
      ),
    );
  }
}
