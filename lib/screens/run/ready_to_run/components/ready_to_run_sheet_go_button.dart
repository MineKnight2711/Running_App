import 'package:flutter/material.dart';
import '../../../../config/config_export.dart';

class ReadyToRunSheetGoButton extends StatelessWidget {
  const ReadyToRunSheetGoButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {},
        child: CircleAvatar(
          radius: 45,
          backgroundColor: AppColors.white100.withOpacity(0.05),
          child: CircleAvatar(
            backgroundColor: AppColors.white100.withOpacity(0.05),
            radius: 40,
            child: Container(
              width: 70,
              decoration: const BoxDecoration(
                gradient: AppColors.comfirmButtonDefaultGradient,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                'Go',
                style: CustomGoogleFonts.roboto(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
