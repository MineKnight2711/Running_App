import 'package:flutter_screenutil/flutter_screenutil.dart';

///Caculate the pixel width and height using package flutter_screenutil
class AppSpacings {
  static final vs5 = 5.h;
  static final vs10 = 10.h;
  static final vs15 = 15.h;
  static final vs20 = 20.h;
  static final vs25 = 25.h;
  static final vs30 = 30.h;

  static final hs5 = 5.w;
  static final hs10 = 10.w;
  static final hs15 = 15.w;
  static final hs20 = 20.w;
  static final hs25 = 25.w;
  static final hs30 = 30.w;

  /// Caclulate the vertical height space of the screen
  static double cvs(double spaceSize) {
    return spaceSize.h;
  }

  /// Caclulate the horizontal width space of the screen
  static double chs(double spaceSize) {
    return spaceSize.w;
  }

  /// Caclulate the height of the screen
  static double sh(double screenHeight) {
    return screenHeight.sh;
  }

  /// Caclulate the width of the screen
  static double sw(double screenWidth) {
    return screenWidth.sw;
  }
}
