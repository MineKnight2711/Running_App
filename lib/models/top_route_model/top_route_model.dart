class TopRouteModel {
  final int attemps, rpePoint;
  final double longitude, latitude, distance;
  final String routeTitle, imagePath;
  final Duration time;
  final List<String> images;
  TopRouteModel({
    required this.attemps,
    required this.rpePoint,
    required this.longitude,
    required this.latitude,
    required this.distance,
    required this.imagePath,
    required this.routeTitle,
    required this.time,
    required this.images,
  });
}
