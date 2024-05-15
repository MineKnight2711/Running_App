import 'package:flutter/material.dart';

class SheetGrabber extends StatelessWidget {
  final Widget? grabberBottom;
  final Function(DragUpdateDetails details)? onVerticalDragUpdate;
  const SheetGrabber({
    super.key,
    this.onVerticalDragUpdate,
    this.grabberBottom = const SizedBox.shrink(),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: onVerticalDragUpdate,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              height: 5,
              width: 70.0,
              decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
          grabberBottom!
        ],
      ),
    );
  }
}
