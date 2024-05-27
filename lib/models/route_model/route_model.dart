import 'package:json_annotation/json_annotation.dart';
part "route_model.g.dart";

@JsonSerializable(explicitToJson: true)
class RouteModel {
  final String title, place, imagePath;
  final double longitude, latitude, distance, ascent, pace;
  final int rpe, attemps;
  final double calories;
  final bool haveInfo;
  final DateTime date;
  final Duration time;
  final List<String> images;

  RouteModel(
      {required this.title,
      required this.place,
      required this.imagePath,
      required this.longitude,
      required this.latitude,
      required this.distance,
      required this.ascent,
      required this.pace,
      required this.rpe,
      required this.attemps,
      required this.calories,
      required this.haveInfo,
      required this.date,
      required this.time,
      required this.images});
  factory RouteModel.fromJson(Map<String, dynamic> json) =>
      _$RouteModelFromJson(json);

  Map<String, dynamic> toJson() => _$RouteModelToJson(this);
}
