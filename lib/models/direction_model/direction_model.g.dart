// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'direction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DirectionModel _$DirectionModelFromJson(Map<String, dynamic> json) =>
    DirectionModel(
      routes: (json['routes'] as List<dynamic>)
          .map((e) => RoutesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DirectionModelToJson(DirectionModel instance) =>
    <String, dynamic>{
      'routes': instance.routes.map((e) => e.toJson()).toList(),
    };
