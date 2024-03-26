part of '../screen.dart';

class _ListenerLayout extends AnimatedWidget {
  const _ListenerLayout({
    required Animation<double> animation,
    required this.onMicrophoneTap,
  }) : super(listenable: animation);

  final VoidCallback onMicrophoneTap;

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;

    final microphoneAlignment = AlignmentTween(
      begin: Alignment.bottomRight,
      end: Alignment.bottomCenter,
    );

    final textAlignment = AlignmentTween(
      begin: const Alignment(-0.7, 0),
      end: const Alignment(0, -0.4),
    );

    final microphoneBackground = ColorTween(
      begin: Colors.transparent,
      end: ProjectColors.electricBlue,
    );

    final microphoneColor = ColorTween(
      begin: ProjectColors.electricBlue,
      end: Colors.white,
    );

    final visible = animation.value > 0.05;

    final contentHeight = Tween<double>(begin: 75, end: 130);

    return Visibility(
      visible: visible,
      child: Opacity(
        opacity: animation.value.clamp(0, 1),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SizedBox(
              height: contentHeight.evaluate(animation),
              width: double.infinity,
            ),
            const _ListenerAnimation(),
            Positioned.fill(
              child: Align(
                alignment: textAlignment.evaluate(animation),
                child: const Text(
                  'You can speak Now. I am listening !',
                  style: ProjectTextStyle.chivoRegular14CharcoalGrey,
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: microphoneAlignment.evaluate(animation),
                child: GestureDetector(
                  onTap: onMicrophoneTap,
                  child: Container(
                    width: 55,
                    height: 55,
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: microphoneBackground.evaluate(animation),
                      shape: BoxShape.circle,
                    ),
                    child: FractionallySizedBox(
                      heightFactor: 0.55,
                      child: ProjectAssets.icons.microphone.svg(
                        height: 30,
                        colorFilter:
                            microphoneColor.evaluate(animation)!.toColorFilter,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
