part of '../screen.dart';

class _TextFieldSuffixIcon extends StatelessWidget {
  const _TextFieldSuffixIcon({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      widthFactor: 1,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ProjectAssets.icons.microphone.svg(height: 30),
        ),
      ),
    );
  }
}
