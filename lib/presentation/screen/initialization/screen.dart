import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../backbone/dependency_injection.dart' as di;
import '../../bloc/initialization/bloc.dart';
import '../../constants/colors.dart';
import '../../constants/text_style.dart';
import '../../navigation/app_router.dart';
import '../../widgets/animated_background.dart';
import '../../widgets/secondary_round_button.dart';

part 'components/foreground.dart';
part 'components/initialization_progress.dart';

@RoutePage()
class InitializationScreen extends StatefulWidget {
  const InitializationScreen({super.key});

  @override
  State<InitializationScreen> createState() => _InitializationScreenState();
}

class _InitializationScreenState extends State<InitializationScreen>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;

  final _initializationBloc = di.sl.get<InitializationBloc>();

  bool _moveBackground = false;

  @override
  void initState() {
    super.initState();
    _initializationBloc.add(const InitializationEvent.start());
    _initAnimation();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animateBackground();
    });
  }

  void _initAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    )..addStatusListener(_onAnimationStatusChange);
  }

  void _animateBackground() {
    setState(() => _moveBackground = true);
  }

  void _onAnimationStatusChange(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      context.replaceRoute(const ChatRoute());
    }
  }

  void _onChange(BuildContext context, InitializationState state) {
    if (state.initializationStatus?.percent == 75) {
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.removeStatusListener(_onAnimationStatusChange);
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const animationDuration = Duration(milliseconds: 500);
    const curve = Cubic(0.1, 1.04, 0.85, 1.1);

    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    final diameter = screenWidth + (screenWidth * 0.68);
    final contentHeight = screenHeight * 0.36;

    final bottomPosition = diameter * 0.17;

    return BlocListener<InitializationBloc, InitializationState>(
      bloc: _initializationBloc,
      listener: _onChange,
      child: PopScope(
        canPop: false,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Scaffold(
              body: AnimatedBackground(
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.bottomCenter,
                  children: [
                    AnimatedPositioned(
                      curve: curve,
                      duration: animationDuration,
                      top: _moveBackground ? 0 : contentHeight,
                      bottom: _moveBackground ? 0 : -bottomPosition,
                      child: AnimatedContainer(
                        curve: curve,
                        duration: animationDuration,
                        width: _moveBackground ? 180 : diameter,
                        height: _moveBackground ? 180 : diameter,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: _moveBackground
                                ? [
                                    ProjectColors.lavender20,
                                    ProjectColors.purpleShade20,
                                  ]
                                : [
                                    ProjectColors.lavender80,
                                    ProjectColors.purpleShade80
                                  ],
                          ),
                        ),
                      ),
                    ),
                    const Center(child: SecondaryRoundButton()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints.expand(),
                        child: Column(
                          children: [
                            const Spacer(flex: 6),
                            _InitializationProgress(
                              initializationBloc: _initializationBloc,
                            ),
                            const Spacer(flex: 2),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _Foreground(animation: _animationController),
          ],
        ),
      ),
    );
  }
}
