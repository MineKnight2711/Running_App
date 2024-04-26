import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/colors.dart';
import '../config/fonts.dart';
import 'home_action_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function()? onBackPress;
  final Widget? secondaryAction;
  const CustomAppBar(
      {super.key, required this.title, this.onBackPress, this.secondaryAction});

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
        secondaryAction ?? const SizedBox.shrink(),
        SizedBox(
          width: 5.w,
        ),
        ActionButton(
          imagePath: "assets/images/home.png",
          onTap: () {},
        ),
        SizedBox(
          width: 10.w,
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80.h);
}
