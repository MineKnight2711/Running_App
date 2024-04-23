import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class Pricepoints {
  final double x;
  final double y;

  Pricepoints({
    required this.x,
    required this.y,
  });
}

List<Pricepoints> get pricePoints {
  final data = <double>[
    100,
    120,
    140,
    140,
    160,
    180,
    100,
    120,
    100,
    120,
    140,
    140,
    160,
    180,
    140,
    140,
    100,
    120,
    140,
    140,
    160,
    180,
    160,
    180,
    100,
    120,
    400,
    140,
    140,
    160,
    180,
    100,
    120,
    140,
    140,
    160,
    180,
    100,
    120,
    140,
    140,
    160,
    180
  ];
  return data
      .mapIndexed(
          ((index, element) => Pricepoints(x: index.toDouble(), y: element)))
      .toList();
}
