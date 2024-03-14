import 'dart:math';

import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/gen/assets.gen.dart';
import '../utils/gradient_box_border.dart';

class RoundButton extends StatefulWidget {
  const RoundButton({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  State<RoundButton> createState() => _RoundButtonState();
}

class _RoundButtonState extends State<RoundButton>
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

    _controller.forward();
    _controller.addStatusListener(_listenToStatusChanges);
  }

  void _listenToStatusChanges(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _controller.reverse();
    } else if (status == AnimationStatus.dismissed) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.removeStatusListener(_listenToStatusChanges);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            colors: const [ProjectColors.electricBlue, ProjectColors.magenta],
          );
          final iconGradient = LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            transform: GradientRotation(
              _gradientRotationAnimation.value * (pi / 180),
            ),
            colors: const [ProjectColors.electricBlue, ProjectColors.magenta],
          );

          return Container(
            width: 90,
            height: 90,
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
                child: ProjectAssets.icons.plainLogo.svg(height: 50),
              ),
            ),
          );
        },
      ),
    );
  }
}
