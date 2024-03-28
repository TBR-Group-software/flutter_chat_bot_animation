part of '../screen.dart';

class _Button extends StatelessWidget {
  const _Button.outlined({
    required this.label,
    this.onTap,
  }) : _contained = false;

  const _Button.contained({
    required this.label,
    this.onTap,
  }) : _contained = true;

  final String label;

  final VoidCallback? onTap;

  final bool _contained;

  @override
  Widget build(BuildContext context) {
    Color? backgroundColor;
    var textStyle = ProjectTextStyle.chivoRegular14White;

    if (_contained) {
      backgroundColor = ProjectColors.electricBlue;
    } else {
      textStyle = textStyle.copyWith(color: ProjectColors.electricBlue);
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 95,
        height: 35,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: ProjectColors.electricBlue,
          ),
        ),
        alignment: Alignment.center,
        child: Text(label, style: textStyle),
      ),
    );
  }
}
