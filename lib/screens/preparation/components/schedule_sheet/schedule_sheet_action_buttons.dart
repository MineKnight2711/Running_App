import 'package:flutter/material.dart';
import '../../../../config/config_export.dart';

class ScheduleSheetActionButtons extends StatelessWidget {
  final VoidCallback onSavePressed;
  final VoidCallback onDeletePressed;
  const ScheduleSheetActionButtons({
    super.key,
    required this.onSavePressed,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppSpacings.cvs(35),
          width: AppSpacings.sw(1),
          child: ElevatedButton(
            onPressed: onSavePressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.appButton,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Save',
              style: CustomGoogleFonts.roboto(
                fontSize: AppFontSizes.size16,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextButton(
          onPressed: onDeletePressed,
          child: Center(
            child: Text(
              'Delete the scheduled route',
              style: CustomGoogleFonts.roboto(
                fontSize: AppFontSizes.size16,
                color: const Color(0xffff4747),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
