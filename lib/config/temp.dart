import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_running_demo/models/line_chart_point.dart';
import '../models/dropdown_activities_model.dart';
import '../models/route_model/route_model.dart';

List<RouteModel> routeTempList = [
  RouteModel(
    title: 'Ben Thanh Trail',
    place: 'Ben Thanh Market, Ho Cho Minh City',
    rpe: 1,
    ascent: 500,
    distance: 10.5,
    pace: 8.2,
    totalTime: 5400, // 1 hour 30 minutes
    calories: 650,
    haveInfo: true,
    date: DateTime(2023, 4, 24),
  ),
  RouteModel(
    title: 'Dam Sen Trail',
    place: 'District 11, Ho Cho Minh City',
    rpe: 2,
    ascent: 300,
    distance: 8.0,
    pace: 7.5,
    totalTime: 3600, // 1 hour
    calories: 520,
    haveInfo: false,
    date: DateTime(2023, 4, 22),
  ),
  RouteModel(
    title: 'Ho Ban Nguyet Trail',
    place: 'Half Moon Lake, District 7 ,Ho Cho Minh City',
    rpe: 3,
    ascent: 200,
    distance: 8.0,
    pace: 7.5,
    totalTime: 3600, // 1 hour
    calories: 520,
    haveInfo: false,
    date: DateTime(2023, 4, 22),
  ),
];

List<LineChartPoint> get lineChartPoints {
  final random = Random();
  final data = List.generate(43, (index) {
    final x = index.toDouble();
    final randomOffset =
        random.nextDouble() * 10; // Random offset between 0 and 10
    final y = 125 + 17.5 * sin(2 * pi * (x + randomOffset) / 15);
    return LineChartPoint(x: x, y: y);
  });

  return data;
}

List<LineChartPoint> get rpePoints {
  final random = Random();
  return lineChartPoints
      .map((point) => LineChartPoint(
            x: point.x,
            y: 90 +
                (point.y - 125) +
                random.nextDouble() * 30, // Random value between 0 and 30
          ))
      .toList();
}

List<ActivitiesDropDownModel> activitiesDropDownList = [
  ActivitiesDropDownModel(
    icon: Icons.run_circle_rounded,
    activityIndex: '4.2/km',
    achievements: "Longest run",
  ),
  ActivitiesDropDownModel(
    icon: Icons.hiking,
    activityIndex: '500m',
    achievements: "Highest hiking",
  ),
  ActivitiesDropDownModel(
    icon: Icons.directions_walk,
    activityIndex: '20km',
    achievements: "Longest walk",
  ),
];
List<ActivitiesDropDownModel> activitiesDropDownList2 = [
  ActivitiesDropDownModel(
    icon: Icons.route,
    activityIndex: '242.2km',
    achievements: "Longest traveling",
  ),
  ActivitiesDropDownModel(
    icon: Icons.pedal_bike,
    activityIndex: '500m',
    achievements: "Longest bycycling",
  ),
  ActivitiesDropDownModel(
    icon: Icons.sports_gymnastics,
    activityIndex: '10hour',
    achievements: "Longest training",
  ),
];
