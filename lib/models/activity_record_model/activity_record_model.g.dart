// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityRecordModel _$ActivityRecordModelFromJson(Map<String, dynamic> json) =>
    ActivityRecordModel(
      time: (json['time'] as num).toDouble(),
      ascent: (json['ascent'] as num).toDouble(),
      calories: (json['calories'] as num).toDouble(),
      distance: (json['distance'] as num).toDouble(),
      dateRecord: DateTime.parse(json['dateRecord'] as String),
    );

Map<String, dynamic> _$ActivityRecordModelToJson(
        ActivityRecordModel instance) =>
    <String, dynamic>{
      'distance': instance.distance,
      'time': instance.time,
      'ascent': instance.ascent,
      'calories': instance.calories,
      'dateRecord': instance.dateRecord.toIso8601String(),
    };
