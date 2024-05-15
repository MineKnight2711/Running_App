// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'runner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RunnerModel _$RunnerModelFromJson(Map<String, dynamic> json) => RunnerModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      dateRecord: DateTime.parse(json['dateRecord'] as String),
      time: Duration(microseconds: (json['time'] as num).toInt()),
      record: (json['record'] as num).toDouble(),
    );

Map<String, dynamic> _$RunnerModelToJson(RunnerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'dateRecord': instance.dateRecord.toIso8601String(),
      'time': instance.time.inMicroseconds,
      'record': instance.record,
    };
