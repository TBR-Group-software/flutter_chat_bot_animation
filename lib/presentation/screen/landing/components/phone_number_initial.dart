part of '../screen.dart';

class _PhoneNumberInitial extends StatefulWidget {
  const _PhoneNumberInitial({
    required this.onSendCodeTap,
  });

  final ValueChanged<String> onSendCodeTap;

  @override
  State<_PhoneNumberInitial> createState() => _PhoneNumberInitialState();
}

class _PhoneNumberInitialState extends State<_PhoneNumberInitial> {
  String _number = '';

  void _onNumberChanged(String value) => setState(() => _number = value);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(flex: 5),
        const Text(
          'Add your Phone number',
          style: ProjectTextStyle.chivoRegular16White,
        ),
        const Spacer(flex: 2),
        ProjectTextField(
          margin: const EdgeInsets.symmetric(horizontal: 35),
          onChanged: _onNumberChanged,
          hintText: 'Enter your phone number',
          letterSpacingInInput: 2,
          keyboardType: TextInputType.number,
        ),
        const Spacer(),
        RoundedButton(
          label: 'Send Code',
          margin: const EdgeInsets.symmetric(horizontal: 65),
          onTap: _number.isEmpty ? null : () => widget.onSendCodeTap(_number),
        ),
        const Spacer(flex: 2),
      ],
    );
  }
}
