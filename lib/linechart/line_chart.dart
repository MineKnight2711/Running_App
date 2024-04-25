import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_running_demo/linechart/pricePoints.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LineChartWidget extends StatelessWidget {
  final List<Pricepoints> points;
  const LineChartWidget(this.points, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownMenuExample(),
          PillButtonRow(),
          const nonButton(),
          AspectRatio(
            aspectRatio: 2,
            child: LineChart(
              LineChartData(
                titlesData: const FlTitlesData(
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                lineBarsData: [
                  LineChartBarData(
                      spots: points
                          .map((point) => FlSpot(point.x, point.y))
                          .toList(),
                      isCurved: false,
                      dotData: const FlDotData(show: true))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PillButtonRow extends StatefulWidget {
  @override
  _PillButtonRowState createState() => _PillButtonRowState();
}

class _PillButtonRowState extends State<PillButtonRow> {
  List<String> buttonTexts = ['Week', 'Month', 'Year'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(50)),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 1.sw,
      height: 50.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: buttonTexts
            .asMap()
            .entries
            .map(
              (entry) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 5.h),
                child: Row(
                  children: [
                    PillButton(
                      buttonText: entry.value,
                      isSelected: selectedIndex == entry.key,
                      onPressed: () {
                        setState(() {
                          selectedIndex = entry.key;
                        });
                      },
                    ),
                    if (entry.key != buttonTexts.length - 1)
                      Padding(
                        padding: EdgeInsets.only(left: 9.w),
                        child: const Text('|'),
                      ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class PillButton extends StatelessWidget {
  final String buttonText;
  final bool isSelected;
  final VoidCallback onPressed;

  PillButton({
    required this.buttonText,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange : Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Colors.grey),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class nonButton extends StatefulWidget {
  const nonButton({super.key});

  @override
  State<nonButton> createState() => _nonButtonState();
}

class _nonButtonState extends State<nonButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
      const SizedBox(
        height: 30,
      ),
      ElevatedButton(
        onPressed: () {},
        child: const Text('Distance'),
      ),
      const SizedBox(
        height: 30,
      ),
      ElevatedButton(
        onPressed: () {},
        child: const Text('Time'),
      ),
      const SizedBox(
        height: 30,
      ),
      ElevatedButton(
        onPressed: () {},
        child: const Text('Ascent'),
      ),
      const SizedBox(
        height: 30,
      ),
      ElevatedButton(
        onPressed: () {},
        child: const Text('Calories'),
      )
    ]));
  }
}

class DropdownMenuExample extends StatefulWidget {
  @override
  _DropdownMenuExampleState createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  String _selectedValue = '2.73';
  final List<String> _options = ['2.73', '3.14', '4.20', '5.67'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: DropdownButton<String>(
        value: _selectedValue,
        icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: Colors.black),
        underline: Container(),
        onChanged: (String? newValue) {
          setState(() {
            _selectedValue = newValue!;
          });
        },
        items: _options.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Row(
              children: [
                Icon(Icons.arrow_forward_ios),
                Text(
                  '$value km - fastest run',
                  style: TextStyle(
                      color:
                          value == _selectedValue ? Colors.grey : Colors.black),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
