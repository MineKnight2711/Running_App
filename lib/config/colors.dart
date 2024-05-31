import 'package:flutter/material.dart';

class AppColors {
  static const List<Color> indicators = [
    Color(0xffFED2C7),
    Color(0xffFED2C7),
    Color(0xffFEA58D),
    Color(0xffFE8160),
    Color(0xffFE724C),
  ];
  // text
  static const LinearGradient appTheme = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xff182839),
      Color(0xff0e0c0c),
    ],
  );
  static const LinearGradient comfirmButtonDefaultGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xffff783a),
      Color(0xfff26322),
    ],
  );

  static const Color white100 = Color(0xffffffff);
  static const Color sheetBackground = Color(0xff222222);
  static const Color bottomBarBackground = Color(0xFF2C2A2D);
  static const Color transparent = Colors.transparent;
  static const Color cancleButton = Color(0xffff4747);
  static const Color appButton = Color(0xfff26322);
  static Color annotationButton = const Color(0xFF2F2828).withOpacity(0.65);
  static const Color progressAction = Color(0xff76b5ff);
  static const Color progressActionActive = Color(0xff00d688);
  static const Color basicActivitiesCard = Color(0x0DFFFFFF);
}

class TextColor {
  static Color get primary => const Color(0xffFC6011);
  static Color get primaryText => const Color(0xff4A4B4D);
  static Color get secondaryText => const Color(0xff7C7D7E);
  static Color get textfield => const Color(0xffF2F2F2);
  static Color get placeholder => const Color(0xffB6B7B7);
  static Color get white => const Color(0xffffffff);
}
