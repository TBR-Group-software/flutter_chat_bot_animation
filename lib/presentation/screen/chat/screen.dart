import 'dart:async';
import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

import '../../constants/colors.dart';
import '../../constants/gen/assets.gen.dart';
import '../../constants/text_style.dart';
import '../../utils/color_extension.dart';
import '../../widgets/animated_visibility.dart';
import '../../widgets/background.dart';
import '../../widgets/primary_round_button.dart';
import '../../widgets/project_text_field.dart';
import '../../widgets/rotated_animation.dart';

part 'components/base_layout.dart';
part 'components/button.dart';
part 'components/foreground.dart';
part 'components/greetings.dart';
part 'components/listener_animation/animation.dart';
part 'components/listener_animation/circle.dart';
part 'components/listener_animation/square.dart';
part 'components/listener_animation/triangle.dart';
part 'components/listener_layout.dart';
part 'components/text_field.dart';
part 'components/text_field_suffix_icon.dart';

@RoutePage()
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  late final AnimationController _layoutListenerController;
  late final AnimationController _textFieldVisibilityController;
  late final AnimationController _chatSizeAnimationController;
  late final AnimationController _contentSizeAnimationController;
  late final AnimationController _foregroundAnimationController;

  late Animation<double> _sizeAnimation;
  late final Animation<double> _contentSizeAnimation;
  late final Animation<double> _roundButtonSizeAnimation;
  late final Animation<double> _textFieldVisibilityAnimation;

  bool _isChatHidden = false;
  bool _isGreetingsHidden = false;
  bool _isYesClicked = false;
  bool _isListenerLayoutShown = false;

  static const _animationDuration = Duration(milliseconds: 250);

  static const _springDescription = SpringDescription(
    mass: 1,
    stiffness: 300,
    damping: 20,
  );
  static const double _velocity = 10;

  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  void _initAnimation() {
    _chatSizeAnimationController = AnimationController.unbounded(vsync: this);
    _contentSizeAnimationController = AnimationController.unbounded(
      vsync: this,
    );
    _layoutListenerController = AnimationController.unbounded(
      vsync: this,
    );
    _textFieldVisibilityController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );
    _foregroundAnimationController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );

    _sizeAnimation = Tween<double>(
      begin: 1,
      end: 0.2,
    ).animate(_chatSizeAnimationController);

    _contentSizeAnimation = Tween<double>(
      begin: 1,
      end: 0.1,
    ).animate(_contentSizeAnimationController);

    _roundButtonSizeAnimation = Tween<double>(
      begin: 55,
      end: 80,
    ).animate(_chatSizeAnimationController);

    _textFieldVisibilityAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(_textFieldVisibilityController);

    Future.delayed(
      const Duration(milliseconds: 500),
      _foregroundAnimationController.forward,
    );
  }

  void _toggleChat() {
    FocusScope.of(context).unfocus();

    if (_isGreetingsHidden) {
      _sizeAnimation = Tween<double>(
        begin: 1,
        end: 0.45,
      ).animate(_chatSizeAnimationController);
    }

    if (_isChatHidden) {
      final reverseSimulation = SpringSimulation(
        _springDescription,
        1,
        0,
        -_velocity,
      );
      _chatSizeAnimationController.animateWith(reverseSimulation);
    } else {
      final forwardSimulation = SpringSimulation(
        _springDescription,
        0,
        1,
        _velocity,
      );
      _chatSizeAnimationController.animateWith(forwardSimulation);
    }
    _isChatHidden = !_isChatHidden;
    setState(() {});
  }

  void _onYesTap() {
    setState(() => _isYesClicked = true);
  }

  void _onNoTap() {
    final simulation = SpringSimulation(_springDescription, 0, 1, 10);
    _contentSizeAnimationController.animateWith(simulation);
    _isGreetingsHidden = true;
    setState(() {});
  }

  void _toggleListenerLayout() {
    final SpringSimulation simulation;
    const springDescription = SpringDescription(
      mass: 1,
      stiffness: 100,
      damping: 15,
    );

    if (_isListenerLayoutShown) {
      simulation = SpringSimulation(springDescription, 1, 0, 5);
      _isListenerLayoutShown = false;
      _textFieldVisibilityController.reverse();
    } else {
      _isListenerLayoutShown = true;
      _textFieldVisibilityController.forward();
      simulation = SpringSimulation(springDescription, 0, 1, 5);
    }

    if (!_isGreetingsHidden) {
      _contentSizeAnimationController.animateWith(simulation);
    }

    _layoutListenerController.animateWith(simulation);
  }

  String get _hintText {
    if (_isGreetingsHidden) {
      return 'You can type here or speak';
    }
    if (_isYesClicked) {
      return 'Type here or speak';
    }
    return 'or, you can type here or speak';
  }

  @override
  void dispose() {
    _chatSizeAnimationController.dispose();
    _layoutListenerController.dispose();
    _contentSizeAnimationController.dispose();
    _textFieldVisibilityController.dispose();
    _foregroundAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _BaseLayout(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedBuilder(
                    animation: _roundButtonSizeAnimation,
                    builder: (_, __) => SizedBox(
                      height: _roundButtonSizeAnimation.value / 2,
                    ),
                  ),
                  Stack(
                    children: [
                      const Positioned.fill(
                        top: 80,
                        child: ColoredBox(color: Colors.white),
                      ),
                      SizeTransition(
                        axisAlignment: -1,
                        sizeFactor: _sizeAnimation,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                          ),
                          child: AnimatedOpacity(
                            opacity: _isChatHidden ? 0 : 1,
                            duration: _animationDuration,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizeTransition(
                                  sizeFactor: _contentSizeAnimation,
                                  child: _Greetings(
                                    onYesTap: _onYesTap,
                                    onNoTap: _onNoTap,
                                    isYesClicked: _isYesClicked,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 20,
                                  ),
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      _ListenerLayout(
                                        animation: _layoutListenerController,
                                        onMicrophoneTap: _toggleListenerLayout,
                                      ),
                                      AnimatedVisibility(
                                        animation:
                                            _textFieldVisibilityAnimation,
                                        child: _TextField(
                                          hintText: _hintText,
                                          onMicrophoneTap:
                                              _toggleListenerLayout,
                                          hintTextStyle: _isGreetingsHidden
                                              ? ProjectTextStyle
                                                  .chivoRegular16CharcoalGrey
                                              : null,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              AnimatedBuilder(
                animation: _roundButtonSizeAnimation,
                builder: (_, __) => PrimaryRoundButton(
                  onTap: _toggleChat,
                  dimension: _roundButtonSizeAnimation.value,
                ),
              ),
            ],
          ),
        ),
        _Foreground(
          animation: _foregroundAnimationController,
        ),
      ],
    );
  }
}
