import 'package:flutter/material.dart';

class LinearGradientTween extends Tween<LinearGradient> {
  LinearGradientTween({super.begin, super.end});

  @override
  LinearGradient lerp(double t) => LinearGradient.lerp(begin, end, t)!;
}
