class PulseRateChartData {
  final int color;
  final String intensityThresholdLabel;
  final double pulseRateZones;
  final Duration intensityDuration;

  PulseRateChartData(
      {required this.color,
      required this.intensityThresholdLabel,
      required this.pulseRateZones,
      required this.intensityDuration});
}
