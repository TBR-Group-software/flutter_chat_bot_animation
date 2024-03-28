import 'dart:math';

import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/gen/assets.gen.dart';
import '../utils/gradient_box_border.dart';

class PrimaryRoundButton extends StatefulWidget {
  const PrimaryRoundButton({
    super.key,
    this.onTap,
    this.dimension = 90,
  });

  final VoidCallback? onTap;

  final double dimension;

  @override
  State<PrimaryRoundButton> createState() => _PrimaryRoundButtonState();
}

class _PrimaryRoundButtonState extends State<PrimaryRoundButton>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _gradientRotationAnimation;

  @override
  void initState() {
    super.initState();
    _initController();
  }

  void _initController() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _gradientRotationAnimation = Tween<double>(
      begin: 0,
      end: 180,
    ).animate(_controller);

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gradientColors = [
      ProjectColors.electricBlue,
      ProjectColors.magenta,
    ];

    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          final gradient = LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            transform: GradientRotation(
              -_gradientRotationAnimation.value * (pi / 180),
            ),
            colors: gradientColors,
          );
          final iconGradient = LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            transform: GradientRotation(
              _gradientRotationAnimation.value * (pi / 180),
            ),
            colors: gradientColors,
          );

          return Container(
            width: widget.dimension,
            height: widget.dimension,
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
              border: GradientBoxBorder(width: 2, gradient: gradient),
              boxShadow: const [
                BoxShadow(
                  color: ProjectColors.midnightBlue40,
                  offset: Offset(0, 4),
                  blurRadius: 50,
                ),
                BoxShadow(
                  color: ProjectColors.hotPink20,
                  offset: Offset(0, 10),
                  blurRadius: 20,
                ),
              ],
            ),
            child: Center(
              child: ShaderMask(
                shaderCallback: (bounds) => iconGradient.createShader(bounds),
                child: FractionallySizedBox(
                  heightFactor: 0.6,
                  widthFactor: 0.6,
                  child: ProjectAssets.icons.plainLogo.svg(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
