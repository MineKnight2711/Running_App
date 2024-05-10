import 'package:flutter/material.dart';
import 'package:flutter_running_demo/screens/performance/components/charts/data/nested_chart_tempdata.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/config_export.dart';

class LeftChartAxisTile extends StatelessWidget {
  final double value;
  final DetailsRecordType detailsRecordType;
  const LeftChartAxisTile({
    super.key,
    required this.value,
    required this.detailsRecordType,
  });

  @override
  Widget build(BuildContext context) {
    String label = "";
    switch (detailsRecordType) {
      case DetailsRecordType.distance:
        label =
            value.toStringAsFixed(0) == "0" ? "km" : value.toStringAsFixed(0);
        break;
      case DetailsRecordType.time:
        label =
            value.toStringAsFixed(0) == "0" ? "hour" : value.toStringAsFixed(0);
        break;
      case DetailsRecordType.ascent:
        label =
            value.toStringAsFixed(0) == "0" ? "m" : value.toStringAsFixed(0);

        break;
      case DetailsRecordType.calories:
        label =
            value.toStringAsFixed(0) == "0" ? "cal" : value.toStringAsFixed(0);

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
  }
}
