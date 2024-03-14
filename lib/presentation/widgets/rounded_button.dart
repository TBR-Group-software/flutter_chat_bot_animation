import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/text_style.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    this.onTap,
    required this.label,
    this.margin = EdgeInsets.zero,
  });

  final VoidCallback? onTap;

  final String label;

  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    const gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [ProjectColors.charcoal, Colors.black],
    );

    return GestureDetector(
      onTap: onTap,
      child: Opacity(
        opacity: onTap == null ? 0.3 : 1,
        child: Container(
          margin: margin,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.circular(40),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
          alignment: Alignment.center,
          child: Text(
            label,
            style: ProjectTextStyle.chivoRegular14LightGrey.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
