// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leg_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LegsModel _$LegsModelFromJson(Map<String, dynamic> json) => LegsModel(
      endLocation:
          LocationModel.fromJson(json['end_location'] as Map<String, dynamic>),
      startLocation: LocationModel.fromJson(
          json['start_location'] as Map<String, dynamic>),
      steps: (json['steps'] as List<dynamic>)
          .map((e) => StepsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LegsModelToJson(LegsModel instance) => <String, dynamic>{
      'end_location': instance.endLocation.toJson(),
      'start_location': instance.startLocation.toJson(),
      'steps': instance.steps.map((e) => e.toJson()).toList(),
    };
