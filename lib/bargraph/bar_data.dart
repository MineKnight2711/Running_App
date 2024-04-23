import 'package:flutter_running_demo/bargraph/individual_bar.dart';

class BarData {
  final double janAmount;
  final double febAmount;
  final double marAmount;
  final double aprAmount;
  final double mayAmount;
  final double junAmount;
  final double julAmount;
  final double augAmount;
  final double sepAmount;
  final double octAmount;
  final double novAmount;
  final double decAmount;

  BarData({
    required this.janAmount,
    required this.febAmount,
    required this.marAmount,
    required this.aprAmount,
    required this.mayAmount,
    required this.junAmount,
    required this.julAmount,
    required this.augAmount,
    required this.sepAmount,
    required this.octAmount,
    required this.novAmount,
    required this.decAmount,
  });
  List<IndividualBar> barData = [];
  void initalizeBarData() {
    barData = [
      IndividualBar(x: 1, y: janAmount),
      IndividualBar(x: 2, y: febAmount),
      IndividualBar(x: 3, y: marAmount),
      IndividualBar(x: 4, y: aprAmount),
      IndividualBar(x: 5, y: mayAmount),
      IndividualBar(x: 6, y: junAmount),
      IndividualBar(x: 7, y: julAmount),
      IndividualBar(x: 8, y: augAmount),
      IndividualBar(x: 9, y: sepAmount),
      IndividualBar(x: 10, y: octAmount),
      IndividualBar(x: 11, y: novAmount),
      IndividualBar(x: 12, y: decAmount),
    ];
  }
}
