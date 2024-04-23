import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/colors.dart';
import '../../../../config/fonts.dart';

class ProgressAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function()? onBackPress;
  const ProgressAppBar({super.key, required this.title, this.onBackPress});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        splashColor: AppColors.transparent,
        icon: const Icon(Icons.arrow_back, color: AppColors.white100),
        onPressed: onBackPress,
      ),
      title: Text(
        title,
        style:
            CustomGoogleFonts.roboto(color: AppColors.white100, fontSize: 14.r),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: CircleAvatar(
            radius: 18,
            backgroundColor: AppColors.white100.withOpacity(0.1),
            child: Image.asset(
              "assets/images/home.png",
              scale: 1.1,
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
