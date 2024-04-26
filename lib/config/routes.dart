import 'package:flutter/material.dart';
import 'package:flutter_running_demo/screens/progress/activities/activities_screen.dart';
import 'package:get/get.dart';

import '../screens/progress/activities_details/activities_details.dart';

class AppRoutes {
  static const String _activities = '/';
  static const String _activitiesDetails = '/activites-details';

  static String get activities => _activities;
  static String get activitiesDetais => _activitiesDetails;

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
  ];
  // static final Map<String, WidgetBuilder> webRoute = {
  //   _activities: (context) => const ActivitiesScreen(),
  //   _activitiesDetails: (context) => const ActivitiesDetailsScreen(),
  // };
}
