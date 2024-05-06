class TrainingSession {
  final Duration totalDuration;
  final List<HeartRateRange> heartRateRanges;

  TrainingSession({required this.totalDuration, required this.heartRateRanges});
}

class HeartRateRange {
  final int minBpm;
  final int maxBpm;
  final Duration duration;

  HeartRateRange({
    required this.minBpm,
    required this.maxBpm,
    required this.duration,
  });
}
