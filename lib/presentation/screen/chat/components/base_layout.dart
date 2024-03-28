part of '../screen.dart';

class _BaseLayout extends StatelessWidget {
  const _BaseLayout({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: Background(
          imagePath: ProjectAssets.images.backgroundUpsideDown.path,
          imageAlignment: const Alignment(0.1, 0),
          child: SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(child: child),
            ),
          ),
        ),
      ),
    );
  }
}
