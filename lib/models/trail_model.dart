class TrailModel {
  final String title;
  final String place;
  final double ascent;
  final double distance;
  final double pace;
  final int totalTime, rpe;
  final double calories;
  final bool haveInfo;
  final DateTime date;

  TrailModel({
    required this.rpe,
    required this.title,
    required this.place,
    required this.ascent,
    required this.distance,
    required this.pace,
    required this.totalTime,
    required this.calories,
    required this.haveInfo,
    required this.date,
  });
}
