import 'package:flutter/material.dart';

import 'sheet_grabber.dart';

class CustomDraggableSheetWidget extends StatefulWidget {
  final Widget Function(
          BuildContext context, ScrollController scrollController)?
      sheetBodyBuilder;
  final double? sheetPostiton, inititalSize, minSize, maxSize, dragSensitivity;

  final bool isSnap, showGrabber;
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
    this.inititalSize,
    this.showGrabber = true,
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
    _sheetPosition = widget.inititalSize ?? widget.sheetPostiton ?? 0.9;
    _dragSensitivity = widget.dragSensitivity ?? 800;
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        maxChildSize: widget.inititalSize != null
            ? widget.maxSize ?? 0.9
            : _sheetPosition,
        initialChildSize: _sheetPosition,
        minChildSize: widget.inititalSize != null
            ? widget.minSize ?? 0.25
            : _sheetPosition,
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
                      if (_sheetPosition < (widget.minSize ?? 0.25)) {
                        _sheetPosition = widget.minSize ?? 0.25;
                      }
                      if (_sheetPosition > (widget.maxSize ?? 0.9)) {
                        _sheetPosition = widget.maxSize ?? 0.9;
                      }
                    });
                  },
                  showGrabber: widget.showGrabber,
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
