class TopRouteModel {
  final int attemps, rpePoint;
  final double longitude, latitude, distance;
  final String routeTitle;
  final Duration time;

  TopRouteModel(
      {required this.attemps,
      required this.rpePoint,
      required this.longitude,
      required this.latitude,
      required this.distance,
      required this.routeTitle,
      required this.time});
}
