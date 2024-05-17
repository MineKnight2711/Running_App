import 'package:flutter/material.dart';

double mediaWidth(BuildContext context, double? customSize) {
  final givenSize = customSize ?? 1.0;
  return MediaQuery.of(context).size.width / givenSize;
}

double mediaHeight(BuildContext context, double? customSize) {
  final givenSize = customSize ?? 1.0;
  return MediaQuery.of(context).size.height / givenSize;
}

double mediaAspectRatio(BuildContext context, double? customSize) {
  final givenSize = customSize ?? 1.0;
  return MediaQuery.of(context).size.aspectRatio / givenSize;
}

bool screenRotate(BuildContext context) {
  final Orientation orientation = MediaQuery.of(context).orientation;
  if (orientation == Orientation.portrait) {
    return true;
  } else {
    return false;
  }
}
