import 'package:json_annotation/json_annotation.dart';
part 'runner_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RunnerModel {
  final int id;
  final String name;
  final DateTime dateRecord;
  final Duration time;
  final double record;

  RunnerModel(
      {required this.id,
      required this.name,
      required this.dateRecord,
      required this.time,
      required this.record});
  factory RunnerModel.fromJson(Map<String, dynamic> json) =>
      _$RunnerModelFromJson(json);

  Map<String, dynamic> toJson() => _$RunnerModelToJson(this);
}
