part of '../screen.dart';

class _WelcomeLayout extends StatelessWidget {
  const _WelcomeLayout();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(flex: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProjectAssets.icons.logo.svg(),
            const SizedBox(width: 5),
            const Text(
              'atom',
              style: ProjectTextStyle.comfortaaMedium24White,
            ),
          ],
        ),
        const Spacer(flex: 4),
        Text(
          'Unleash the power of Atom',
          style: ProjectTextStyle.chivoRegular20White.copyWith(
            height: 23.8 / 20,
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          'AI powered bot for your everyday life',
          style: ProjectTextStyle.chivoRegular13LightGrey,
        ),
        const Spacer(flex: 4),
        const Text(
          'Tap to start Atom',
          style: ProjectTextStyle.chivoRegular14LightGrey,
        ),
        const Spacer(flex: 6),
        const Text(
          '©2030 atom. All rights reserved.',
          style: ProjectTextStyle.chivoRegular10DarkGrey,
        ),
        const Spacer(),
      ],
    );
  }
}
