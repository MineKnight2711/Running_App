import 'package:flutter/material.dart';
import '../../../../../config/config_export.dart';

class ShareOption extends StatelessWidget {
  final String image, option;
  final VoidCallback onTap;
  const ShareOption({
    super.key,
    required this.image,
    required this.option,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        height: AppSpacings.cvs(40),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: const Color(0xFFFFFFFF).withOpacity(0.2),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/activities_details/$image.png",
            ),
            SizedBox(
              width: AppSpacings.chs(12),
            ),
            Text(
              option,
              style: CustomGoogleFonts.roboto(
                fontSize: AppFontSizes.size14,
                color: AppColors.white100,
              ),
            )
          ],
        ),
      ),
    );
  }
}
