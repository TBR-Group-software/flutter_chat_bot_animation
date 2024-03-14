part of '../screen.dart';

class _PhoneNumber extends AnimatedWidget {
  const _PhoneNumber({
    required Animation<double> animation,
  }) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    final double opacity = animation.value.clamp(0, 1);

    return Opacity(
      opacity: opacity,
      child: Visibility(
        visible: opacity != 0,
        child: Column(
          children: [
            const Spacer(flex: 5),
            const Text(
              'Add your Phone number',
              style: ProjectTextStyle.chivoRegular16White,
            ),
            const Spacer(flex: 2),
            const ProjectTextField(
              margin: EdgeInsets.symmetric(horizontal: 35),
              hintText: 'Enter your phone number',
              letterSpacingInInput: 2,
            ),
            const Spacer(),
            RoundedButton(
              label: 'Send Code',
              margin: const EdgeInsets.symmetric(horizontal: 65),
              onTap: () {},
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
