import 'package:flutter/material.dart';

import '../constants/gen/assets.gen.dart';

class ProjectBackButton extends StatelessWidget {
  const ProjectBackButton({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.all(35),
        child: ProjectAssets.icons.backButton.svg(),
      ),
    );
  }
}
