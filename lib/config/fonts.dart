import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomGoogleFonts {
  static TextStyle roboto({
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    Color? color,
  }) {
    return GoogleFonts.roboto(
        fontSize: fontSize ?? 12,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? Colors.black,
        fontStyle: fontStyle);
  }
}

class AppFontSizes {
  static final double size10 = 10.r;
  static final double size12 = 12.r;
  static final double size14 = 14.r;
  static final double size16 = 16.r;
  static final double size18 = 18.r;
  static final double size20 = 20.r;
  static double customSize(double customSize) {
    return customSize.r;
  }
}
