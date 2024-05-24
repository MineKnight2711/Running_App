import 'package:flutter/material.dart';
import '../../../../../../../config/config_export.dart';

class ReadyToRunSheetGoButton extends StatelessWidget {
  final Color goButtonColor;
  final String buttonText;
  final VoidCallback onGoPressed;
  const ReadyToRunSheetGoButton({
    super.key,
    required this.onGoPressed,
    required this.goButtonColor,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onGoPressed,
      child: CircleAvatar(
        radius: 50,
        backgroundColor: AppColors.white100.withOpacity(0.05),
        child: CircleAvatar(
          backgroundColor: AppColors.white100.withOpacity(0.05),
          radius: 45,
          child: Container(
            width: 80,
            decoration: BoxDecoration(
              color: goButtonColor,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              buttonText,
              style: CustomGoogleFonts.roboto(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
