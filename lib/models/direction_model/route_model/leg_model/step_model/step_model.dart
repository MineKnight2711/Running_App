import 'package:json_annotation/json_annotation.dart';

import '../../location_model/location_model.dart';
part 'step_model.g.dart';

@JsonSerializable(explicitToJson: true)
class StepsModel {
  final LocationModel endLocation;

  final LocationModel startLocation;

  StepsModel({
    required this.endLocation,
    required this.startLocation,
  });
  factory StepsModel.fromJson(Map<String, dynamic> json) =>
      _$StepsModelFromJson(json);

  Map<String, dynamic> toJson() => _$StepsModelToJson(this);
}
