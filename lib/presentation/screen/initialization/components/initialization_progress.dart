part of '../screen.dart';

class _InitializationProgress extends StatelessWidget {
  const _InitializationProgress({required this.initializationBloc});

  final InitializationBloc initializationBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InitializationBloc, InitializationState>(
      bloc: initializationBloc,
      builder: (context, state) {
        final initStatus = state.initializationStatus;
        if (initStatus == null) return const SizedBox();

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: Column(
            key: ObjectKey(initStatus),
            children: [
              Text(
                initStatus.label,
                style: ProjectTextStyle.chivoRegular16White.copyWith(
                  color: ProjectColors.silverGrey,
                  height: 19 / 16,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '${initStatus.percent}%',
                style: ProjectTextStyle.chivoHeavy16White,
              ),
            ],
          ),
        );
      },
    );
  }
}
