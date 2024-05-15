import 'package:flutter/material.dart';
import '../../../../config/config_export.dart';

class RecordFieldWidget extends StatelessWidget {
  final String label;
  final Widget recordField;
  const RecordFieldWidget(
      {super.key, required this.recordField, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      height: AppSpacings.customVerticalSpacing(90),
      width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xff2c2a2d),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: CustomGoogleFonts.roboto(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          recordField
        ],
      ),
    );
  }
}
