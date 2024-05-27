import 'dart:math';
import 'package:flutter_running_demo/models/activity_record_model/individual_bar.dart';

import '../../../../../models/activity_record_model/activity_record_model.dart';

enum RecordType { weekly, monthly, yearly }

enum DetailsRecordType { distance, time, ascent, calories }

class NestedChartTempData {
  static double _generateRandomDouble({
    required double min,
    required double max,
    int decimalPlaces = 2,
  }) {
    double random = Random().nextDouble();

    double scaledRandom = min + random * (max - min);

    double roundedValue =
        double.parse(scaledRandom.toStringAsFixed(decimalPlaces));

    return roundedValue;
  }

  static List<ActivityRecordModel> generateActivityDistances(
      int year, int month, int day, RecordType generateType) {
    List<ActivityRecordModel> generatedList = [];
    DateTime startDate = DateTime(year, month, day);

    switch (generateType) {
      case RecordType.weekly:
        for (int i = 0; i < 7; i++) {
          DateTime currentDate = startDate.add(Duration(days: i));
          generatedList.add(ActivityRecordModel(
              distance:
                  _generateRandomDouble(min: 0, max: 30, decimalPlaces: 2),
              time: _generateRandomDouble(min: 0, max: 3, decimalPlaces: 3),
              ascent: _generateRandomDouble(min: 0, max: 50, decimalPlaces: 2),
              calories:
                  _generateRandomDouble(min: 0, max: 500, decimalPlaces: 2),
              dateRecord: currentDate));
        }
        break;
      case RecordType.monthly:
        int daysInMonth = DateTime(year, month + 1, 0).day;
        for (int i = 0; i < daysInMonth; i++) {
          DateTime currentDate = startDate.add(Duration(days: i));
          generatedList.add(ActivityRecordModel(
              distance:
                  _generateRandomDouble(min: 0, max: 30, decimalPlaces: 2),
              time: _generateRandomDouble(min: 0, max: 3, decimalPlaces: 3),
              ascent: _generateRandomDouble(min: 0, max: 50, decimalPlaces: 2),
              calories:
                  _generateRandomDouble(min: 0, max: 500, decimalPlaces: 2),
              dateRecord: currentDate));
        }
        break;
      case RecordType.yearly:
        generatedList = generateMonthlyAverages(year);

        break;
    }
    return generatedList;
  }

  static List<ActivityRecordModel> generateMonthlyAverages(int year) {
    List<ActivityRecordModel> monthlyAverages = [];

    for (int month = 1; month <= 12; month++) {
      // Xác định số ngày trong tháng
      int daysInMonth = DateTime(year, month + 1, 0).day;

      // Tạo ngẫu nhiên danh sách distances trong ngày trong số ngày của tháng
      List<double> distances =
          List.generate(daysInMonth, (_) => Random().nextDouble() * 20);

      // Tính trung bình distances của tháng
      double averageDistance =
          distances.reduce((value, element) => value + element) / daysInMonth;

      // khởi tạo ActivityRecordModel với ngày record là ngày đầu tiên của tháng và add vào monthlyAverages
      DateTime dateRecord = DateTime(year, month, 1);
      monthlyAverages.add(ActivityRecordModel(
          distance: averageDistance,
          time: _generateRandomDouble(min: 0, max: 2.5, decimalPlaces: 3),
          ascent: _generateRandomDouble(min: 0, max: 50, decimalPlaces: 2),
          calories: _generateRandomDouble(min: 0, max: 500, decimalPlaces: 2),
          dateRecord: dateRecord));
    }

    return monthlyAverages;
  }

  static List<IndividualBar> weeklyIndividualBar(
      List<ActivityRecordModel> listRecord, DetailsRecordType yAxisType) {
    List<IndividualBar> weeklyIndividualBar = [];
    int index = 1;
    switch (yAxisType) {
      case DetailsRecordType.distance:
        for (int i = 0; i < listRecord.length; i++) {
          weeklyIndividualBar
              .add(IndividualBar(x: index, y: listRecord[i].distance));
          index++;
        }
        break;
      case DetailsRecordType.time:
        for (int i = 0; i < listRecord.length; i++) {
          weeklyIndividualBar
              .add(IndividualBar(x: index, y: listRecord[i].time));
          index++;
        }
        break;
      case DetailsRecordType.ascent:
        for (int i = 0; i < listRecord.length; i++) {
          weeklyIndividualBar
              .add(IndividualBar(x: index, y: listRecord[i].ascent));
          index++;
        }
        break;
      case DetailsRecordType.calories:
        for (int i = 0; i < listRecord.length; i++) {
          weeklyIndividualBar
              .add(IndividualBar(x: index, y: listRecord[i].calories));
          index++;
        }
        break;
      default:
    }

    return weeklyIndividualBar;
  }
}
