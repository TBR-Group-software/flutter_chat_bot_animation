import 'dart:async';

import 'package:flutter/material.dart';

import 'background.dart';

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({
    super.key,
    this.child,
    this.useSafeArea = true,
  });

  final Widget? child;

  final bool useSafeArea;

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Alignment> _alignmentAnimation;

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _initController();
  }

  Future<void> _initController() async {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    );

    final curve = CurvedAnimation(
      parent: _controller,
      curve: Curves.decelerate,
      reverseCurve: Curves.easeIn,
    );

    _alignmentAnimation = AlignmentTween(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(curve)
      ..addStatusListener(_listenToStatusChanges);

    await Future.delayed(const Duration(milliseconds: 250));
    _controller.forward();
  }

  void _setTimer(VoidCallback actin) {
    _timer?.cancel();
    _timer = null;

    _timer = Timer(const Duration(seconds: 8), actin);
  }

  void _listenToStatusChanges(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _setTimer(_controller.reverse);
    } else if (status == AnimationStatus.dismissed) {
      _setTimer(_controller.forward);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _alignmentAnimation.removeStatusListener(_listenToStatusChanges);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _alignmentAnimation,
      builder: (context, child) {
        if (widget.useSafeArea && child != null) {
          child = SafeArea(child: child);
        }

        return Background(
          imageAlignment: _alignmentAnimation.value,
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
