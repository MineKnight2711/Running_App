import 'package:flutter_running_demo/models/direction_model/route_model/route_model.dart';
import 'package:json_annotation/json_annotation.dart';
part "direction_model.g.dart";

@JsonSerializable(explicitToJson: true)
class DirectionModel {
  final List<RoutesModel> routes;

  DirectionModel({required this.routes});

  factory DirectionModel.fromJson(Map<String, dynamic> json) =>
      _$DirectionModelFromJson(json);

  Map<String, dynamic> toJson() => _$DirectionModelToJson(this);
}
