import 'package:flutter/material.dart';

class AnimatedVisibility extends AnimatedWidget {
  const AnimatedVisibility({
    super.key,
    required Animation<double> animation,
    required this.child,
    this.replacement = const SizedBox.shrink(),
  }) : super(listenable: animation);

  final Widget child;

  final Widget replacement;

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    final double opacity = animation.value.clamp(0, 1);

    return Opacity(
      opacity: opacity,
      child: Visibility(
        replacement: replacement,
        visible: opacity != 0,
        child: child,
      ),
    );
  }
}
