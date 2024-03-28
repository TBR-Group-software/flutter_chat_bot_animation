part of '../screen.dart';

class _TextField extends StatelessWidget {
  const _TextField({
    required this.hintText,
    required this.onMicrophoneTap,
    this.hintTextStyle,
  });

  final String hintText;

  final VoidCallback onMicrophoneTap;

  final TextStyle? hintTextStyle;

  @override
  Widget build(BuildContext context) {
    return ProjectTextField(
      fillColor: Colors.transparent,
      hintText: hintText,
      hintTextStyle: hintTextStyle ?? ProjectTextStyle.chivoRegular16SoftGrey,
      inputTextStyle: ProjectTextStyle.chivoRegular16CharcoalGrey,
      suffixIcon: _TextFieldSuffixIcon(onTap: onMicrophoneTap),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(45)),
        borderSide: BorderSide(
          color: ProjectColors.neutralGrey,
          width: 1,
        ),
      ),
    );
  }
}
