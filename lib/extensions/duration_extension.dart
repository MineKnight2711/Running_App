extension DurationParsing on Duration {
  String durationToString() {
    String formattedTime = '${inHours.toString().padLeft(2, '0')}:'
        '${(inMinutes % 60).toString().padLeft(2, '0')}:'
        '${(inSeconds % 60).toString().padLeft(2, '0')}';
    return formattedTime;
  }

  String durationToHour() {
    String formattedTime = '${inHours.toString()}h${(inMinutes % 60)}m';
    return formattedTime;
  }

  Duration sum(Duration other) =>
      Duration(seconds: inSeconds + other.inSeconds);
}
