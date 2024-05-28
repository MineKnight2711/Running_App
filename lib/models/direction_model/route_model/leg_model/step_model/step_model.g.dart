// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StepsModel _$StepsModelFromJson(Map<String, dynamic> json) => StepsModel(
      endLocation:
          LocationModel.fromJson(json['end_location'] as Map<String, dynamic>),
      startLocation: LocationModel.fromJson(
          json['start_location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StepsModelToJson(StepsModel instance) =>
    <String, dynamic>{
      'end_location': instance.endLocation.toJson(),
      'start_location': instance.startLocation.toJson(),
    };
