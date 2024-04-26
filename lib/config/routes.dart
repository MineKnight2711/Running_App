import 'package:flutter_running_demo/screens/performance/performance_screen.dart';
import 'package:flutter_running_demo/screens/progress/activities/activities_screen.dart';
import 'package:get/get.dart';
import '../screens/progress/activities_details/activities_details.dart';

class AppRoutes {
  static const String _activities = '/';
  static const String _activitiesDetails = '/activites-details';
  static const String _performanceMetrics = '/performance-metrics';

  static String get activities => _activities;
  static String get activitiesDetais => _activitiesDetails;
  static String get performanceMetrics => _performanceMetrics;

  static navigate(String query) {
    Get.toNamed(query);
  }

  static navigateToDetails(
      String route, String queryParam, String id, dynamic arguments) {
    Get.toNamed(route.replaceFirst(':$queryParam', id), arguments: arguments);
  }

  static navigateReplace(String query) {
    Get.offNamed(query);
  }

  static navigateBack() {
    Get.back();
  }

  static final List<GetPage> getPages = [
    GetPage(
        name: _activities,
        page: () => const ActivitiesScreen(),
        transition: Transition.rightToLeft),
    GetPage(
        name: _activitiesDetails,
        page: () => const ActivitiesDetailsScreen(),
        transition: Transition.rightToLeft),
    GetPage(
        name: _performanceMetrics,
        page: () => PerformanceMetricsScreen(),
        transition: Transition.rightToLeft),
  ];
}
