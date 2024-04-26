extension IntegerParsing on int {
  String totalTimeToString() {
    Duration duration = Duration(seconds: this);
    String formattedTime = '${duration.inHours.toString().padLeft(2, '0')}:'
        '${(duration.inMinutes % 60).toString().padLeft(2, '0')}:'
        '${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
    return formattedTime;
  }
}
