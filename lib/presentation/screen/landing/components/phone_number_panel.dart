part of '../screen.dart';

class _PhoneNumberPanel extends StatelessWidget {
  const _PhoneNumberPanel({
    required this.phonePanelAnimation,
    required this.alignmentAnimation,
    required this.visible,
    required this.onTap,
    required this.onBackButtonTap,
    required this.authBloc,
  });

  final Animation<double> phonePanelAnimation;

  final Animation<AlignmentGeometry> alignmentAnimation;

  final bool visible;

  final VoidCallback onTap;

  final VoidCallback onBackButtonTap;

  final AuthBloc authBloc;

  void _onSendCodeTap(String phoneNumber) {
    authBloc.add(AuthEvent.getPhoneCode(phoneNumber));
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    final diameter = screenWidth + (screenWidth * 0.68);
    final contentHeight = screenHeight * 0.6;

    final bottomPosition = diameter * 0.17;

    return SingleChildScrollView(
      child: SizedBox(
        height: screenHeight,
        child: SafeArea(
          child: BlocBuilder<AuthBloc, AuthState>(
            bloc: authBloc,
            builder: (context, state) {
              final isInitialState = state.status == BlocStatus.initial;

              final Widget phonePanel;
              if (state.status == BlocStatus.loading) {
                phonePanel = _PhoneNumberLoading(
                  onResendSendCodeTap: _onSendCodeTap,
                );
              } else if (state.status == BlocStatus.loaded) {
                phonePanel = const _PhoneNumberCodeReceived();
              } else {
                phonePanel = _PhoneNumberInitial(onSendCodeTap: _onSendCodeTap);
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (visible && isInitialState)
                    ProjectBackButton(onTap: onBackButtonTap),
                  const Spacer(),
                  SizedBox(
                    height: contentHeight,
                    width: double.infinity,
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.bottomCenter,
                      children: [
                        Positioned(
                          top: 0,
                          bottom: -bottomPosition,
                          child: _PhoneNumberBackground(
                            animation: phonePanelAnimation,
                            diameter: diameter,
                          ),
                        ),
                        _AnimatedVisibility(
                          animation: phonePanelAnimation,
                          child: phonePanel,
                        ),
                        Positioned(
                          top: -45,
                          bottom: -bottomPosition,
                          child: AlignTransition(
                            alignment: alignmentAnimation,
                            child: RoundButton(onTap: onTap),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
