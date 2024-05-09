import 'dart:math';

class IntensityModel {
  final List<double> bpms;
  final double distanceRange;
  final double rpmRange;

  IntensityModel({
    required this.bpms,
    required this.distanceRange,
    required this.rpmRange,
  });
  factory IntensityModel.mock() {
    const numPoints = 100;
    const minBpm = 90.0;
    const maxBpm = 160.0;
    const rpmRange = 180.0;
    const distanceRange = 15.0;

    List<double> bpm = List.generate(
      numPoints,
      (index) => minBpm + Random().nextDouble() * (maxBpm - minBpm),
    );

    return IntensityModel(
      bpms: bpm,
      distanceRange: distanceRange,
      rpmRange: rpmRange,
    );
  }
}
