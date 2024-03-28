part of '../../screen.dart';

class _Square extends StatelessWidget {
  const _Square({required this.rotate});

  final bool rotate;

  @override
  Widget build(BuildContext context) {
    const double dimension = 50;
    final double sideLength = rotate ? dimension / sqrt(2) : 40;

    return SizedBox.square(
      dimension: dimension,
      child: Center(
        child: Container(
          width: sideLength,
          height: sideLength,
          color: ProjectColors.skyBlue,
        ),
      ),
    );
  }
}
