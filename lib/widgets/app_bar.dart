import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../config/colors.dart';
import '../config/fonts.dart';
import '../config/routes.dart';
import 'home_action_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function()? onBackPress;
  final Widget? secondaryAction;
  final bool? showHomeButton;
  const CustomAppBar(
      {super.key,
      required this.title,
      this.onBackPress,
      this.secondaryAction,
      this.showHomeButton = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leadingWidth: 55.w,
      titleSpacing: 5,
      leading: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: Colors.transparent,
          elevation: 0,
          padding: const EdgeInsets.all(10),
        ),
        onPressed: onBackPress,
        child: SvgPicture.asset(
          "assets/svg/preparation/map_annotations/back.svg",
          width: 20,
          height: 30,
        ),
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
        showHomeButton!
            ? ActionButton(
                imagePath: "assets/images/home.png",
                onTap: () => AppRoutes.navigate(AppRoutes.home),
              )
            : const SizedBox.shrink(),
        SizedBox(
          width: 10.w,
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(40.h);
}
