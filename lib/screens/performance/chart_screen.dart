import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_running_demo/screens/performance/bargraph/bar_graph.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Chartscreen extends StatefulWidget {
  const Chartscreen({super.key});

  @override
  State<Chartscreen> createState() => _ChartscreenState();
}

class _ChartscreenState extends State<Chartscreen> {
  List<double> monthSummary = [
    4.40,
    2.50,
    43.42,
    10.50,
    100.20,
    88.89,
    90.10,
    4.40,
    2.50,
    43.42,
    10.50,
    100.20,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 50.h),
          height: 1.sh,
          width: 1.sw,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyBarGraph(
                monthSummary: monthSummary,
              ),
              WidgetDropDown(),
            ],
          )),
    );
  }
}

class WidgetDropDown extends StatefulWidget {
  WidgetDropDown({super.key});

  @override
  State<WidgetDropDown> createState() => _WidgetDropDownState();
}

class _WidgetDropDownState extends State<WidgetDropDown> {
  bool isStrecheDropdown = false;
  String dropdownValue = "one";

  @override
  Widget build(BuildContext context) {
    return Center(
        child: DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.menu),
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.white,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: const [
        DropdownMenuItem<String>(
          value: ('one'),
          child: Text('2,73/km fastest run'),
        ),
        DropdownMenuItem<String>(
          value: 'two',
          child: Text('two'),
        ),
        DropdownMenuItem<String>(
          value: 'three',
          child: Text('three'),
        ),
      ],
    ));
  }
}
