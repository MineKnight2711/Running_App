// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RouteModel _$RouteModelFromJson(Map<String, dynamic> json) => RouteModel(
      title: json['title'] as String,
      place: json['place'] as String,
      imagePath: json['imagePath'] as String,
      longitude: (json['longitude'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
      distance: (json['distance'] as num).toDouble(),
      ascent: (json['ascent'] as num).toDouble(),
      pace: (json['pace'] as num).toDouble(),
      rpe: (json['rpe'] as num).toInt(),
      attemps: (json['attemps'] as num).toInt(),
      calories: (json['calories'] as num).toDouble(),
      haveInfo: json['haveInfo'] as bool,
      date: DateTime.parse(json['date'] as String),
      time: Duration(microseconds: (json['time'] as num).toInt()),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$RouteModelToJson(RouteModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'place': instance.place,
      'imagePath': instance.imagePath,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'distance': instance.distance,
      'ascent': instance.ascent,
      'pace': instance.pace,
      'rpe': instance.rpe,
      'attemps': instance.attemps,
      'calories': instance.calories,
      'haveInfo': instance.haveInfo,
      'date': instance.date.toIso8601String(),
      'time': instance.time.inMicroseconds,
      'images': instance.images,
    };
