import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/text_style.dart';

class ProjectTextField extends StatefulWidget {
  const ProjectTextField({
    this.margin = EdgeInsets.zero,
    this.padding = const EdgeInsets.all(25),
    this.hintText,
    this.letterSpacingInInput,
    this.textAlign = TextAlign.start,
    this.obscureText = false,
    this.inputTextStyle,
    super.key,
  });

  final EdgeInsets margin;

  final EdgeInsets padding;

  final String? hintText;

  final double? letterSpacingInInput;

  final TextAlign textAlign;

  final bool obscureText;

  final TextStyle? inputTextStyle;

  @override
  State<ProjectTextField> createState() => _ProjectTextFieldState();
}

class _ProjectTextFieldState extends State<ProjectTextField> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  bool _isFocused = false;

  void _onFocusChange() {
    setState(() => _isFocused = _focusNode.hasFocus);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(45)),
      borderSide: BorderSide(color: Colors.white30, width: 1),
    );

    final focusBorder = border.copyWith(
      borderSide: const BorderSide(color: Colors.white, width: 1),
    );

    final textStyle = widget.inputTextStyle ??
        ProjectTextStyle.chivoRegular12White.copyWith(
          letterSpacing: widget.letterSpacingInInput,
        );

    final hintTextStyle = ProjectTextStyle.chivoRegular12White.copyWith(
      letterSpacing: 0,
      color: Colors.white54,
    );

    return Padding(
      padding: widget.margin,
      child: TextField(
        focusNode: _focusNode,
        style: textStyle,
        obscureText: widget.obscureText,
        obscuringCharacter: '*',
        textAlign: widget.textAlign,
        cursorColor: Colors.white30,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: hintTextStyle,
          contentPadding: widget.padding,
          filled: true,
          fillColor: _isFocused ? Colors.white24 : ProjectColors.white5,
          enabledBorder: border,
          border: border,
          focusedBorder: focusBorder,
        ),
      ),
    );
  }
}
