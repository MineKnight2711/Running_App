import 'package:json_annotation/json_annotation.dart';
part "route_model.g.dart";

@JsonSerializable(explicitToJson: true)
class RouteModel {
  final String title;
  final String place;
  final double ascent;
  final double distance;
  final double pace;
  final int totalTime, rpe;
  final double calories;
  final bool haveInfo;
  final DateTime date;

  RouteModel({
    required this.rpe,
    required this.title,
    required this.place,
    required this.ascent,
    required this.distance,
    required this.pace,
    required this.totalTime,
    required this.calories,
    required this.haveInfo,
    required this.date,
  });
  factory RouteModel.fromJson(Map<String, dynamic> json) =>
      _$RouteModelFromJson(json);

  Map<String, dynamic> toJson() => _$RouteModelToJson(this);
}
