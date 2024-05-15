import 'package:flutter/material.dart';
import '../../../../config/config_export.dart';

class CustomRecordWidget extends StatelessWidget {
  final String value, unit;
  const CustomRecordWidget(
      {super.key, required this.value, required this.unit});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Spacer(),
          Text(
            value,
            style: CustomGoogleFonts.roboto(
                fontSize: AppFontSizes.customSize(52),
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          const Spacer(),
          Text(
            unit,
            style: CustomGoogleFonts.roboto(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
