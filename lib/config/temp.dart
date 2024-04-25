import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_running_demo/models/dropdown_activities_model.dart';

import '../models/trail_model.dart';

List<TrailModel> trailTempList = [
  TrailModel(
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
  TrailModel(
    title: 'Dam Sen Trail',
    place: 'District 11, Ho Cho Minh City',
    rpe: 2,
    ascent: 300,
    distance: 8.0,
    pace: 7.5,
    totalTime: 3600, // 1 hour
    calories: 520,
    haveInfo: true,
    date: DateTime(2023, 4, 22),
  ),
  TrailModel(
    title: 'Ho Ban Nguyet Trail',
    place: 'Half Moon Lake, District 7 ,Ho Cho Minh City',
    rpe: 3,
    ascent: 200,
    distance: 8.0,
    pace: 7.5,
    totalTime: 3600, // 1 hour
    calories: 520,
    haveInfo: true,
    date: DateTime(2023, 4, 22),
  ),
];
