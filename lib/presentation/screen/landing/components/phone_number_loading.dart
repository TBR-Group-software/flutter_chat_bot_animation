part of '../screen.dart';

class _PhoneNumberLoading extends StatefulWidget {
  const _PhoneNumberLoading({
    required this.onResendSendCodeTap,
  });

  final ValueChanged<String> onResendSendCodeTap;

  @override
  State<_PhoneNumberLoading> createState() => _PhoneNumberLoadingState();
}

class _PhoneNumberLoadingState extends State<_PhoneNumberLoading> {
  int _waitingTime = 15;
  bool _isTimerRunning = true;
  Timer? _timer;

  String _number = '';
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initTimer();
    });
  }

  void _initTimer() {
    void onChange(Timer timer) {
      if (!mounted) return;

      if (_waitingTime > 0) {
        _waitingTime--;
      } else {
        _isTimerRunning = false;
        _timer?.cancel();
        _timer = null;
      }

      setState(() {});
    }

    _timer = Timer.periodic(const Duration(seconds: 1), onChange);
  }

  void _onNumberChanged(String value) => setState(() => _number = value);

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(flex: 6),
        const Text(
          'Waiting for the code',
          style: ProjectTextStyle.chivoRegular16White,
        ),
        const Spacer(flex: 2),
        Text(
          '00.${_waitingTime.toString().padLeft(2, '0')}',
          style: ProjectTextStyle.chivoRegular36White.copyWith(
            letterSpacing: 3,
          ),
        ),
        const Spacer(flex: 2),
        ProjectTextField(
          margin: const EdgeInsets.symmetric(horizontal: 35),
          keyboardType: TextInputType.number,
          hintText: 'Fetching Security Code',
          enabled: !_isTimerRunning,
          letterSpacingInInput: 2,
          onChanged: _onNumberChanged,
        ),
        const Spacer(flex: 2),
        RoundedButton(
          label: 'Resend Code',
          margin: const EdgeInsets.symmetric(horizontal: 65),
          onTap: (_isTimerRunning || _number.isEmpty)
              ? null
              : () => widget.onResendSendCodeTap(_number),
        ),
        const Spacer(flex: 4),
      ],
    );
  }
}
