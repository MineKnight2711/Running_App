import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_running_demo/models/line_chart_point.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LineChartWidget extends StatelessWidget {
  final List<LineChartPoint> points;
  const LineChartWidget({super.key, required this.points});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ignore: prefer_const_constructors
          PillButtonRow(),
          const TrailDetailsButtons(),
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
                      // isStrokeCapRound: true,
                      spots: points
                          .map((point) => FlSpot(point.x, point.y))
                          .toList(),
                      isCurved: false,
                      dotData: const FlDotData(show: true))
                ],
              ),
            ),
          ),
          const Containertotal(),
        ],
      ),
    );
  }
}

class PillButtonRow extends StatefulWidget {
  const PillButtonRow({super.key});

  @override
  PillButtonRowState createState() => PillButtonRowState();
}

class PillButtonRowState extends State<PillButtonRow> {
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

  const PillButton({
    super.key,
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

class TrailDetailsButtons extends StatefulWidget {
  const TrailDetailsButtons({super.key});

  @override
  State<TrailDetailsButtons> createState() => _TrailDetailsButtonsState();
}

class _TrailDetailsButtonsState extends State<TrailDetailsButtons> {
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

class Containertotal extends StatefulWidget {
  const Containertotal({super.key});

  @override
  State<Containertotal> createState() => _ContainerState();
}

class _ContainerState extends State<Containertotal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      margin: const EdgeInsets.symmetric(horizontal: 80),
      width: 1.sw,
      height: 50.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              width: 0.3.sw,
              height: 50.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(12)),
              child: const Text('136km  Totaldistance')),
          const SizedBox(
            width: 20,
          ),
          Container(
              width: 0.2.sw,
              height: 50.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(12)),
              child: const Text('8               total run')),
        ],
      ),
    );
  }
}