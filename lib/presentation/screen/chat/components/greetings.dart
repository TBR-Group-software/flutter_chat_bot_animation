part of '../screen.dart';

class _Greetings extends StatefulWidget {
  const _Greetings({
    required this.onYesTap,
    required this.onNoTap,
    required this.isYesClicked,
  });

  final VoidCallback onYesTap;
  final VoidCallback onNoTap;

  final bool isYesClicked;

  @override
  State<_Greetings> createState() => _GreetingsState();
}

class _GreetingsState extends State<_Greetings> with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final AnimationController _unboundedAnimationController;

  late final Animation<Alignment> _alignAnimation;
  late final Animation<double> _opacityAnimation;
  late final Animation<double> _sizeAnimation;

  static const _animationDuration = Duration(milliseconds: 150);

  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  void _initAnimation() {
    final double controllerValue = widget.isYesClicked ? 1 : 0;

    _animationController = AnimationController(
      vsync: this,
      duration: _animationDuration,
      value: controllerValue,
    );
    _unboundedAnimationController = AnimationController.unbounded(
      vsync: this,
      value: controllerValue,
    );

    _alignAnimation = Tween<Alignment>(
      begin: Alignment.center,
      end: Alignment.centerLeft,
    ).animate(_unboundedAnimationController);

    _sizeAnimation = Tween<double>(
      begin: 0,
      end: 20,
    ).animate(_unboundedAnimationController);

    _opacityAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(_animationController);
  }

  void _onYesTap() {
    const springDescription = SpringDescription(
      mass: 1,
      stiffness: 300,
      damping: 18,
    );
    final simulation = SpringSimulation(springDescription, 0, 1, 20);
    _unboundedAnimationController.animateWith(simulation);
    _animationController.forward();

    widget.onYesTap();
    setState(() {});
  }

  @override
  void dispose() {
    _animationController.dispose();
    _unboundedAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isYesClicked = widget.isYesClicked;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 85),
            const Text(
              'Welcome to Atom',
              style: ProjectTextStyle.monserratRegular20Black,
            ),
            const Text(
              'Let\'s meet each other',
              style: ProjectTextStyle.chivoLight16CharcoalGrey,
            ),
            const SizedBox(height: 45),
            AnimatedDefaultTextStyle(
              duration: _animationDuration,
              style: isYesClicked
                  ? ProjectTextStyle.chivoLight16CharcoalGrey
                  : ProjectTextStyle.chivoRegular16CharcoalGrey,
              child: const Text(
                'Do you want to set a name for me?',
              ),
            ),
            const SizedBox(height: 20),
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                SizedBox(
                  width: 95,
                  height: 35,
                  child: AlignTransition(
                    alignment: _alignAnimation,
                    child: const Text(
                      'YES',
                      style: ProjectTextStyle.chivoRegular16ElectricBlue,
                    ),
                  ),
                ),
                AnimatedVisibility(
                  animation: _opacityAnimation,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _Button.contained(
                        label: 'YES',
                        onTap: _onYesTap,
                      ),
                      const SizedBox(width: 15),
                      _Button.outlined(
                        label: 'NO',
                        onTap: widget.onNoTap,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            AnimatedBuilder(
              animation: _sizeAnimation,
              builder: (_, __) => SizedBox(height: _sizeAnimation.value),
            ),
            if (isYesClicked)
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  'Type or speak my name below',
                  style: ProjectTextStyle.chivoRegular16CharcoalGrey,
                ),
              )
            else
              const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
