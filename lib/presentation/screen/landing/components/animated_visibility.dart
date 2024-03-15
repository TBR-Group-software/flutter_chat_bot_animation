part of '../screen.dart';

class _AnimatedVisibility extends AnimatedWidget {
  const _AnimatedVisibility({
    required Animation<double> animation,
    required this.child,
  }) : super(listenable: animation);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    final double opacity = animation.value.clamp(0, 1);

    return Opacity(
      opacity: opacity,
      child: Visibility(
        visible: opacity != 0,
        child: child,
      ),
    );
  }
}
