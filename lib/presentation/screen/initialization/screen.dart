import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../backbone/dependency_injection.dart' as di;
import '../../bloc/initialization/bloc.dart';
import '../../constants/colors.dart';
import '../../constants/text_style.dart';
import '../../widgets/animated_background.dart';
import '../../widgets/secondary_round_button.dart';

part 'components/initialization_progress.dart';

@RoutePage()
class InitializationScreen extends StatefulWidget {
  const InitializationScreen({super.key});

  @override
  State<InitializationScreen> createState() => _InitializationScreenState();
}

class _InitializationScreenState extends State<InitializationScreen> {
  final _initializationBloc = di.sl.get<InitializationBloc>();

  bool _moveBackground = false;

  @override
  void initState() {
    super.initState();
    _initializationBloc.add(const InitializationEvent.start());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animateBackground();
    });
  }

  void _animateBackground() {
    setState(() => _moveBackground = true);
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

    return PopScope(
      canPop: false,
      child: Scaffold(
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
    );
  }
}
