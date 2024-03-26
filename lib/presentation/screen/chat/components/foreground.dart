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
      begin: longestSide,
      end: 0,
    ).evaluate(animation);

    final opacity = Tween<double>(begin: 1, end: 0).evaluate(animation);

    final rotation = Tween<double>(begin: 0, end: pi).evaluate(animation);

    return Positioned(
      width: diameter,
      height: diameter,
      child: Opacity(
        opacity: opacity,
        child: Transform(
          transform: Matrix4.rotationX(rotation)..rotateY(-rotation),
          alignment: Alignment.center,
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
      ),
    );
  }
}
