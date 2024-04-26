import 'package:json_annotation/json_annotation.dart';
part "trail_model.g.dart";

@JsonSerializable(explicitToJson: true)
class TrailModel {
  final String title;
  final String place;
  final double ascent;
  final double distance;
  final double pace;
  final int totalTime, rpe;
  final double calories;
  final bool haveInfo;
  final DateTime date;

  TrailModel({
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
  factory TrailModel.fromJson(Map<String, dynamic> json) =>
      _$TrailModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrailModelToJson(this);
}
