import 'dart:math';

import 'package:flutter/animation.dart';

class SineCurve extends Curve {
  const SineCurve({this.count = 1});

  final int count;

  @override
  double transformInternal(double t) {
    return sin(count * 2 * pi * t) * 0.5 + 0.5;
  }

  @override
  String toString() {
    return '$runtimeType($count)';
  }
}
