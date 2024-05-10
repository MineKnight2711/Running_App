import 'package:flutter/material.dart';
import 'package:flutter_running_demo/screens/performance/components/charts/data/nested_chart_tempdata.dart';
import 'charts/my_barchart.dart';
import 'charts/my_linechart.dart';

class NestedChart extends StatelessWidget {
  const NestedChart({
    super.key,
    required this.recordType,
    required this.detailsRecordType,
  });
  final RecordType recordType;
  final DetailsRecordType detailsRecordType;
  @override
  Widget build(BuildContext context) {
    final records =
        NestedChartTempData.generateActivityDistances(2024, 5, 28, recordType);
    return Stack(
      children: [
        MyLineChart(
          records: records,
          recordType: recordType,
          detailsRecordType: detailsRecordType,
        ),
        MyBarChart(
          records: records,
          recordType: recordType,
          detailsRecordType: detailsRecordType,
        ),
      ],
    );
  }
}
