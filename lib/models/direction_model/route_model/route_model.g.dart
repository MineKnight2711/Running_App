// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoutesModel _$RoutesModelFromJson(Map<String, dynamic> json) => RoutesModel(
      legs: (json['legs'] as List<dynamic>)
          .map((e) => LegsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RoutesModelToJson(RoutesModel instance) =>
    <String, dynamic>{
      'legs': instance.legs.map((e) => e.toJson()).toList(),
    };
