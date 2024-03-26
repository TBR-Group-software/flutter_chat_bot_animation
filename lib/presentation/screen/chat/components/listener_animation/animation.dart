part of '../../screen.dart';

class _ListenerAnimation extends StatefulWidget {
  const _ListenerAnimation();

  @override
  State<_ListenerAnimation> createState() => _ListenerAnimationState();
}

class _ListenerAnimationState extends State<_ListenerAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;

  late Animation<Alignment> _trianglePositionAnimation;
  late Animation<double> _triangleRotationAnimation;
  late Animation<Alignment> _squarePositionAnimation;
  late Animation<double> _squareRotationAnimation;
  late Animation<Alignment> _circlePositionAnimation;

  Timer? timer;

  bool _rotateSquare = true;

  static const _springDescription = SpringDescription(
    mass: 1,
    stiffness: 300,
    damping: 15,
  );
  final _simulation = SpringSimulation(_springDescription, 0, 1, 30);

  @override
  void initState() {
    super.initState();
    _initAnimation();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setTimer(_animateToPosition2);
    });
  }

  void _initAnimation() {
    _animationController = AnimationController.unbounded(vsync: this);

    _setTriangleRotationAnimation(0, 90);
    _setTrianglePositionAnimation(Alignment.centerLeft, Alignment.center);

    _setCirclePositionAnimation(Alignment.center, Alignment.centerRight);

    _setSquareRotationAnimation(45, 0);
    _setSquarePositionAnimation(Alignment.centerRight, Alignment.centerLeft);
  }

  void _setTimer(VoidCallback action) {
    timer?.cancel();
    timer = null;

    timer = Timer(const Duration(milliseconds: 1600), action);
  }

  void _setTriangleRotationAnimation(double begin, double end) {
    _triangleRotationAnimation = Tween<double>(
      begin: begin,
      end: end,
    ).animate(_animationController);
  }

  void _setTrianglePositionAnimation(Alignment begin, Alignment end) {
    _trianglePositionAnimation = Tween<Alignment>(
      begin: begin,
      end: end,
    ).animate(_animationController);
  }

  void _setSquareRotationAnimation(double begin, double end) {
    _squareRotationAnimation = Tween<double>(
      begin: begin,
      end: end,
    ).animate(_animationController);
  }

  void _setSquarePositionAnimation(Alignment begin, Alignment end) {
    _squarePositionAnimation = Tween<Alignment>(
      begin: begin,
      end: end,
    ).animate(_animationController);
  }

  void _setCirclePositionAnimation(Alignment begin, Alignment end) {
    _circlePositionAnimation = Tween<Alignment>(
      begin: begin,
      end: end,
    ).animate(_animationController);
  }

  void _animateToInitialPosition() {
    _setTriangleRotationAnimation(180, 0);
    _setTrianglePositionAnimation(Alignment.center, Alignment.centerLeft);

    _setCirclePositionAnimation(Alignment.centerRight, Alignment.center);

    _setSquareRotationAnimation(45, 45);
    _setSquarePositionAnimation(Alignment.centerLeft, Alignment.centerRight);

    _rotateSquare = true;

    _animationController.animateWith(_simulation);
    _setTimer(_animateToPosition2);
    setState(() {});
  }

  void _animateToPosition2() {
    _rotateSquare = false;

    _setTriangleRotationAnimation(0, 90);
    _setTrianglePositionAnimation(Alignment.centerLeft, Alignment.center);

    _setCirclePositionAnimation(Alignment.center, Alignment.centerRight);

    _setSquareRotationAnimation(45, 0);
    _setSquarePositionAnimation(Alignment.centerRight, Alignment.centerLeft);

    _animationController.animateWith(_simulation);
    _setTimer(_animateToPosition3);
    setState(() {});
  }

  void _animateToPosition3() {
    _rotateSquare = true;

    _setTriangleRotationAnimation(90, 180);
    _setTrianglePositionAnimation(Alignment.center, Alignment.centerRight);

    _setCirclePositionAnimation(Alignment.center, Alignment.centerLeft);

    _setSquareRotationAnimation(0, 45);
    _setSquarePositionAnimation(Alignment.centerLeft, Alignment.center);

    _animationController.animateWith(_simulation);
    _setTimer(_animateToPosition4);
    setState(() {});
  }

  void _animateToPosition4() {
    _rotateSquare = true;

    _setTriangleRotationAnimation(180, 180);
    _setTrianglePositionAnimation(Alignment.centerRight, Alignment.center);

    _setCirclePositionAnimation(Alignment.centerLeft, Alignment.centerRight);

    _setSquareRotationAnimation(45, 45);
    _setSquarePositionAnimation(Alignment.center, Alignment.centerLeft);

    _animationController.animateWith(_simulation);
    _setTimer(_animateToInitialPosition);
    setState(() {});
  }

  @override
  void dispose() {
    timer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: FittedBox(
        child: SizedBox(
          width: 200,
          child: Stack(
            alignment: Alignment.center,
            children: [
              AlignTransition(
                alignment: _trianglePositionAnimation,
                child: RotatedAnimation(
                  animation: _triangleRotationAnimation,
                  child: const _Triangle(),
                ),
              ),
              AlignTransition(
                alignment: _circlePositionAnimation,
                child: const _Circle(),
              ),
              AlignTransition(
                alignment: _squarePositionAnimation,
                child: RotatedAnimation(
                  animation: _squareRotationAnimation,
                  child: _Square(rotate: _rotateSquare),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
