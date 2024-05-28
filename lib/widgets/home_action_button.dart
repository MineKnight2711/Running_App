import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../config/colors.dart';

class ActionButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;
  const ActionButton({
    super.key,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: onTap,
      child: CircleAvatar(
        radius: 16,
        backgroundColor: AppColors.white100.withOpacity(0.1),
        child: SvgPicture.asset(imagePath),
      ),
    );
  }
}
