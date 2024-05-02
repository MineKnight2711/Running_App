import 'individual_bar.dart';

class WeeklyActivityDistanceModel {
  final double mon;
  final double tue;
  final double wed;
  final double thu;
  final double fri;
  final double sat;
  final double sun;

  WeeklyActivityDistanceModel({
    required this.mon,
    required this.tue,
    required this.wed,
    required this.thu,
    required this.fri,
    required this.sat,
    required this.sun,
  });
  List<IndividualBar> barData = [];
  void initalizeBarData() {
    barData = [
      IndividualBar(x: 1, y: mon),
      IndividualBar(x: 2, y: tue),
      IndividualBar(x: 3, y: wed),
      IndividualBar(x: 4, y: thu),
      IndividualBar(x: 5, y: fri),
      IndividualBar(x: 6, y: sat),
      IndividualBar(x: 7, y: sun),
    ];
  }
}
