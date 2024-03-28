import 'dart:math';

import 'package:flutter/material.dart';

class RotatedAnimation extends AnimatedWidget {
  const RotatedAnimation({
    super.key,
    required this.child,
    required Animation<double> animation,
  }) : super(listenable: animation);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;

    final angle = animation.value * pi / 180;

    return Transform.rotate(
      angle: angle,
      child: child,
    );
  }
}
