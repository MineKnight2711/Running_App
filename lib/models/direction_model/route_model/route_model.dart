import 'package:json_annotation/json_annotation.dart';

import 'leg_model/leg_model.dart';
part 'route_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RoutesModel {
  final List<LegsModel> legs;

  RoutesModel({
    required this.legs,
  });

  factory RoutesModel.fromJson(Map<String, dynamic> json) =>
      _$RoutesModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoutesModelToJson(this);
}
