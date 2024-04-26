// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrailModel _$TrailModelFromJson(Map<String, dynamic> json) => TrailModel(
      rpe: (json['rpe'] as num).toInt(),
      title: json['title'] as String,
      place: json['place'] as String,
      ascent: (json['ascent'] as num).toDouble(),
      distance: (json['distance'] as num).toDouble(),
      pace: (json['pace'] as num).toDouble(),
      totalTime: (json['totalTime'] as num).toInt(),
      calories: (json['calories'] as num).toDouble(),
      haveInfo: json['haveInfo'] as bool,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$TrailModelToJson(TrailModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'place': instance.place,
      'ascent': instance.ascent,
      'distance': instance.distance,
      'pace': instance.pace,
      'totalTime': instance.totalTime,
      'rpe': instance.rpe,
      'calories': instance.calories,
      'haveInfo': instance.haveInfo,
      'date': instance.date.toIso8601String(),
    };
