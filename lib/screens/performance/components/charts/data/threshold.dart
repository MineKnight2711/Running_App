class ThresholdModel {
  final double thresholdPercent;
  final int intensityPercent;
  final int bpmThreshold;

  ThresholdModel(
      {required this.intensityPercent,
      required this.thresholdPercent,
      required this.bpmThreshold});
}
