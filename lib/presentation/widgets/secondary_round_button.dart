import 'dart:async';

import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/gen/assets.gen.dart';
import '../utils/gradient_box_border.dart';
import '../utils/gradient_tween.dart';

class SecondaryRoundButton extends StatefulWidget {
  const SecondaryRoundButton({
    super.key,
    this.onTap,
    this.dimension = 120,
  });

  final VoidCallback? onTap;

  final double dimension;

  @override
  State<SecondaryRoundButton> createState() => _SecondaryRoundButtonState();
}

class _SecondaryRoundButtonState extends State<SecondaryRoundButton>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Gradient> _gradientAnimation;
  late final Animation<Decoration> _decorationAnimation;

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _initController();
  }

  void _initController() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    final curve = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInExpo,
      reverseCurve: Curves.easeOutExpo,
    );

    const beginPosition = Alignment.topCenter;
    const endPosition = Alignment.bottomCenter;

    const beginGradient = LinearGradient(
      begin: beginPosition,
      end: endPosition,
      colors: [
        ProjectColors.electricBlue,
        ProjectColors.magenta,
      ],
    );
    const endGradient = LinearGradient(
      begin: beginPosition,
      end: endPosition,
      colors: [
        ProjectColors.magenta,
        ProjectColors.vividSky,
      ],
    );

    _gradientAnimation = LinearGradientTween(
      begin: beginGradient,
      end: endGradient,
    ).animate(curve)
      ..addStatusListener(_listenToStatusChanges);

    const shape = BoxShape.circle;

    _decorationAnimation = DecorationTween(
      begin: const BoxDecoration(
        shape: shape,
        boxShadow: [
          BoxShadow(
            color: ProjectColors.vibrantPurple40,
            offset: Offset(0, 4),
            blurRadius: 50,
          ),
          BoxShadow(
            color: ProjectColors.deepPurple20,
            offset: Offset(0, 10),
            blurRadius: 20,
          ),
        ],
      ),
      end: const BoxDecoration(
        shape: shape,
        boxShadow: [
          BoxShadow(
            color: ProjectColors.brightRed40,
            offset: Offset(0, 4),
            blurRadius: 50,
          ),
          BoxShadow(
            color: ProjectColors.lemonYellow20,
            offset: Offset(0, 10),
            blurRadius: 20,
          ),
        ],
        // border: endBorder,
      ),
    ).animate(curve);

    _controller.forward();
  }

  void _listenToStatusChanges(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _setTimer(_controller.reverse);
    } else if (status == AnimationStatus.dismissed) {
      _setTimer(_controller.forward);
    }
  }

  void _setTimer(VoidCallback actin) {
    _timer?.cancel();
    _timer = null;

    _timer = Timer(const Duration(milliseconds: 800), actin);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _gradientAnimation.removeStatusListener(_listenToStatusChanges);
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
          return DecoratedBox(
            decoration: _decorationAnimation.value,
            child: Container(
              width: widget.dimension,
              height: widget.dimension,
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
                border: GradientBoxBorder(
                  width: 2,
                  gradient: _gradientAnimation.value,
                ),
              ),
              child: Center(
                child: ShaderMask(
                  shaderCallback: (bounds) =>
                      _gradientAnimation.value.createShader(bounds),
                  child: FractionallySizedBox(
                    heightFactor: 0.6,
                    widthFactor: 0.6,
                    child: ProjectAssets.icons.plainLogo.svg(),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
