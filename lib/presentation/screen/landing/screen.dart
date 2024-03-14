import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/gen/assets.gen.dart';
import '../../constants/text_style.dart';
import '../../widgets/animated_background.dart';
import '../../widgets/background.dart';
import '../../widgets/project_back_button.dart';
import '../../widgets/project_text_field.dart';
import '../../widgets/round_button.dart';
import '../../widgets/rounded_button.dart';

part 'components/phone_number.dart';
part 'components/phone_number_background.dart';
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

  bool _isPhonePanelVisible = false;

  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  void _initAnimation() {
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: Stack(
          children: [
            const AnimatedBackground(),
            AnimatedOpacity(
              opacity: _isPhonePanelVisible ? 1 : 0,
              duration: _animationDuration,
              child: Background(
                imagePath: ProjectAssets.images.backgroundUpsideDown.path,
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
            ),
          ],
        ),
      ),
    );
  }
}
