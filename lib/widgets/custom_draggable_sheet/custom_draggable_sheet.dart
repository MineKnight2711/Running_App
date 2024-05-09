import 'package:flutter/material.dart';

import 'sheet_grabber.dart';

class CustomDraggableSheet extends StatefulWidget {
  final double? sheetPosition, dragSensitivity;
  final Widget? grabberBottomWidget, sheetBody;
  const CustomDraggableSheet({
    super.key,
    this.grabberBottomWidget = const SizedBox.shrink(),
    this.sheetBody = const SizedBox.shrink(),
    this.sheetPosition = 0.2,
    this.dragSensitivity = 1000,
  });

  @override
  State<CustomDraggableSheet> createState() => _CustomDraggableSheetState();
}

class _CustomDraggableSheetState extends State<CustomDraggableSheet> {
  late double _sheetPosition;
  late double _dragSensitivity;
  @override
  void initState() {
    super.initState();
    _sheetPosition = widget.sheetPosition ?? 0.2;
    _dragSensitivity = widget.dragSensitivity ?? 1000;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: DraggableScrollableSheet(
        minChildSize: 0.2,
        initialChildSize: _sheetPosition,
        maxChildSize: 0.9,
        builder: (context, scrollController) => Container(
            // height: 02,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSurface,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
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
                    grabberBottomWidget: widget.grabberBottomWidget,
                  ),
                  widget.sheetBody!
                ],
              ),
            )),
      ),
    );
  }
}
