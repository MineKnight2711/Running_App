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
  factory IntensityModel.mock(
      {required double minBpm,
      required double maxBpm,
      required int numPoints}) {
    const numPoints = 40;
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
