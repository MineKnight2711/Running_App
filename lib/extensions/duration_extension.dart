extension DurationParsing on Duration {
  String durationToString() {
    String formattedTime = '${inHours.toString().padLeft(2, '0')}:'
        '${(inMinutes % 60).toString().padLeft(2, '0')}:'
        '${(inSeconds % 60).toString().padLeft(2, '0')}';
    return formattedTime;
  }

  Duration sum(Duration other) =>
      Duration(seconds: inSeconds + other.inSeconds);
}
