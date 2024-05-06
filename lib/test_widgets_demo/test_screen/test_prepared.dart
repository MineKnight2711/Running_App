import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../screens/performance/components/period_button_row.dart';

class TestPrepared extends StatefulWidget {
  TestPrepared({super.key});

  @override
  State<TestPrepared> createState() => _TestPreparedState();
}

class _TestPreparedState extends State<TestPrepared> {
  double _sheetPosition = 0.2;
  final double _dragSensitivity = 1000;

  final List<String> periodButtonRow = [
    'Favorites',
    'Add_new',
    'Upcoming',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DraggableScrollableSheet(
        // expand: false,

        minChildSize: 0.2,
        initialChildSize: _sheetPosition,
        maxChildSize: 0.9,
        builder: (context, scrollController) => Container(
          color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Grabber(
                onVerticalDragUpdate: (DragUpdateDetails details) {
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
              ),
              // Container(
              //   width: 40,
              //   height: 2,
              //   margin: EdgeInsets.only(bottom: 10.h),
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(50),
              //       color: const Color(0xffb4aeab)),
              // ),
              PeriodButtonRow(
                listButton: periodButtonRow,
              ),
              SizedBox(
                width: 1.sw,
                height: 0.4.sh,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.symmetric(vertical: 5.h),
                    width: 1.sw,
                    height: 0.2.sh,
                    color: Colors.red,
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Grabber extends StatelessWidget {
  const Grabber({
    super.key,
    required this.onVerticalDragUpdate,
  });

  final ValueChanged<DragUpdateDetails> onVerticalDragUpdate;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onVerticalDragUpdate: onVerticalDragUpdate,
      child: Container(
        width: double.infinity,
        color: colorScheme.onSurface,
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            width: 32.0,
            height: 4.0,
            decoration: BoxDecoration(
              color: colorScheme.surfaceVariant,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),
    );
  }
}
