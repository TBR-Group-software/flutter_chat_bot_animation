import 'package:flutter/material.dart';

import '../constants/gen/assets.gen.dart';

class Background extends StatelessWidget {
  const Background({
    super.key,
    this.child,
    this.imageAlignment = Alignment.center,
    this.imagePath,
  });

  final Widget? child;

  final Alignment imageAlignment;

  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath ?? ProjectAssets.images.background.path),
          fit: BoxFit.fitHeight,
          alignment: imageAlignment,
        ),
      ),
      child: child,
    );
  }
}
