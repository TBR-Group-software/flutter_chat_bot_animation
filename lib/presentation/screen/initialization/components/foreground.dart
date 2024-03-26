part of '../screen.dart';

class _Foreground extends AnimatedWidget {
  const _Foreground({
    required Animation<double> animation,
  }) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;

    final screenSize = MediaQuery.of(context).size;
    final longestSide = max(screenSize.width, screenSize.height) * 2;

    final diameter = Tween<double>(
      begin: 0,
      end: longestSide,
    ).evaluate(animation);

    final opacity = Tween<double>(begin: 0, end: 1).evaluate(animation);

    return Positioned(
      width: diameter,
      height: diameter,
      child: Opacity(
        opacity: opacity,
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ProjectColors.purpleShade,
                ProjectColors.lavender,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
