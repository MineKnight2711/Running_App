import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../config/config_export.dart';

class CustomRecordWidget extends StatelessWidget {
  final String value, unit;
  const CustomRecordWidget(
      {super.key, required this.value, required this.unit});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Expanded(
            flex: 10,
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: CustomGoogleFonts.roboto(
                fontSize: AppFontSizes.customSize(52),
                color: AppColors.white100,
              ),
            ),
          ),
          const Expanded(flex: 2, child: SizedBox.shrink()),
          Expanded(
            flex: 3,
            child: Text(
              '/km',
              textAlign: TextAlign.end,
              style: CustomGoogleFonts.roboto(
                fontSize: AppFontSizes.size18,
                color: AppColors.white100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
