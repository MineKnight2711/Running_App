import 'package:json_annotation/json_annotation.dart';

part "activity_record_model.g.dart";

@JsonSerializable(explicitToJson: true)
class ActivityRecordModel {
  final double distance, time, ascent, calories;
  final DateTime dateRecord;

  ActivityRecordModel({
    required this.time,
    required this.ascent,
    required this.calories,
    required this.distance,
    required this.dateRecord,
  });

  factory ActivityRecordModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityRecordModelFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityRecordModelToJson(this);
}
