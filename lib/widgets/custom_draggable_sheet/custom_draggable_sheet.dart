import 'package:flutter/material.dart';
import 'sheet_grabber.dart';

class CustomDraggableSheetWidget extends StatefulWidget {
  final Widget Function(
      BuildContext context, ScrollController scrollController)? sheetBody;
  final Widget? grabberBottom;
  const CustomDraggableSheetWidget({
    super.key,
    this.sheetBody,
    this.grabberBottom = const SizedBox.shrink(),
  });

  @override
  State<CustomDraggableSheetWidget> createState() =>
      _CustomDraggableSheetWidgetState();
}

class _CustomDraggableSheetWidgetState
    extends State<CustomDraggableSheetWidget> {
  double _sheetPosition = 0.25;
  final double _dragSensitivity = 800;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        maxChildSize: _sheetPosition,
        initialChildSize: _sheetPosition,
        minChildSize: _sheetPosition,
        expand: false,
        snap: true,
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
                // Put all heading in column.
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

                Expanded(
                  child: widget.sheetBody!(context, scrollController),
                ),
              ],
            ),
          );
        });
  }
}
