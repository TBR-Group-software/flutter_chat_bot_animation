import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../backbone/dependency_injection.dart' as di;
import '../../bloc/auth/bloc.dart';
import '../../bloc/status.dart';
import '../../constants/colors.dart';
import '../../constants/gen/assets.gen.dart';
import '../../constants/text_style.dart';
import '../../widgets/animated_background.dart';
import '../../widgets/background.dart';
import '../../widgets/project_back_button.dart';
import '../../widgets/project_text_field.dart';
import '../../widgets/round_button.dart';
import '../../widgets/rounded_button.dart';

part 'components/animated_visibility.dart';
part 'components/phone_number_background.dart';
part 'components/phone_number_code_received.dart';
part 'components/phone_number_initial.dart';
part 'components/phone_number_loading.dart';
part 'components/phone_number_panel.dart';
part 'components/welcome_layout.dart';

const _animationDuration = Duration(milliseconds: 500);

@RoutePage()
class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<AlignmentGeometry> _alignmentAnimation;
  late final Animation<double> _phonePanelAnimation;

  late final AnimationController _backgroundRotationController;
  late final Animation<double> _backgroundRotationAnimation;
  late final Animation<double> _backgroundRotationOpacityAnimation;

  final _authBloc = di.sl.get<AuthBloc>();

  BlocStatus? _previousBlocStatus;

  bool _isBlocStateInitial = true;

  bool _isPhonePanelVisible = false;

  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  void _initAnimation() {
    _backgroundRotationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..addStatusListener(_onBackgroundRotationControllerStatusChange);

    _backgroundRotationAnimation = Tween<double>(
      begin: 0,
      end: 0.5,
    ).animate(_backgroundRotationController);
    _backgroundRotationOpacityAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(_backgroundRotationController);

    _controller = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );

    const curve = Cubic(0.1, 1.04, 0.85, 1.1);
    const reverseCurve = Cubic(0.32, -0.21, 1, 0.61);

    final curveAnimation = CurvedAnimation(
      parent: _controller,
      curve: curve,
      reverseCurve: reverseCurve,
    );

    _phonePanelAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curveAnimation);
    _alignmentAnimation = AlignmentTween(
      begin: Alignment.center,
      end: Alignment.topCenter,
    ).animate(curveAnimation);
  }

  void _onBackgroundRotationControllerStatusChange(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _backgroundRotationController.value = 0;
    }
  }

  void _showPhoneLayout() {
    _isPhonePanelVisible = true;
    _controller.forward();

    setState(() {});
  }

  void _hidePhoneLayout() {
    _isPhonePanelVisible = false;
    _controller.reverse();

    setState(() {});
  }

  void _maybeHidePhoneLayout() {
    if (!_isPhonePanelVisible || !_isBlocStateInitial) return;

    _hidePhoneLayout();
  }

  void _onBlocChange(BuildContext context, AuthState state) {
    if (state.status != BlocStatus.initial) {
      _isBlocStateInitial = false;
    }

    if (_previousBlocStatus != state.status) {
      _previousBlocStatus = state.status;
      _backgroundRotationController.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _backgroundRotationController.removeStatusListener(
      _onBackgroundRotationControllerStatusChange,
    );
    _backgroundRotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final staticBackground = Background(
      imagePath: ProjectAssets.images.backgroundUpsideDown.path,
    );

    return BlocListener<AuthBloc, AuthState>(
      bloc: _authBloc,
      listener: _onBlocChange,
      child: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: PopScope(
          canPop: false,
          onPopInvoked: (_) => _maybeHidePhoneLayout(),
          child: Scaffold(
            body: Stack(
              children: [
                const AnimatedBackground(),
                AnimatedOpacity(
                  opacity: _isPhonePanelVisible ? 1 : 0,
                  duration: _animationDuration,
                  child: Stack(
                    children: [
                      staticBackground,
                      FadeTransition(
                        opacity: _backgroundRotationOpacityAnimation,
                        child: RotationTransition(
                          turns: _backgroundRotationAnimation,
                          child: staticBackground,
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedOpacity(
                  opacity: _isPhonePanelVisible ? 0 : 1,
                  duration: _animationDuration,
                  child: const _WelcomeLayout(),
                ),
                _PhoneNumberPanel(
                  visible: _isPhonePanelVisible,
                  phonePanelAnimation: _phonePanelAnimation,
                  alignmentAnimation: _alignmentAnimation,
                  onBackButtonTap: _hidePhoneLayout,
                  onTap: _showPhoneLayout,
                  authBloc: _authBloc,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
