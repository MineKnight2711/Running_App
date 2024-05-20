import 'package:flutter/material.dart';

import 'sheet_grabber.dart';

class CustomDraggableSheetWidget extends StatefulWidget {
  final Widget Function(
          BuildContext context, ScrollController scrollController)?
      sheetBodyBuilder;
  final double sheetPostiton, inititalSize, minSize, maxSize, dragSensitivity;

  final bool isSnap, usingInititalSize;
  final Widget? grabberBottom;
  const CustomDraggableSheetWidget({
    super.key,
    this.sheetBodyBuilder,
    this.isSnap = false,
    this.grabberBottom = const SizedBox.shrink(),
    this.sheetPostiton = 0.25,
    this.dragSensitivity = 800,
    this.minSize = 0.25,
    this.maxSize = 0.9,
    this.inititalSize = 0.25,
    this.usingInititalSize = false,
  });

  @override
  State<CustomDraggableSheetWidget> createState() =>
      _CustomDraggableSheetWidgetState();
}

class _CustomDraggableSheetWidgetState
    extends State<CustomDraggableSheetWidget> {
  late double _sheetPosition;
  late double _dragSensitivity;
  @override
  void initState() {
    super.initState();
    _sheetPosition = widget.sheetPostiton;
    _dragSensitivity = widget.dragSensitivity;
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        maxChildSize:
            widget.usingInititalSize ? widget.maxSize : _sheetPosition,
        initialChildSize: _sheetPosition,
        minChildSize:
            widget.usingInititalSize ? widget.minSize : _sheetPosition,
        expand: false,
        snap: widget.isSnap,
        builder: (context, scrollController) {
          return Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSurface,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SheetGrabber(
                  onVerticalDragUpdate: (details) {
                    setState(() {
                      _sheetPosition -= details.delta.dy / _dragSensitivity;
                      if (_sheetPosition < 0.25) {
                        _sheetPosition = 0.25;
                      }
                      if (_sheetPosition > 0.9) {
                        _sheetPosition = 0.9;
                      }
                    });
                  },
                  grabberBottom: widget.grabberBottom!,
                ),
                widget.sheetBodyBuilder != null
                    ? Expanded(
                        child:
                            widget.sheetBodyBuilder!(context, scrollController))
                    : const SizedBox.shrink(),
              ],
            ),
          );
        });
  }
}
