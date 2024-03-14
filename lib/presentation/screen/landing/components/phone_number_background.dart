part of '../screen.dart';

class _PhoneNumberBackground extends AnimatedWidget {
  const _PhoneNumberBackground({
    required Animation<double> animation,
    required this.diameter,
  }) : super(listenable: animation);

  final double diameter;

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;

    return Opacity(
      opacity: animation.value.clamp(0, 1),
      child: Transform.scale(
        scale: animation.value,
        child: Container(
          width: diameter,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [ProjectColors.lavender80, ProjectColors.purpleShade80],
            ),
          ),
        ),
      ),
    );
  }
}
