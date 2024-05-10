import 'package:flutter/material.dart';
import 'package:flutter_running_demo/extensions/datetime_extension.dart';
import 'package:flutter_running_demo/extensions/integer_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/colors.dart';
import '../../../../../config/fonts.dart';
import '../../../../../models/activity_record_model/activity_record_model.dart';
import '../data/nested_chart_tempdata.dart';

class BottomChartAxisTile extends StatelessWidget {
  const BottomChartAxisTile({
    super.key,
    required this.records,
    required this.recordType,
    required this.value,
  });
  final int value;
  final List<ActivityRecordModel> records;
  final RecordType recordType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (value > 0 && value < records.length + 1)
            ? Container(width: 0.5, height: 4, color: AppColors.white100)
            : const SizedBox.shrink(),
        (() {
          String label = "";
          switch (recordType) {
            case RecordType.weekly:
              label = value.toInt().getDayLabel();
              break;
            case RecordType.monthly:
              if (value == 5 || value == 15 || value == records.length - 1) {
                label = records[value.toInt()].dateRecord.toDayAndMonthString();
              }
              break;
            case RecordType.yearly:
              if (value > 0 && value < records.length + 1) {
                label = value.toInt().getMonthLabel();
              }

              break;

            default:
              break;
          }
          return Text(
            label,
            style: CustomGoogleFonts.roboto(
                fontSize: 10.r,
                color: AppColors.white100,
                fontWeight: FontWeight.w200),
          );
        })()
      ],
    );
  }
}
