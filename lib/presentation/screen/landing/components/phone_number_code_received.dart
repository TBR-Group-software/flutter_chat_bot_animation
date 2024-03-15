part of '../screen.dart';

class _PhoneNumberCodeReceived extends StatelessWidget {
  const _PhoneNumberCodeReceived();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(flex: 3),
        const Text(
          'Verification code received',
          style: ProjectTextStyle.chivoRegular16White,
        ),
        const SizedBox(height: 35),
        ProjectTextField(
          margin: const EdgeInsets.symmetric(horizontal: 35),
          controller: TextEditingController(text: '1234'),
          padding: const EdgeInsets.symmetric(vertical: 20),
          obscureText: true,
          textAlign: TextAlign.center,
          enabled: false,
          disabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(45)),
            borderSide: BorderSide(color: Colors.white, width: 1),
          ),
          fillColor: Colors.white24,
          inputTextStyle: ProjectTextStyle.chivoRegular20White.copyWith(
            letterSpacing: 4,
          ),
        ),
        const Spacer(flex: 3),
      ],
    );
  }
}
