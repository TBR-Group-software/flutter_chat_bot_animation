part of '../screen.dart';

class _PhoneNumberPanel extends StatelessWidget {
  const _PhoneNumberPanel({
    required this.phonePanelAnimation,
    required this.alignmentAnimation,
    required this.visible,
    required this.onTap,
    required this.onBackButtonTap,
  });

  final Animation<double> phonePanelAnimation;

  final Animation<AlignmentGeometry> alignmentAnimation;

  final bool visible;

  final VoidCallback onTap;

  final VoidCallback onBackButtonTap;

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (visible) ProjectBackButton(onTap: onBackButtonTap),
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
                    _PhoneNumber(animation: phonePanelAnimation),
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
          ),
        ),
      ),
    );
  }
}
