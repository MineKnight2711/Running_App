import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/colors.dart';
import '../../../config/fonts.dart';

class ProgressAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProgressAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        splashColor: AppColors.transparent,
        icon: const Icon(Icons.arrow_back, color: AppColors.white100),
        onPressed: () {},
      ),
      title: Text(
        "Be active",
        style:
            CustomGoogleFonts.roboto(color: AppColors.white100, fontSize: 14.r),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.white100.withOpacity(0.1),
            child: Image.asset(
              "assets/images/home.png",
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
