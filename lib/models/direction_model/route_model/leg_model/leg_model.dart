import 'package:json_annotation/json_annotation.dart';

import '../location_model/location_model.dart';
import 'step_model/step_model.dart';
part 'leg_model.g.dart';

@JsonSerializable(explicitToJson: true)
class LegsModel {
  final LocationModel endLocation;
  final LocationModel startLocation;
  final List<StepsModel> steps;

  LegsModel({
    required this.endLocation,
    required this.startLocation,
    required this.steps,
  });

  factory LegsModel.fromJson(Map<String, dynamic> json) =>
      _$LegsModelFromJson(json);

  Map<String, dynamic> toJson() => _$LegsModelToJson(this);
}
