import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSpacings {
  static final verticalSpacing5 = 5.h;
  static final verticalSpacing10 = 10.h;
  static final verticalSpacing15 = 15.h;
  static final verticalSpacing20 = 20.h;
  static final verticalSpacing25 = 25.h;
  static final verticalSpacing30 = 30.h;
  static final horizontalSpacing5 = 5.w;
  static final horizontalSpacing10 = 10.w;
  static final horizontalSpacing15 = 15.w;
  static final horizontalSpacing20 = 20.w;
  static final horizontalSpacing25 = 25.w;
  static final horizontalSpacing30 = 30.w;
  static double customVerticalSpacing(double spaceSize) {
    return spaceSize.h;
  }

  static double customHorizontalSpacing(double spaceSize) {
    return spaceSize.w;
  }

  static double heightByScreenHeight(double screenHeight) {
    return screenHeight.sh;
  }

  static double widthByScreenWidth(double screenWidth) {
    return screenWidth.sw;
  }
}
