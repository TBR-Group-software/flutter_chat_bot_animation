part of 'bloc.dart';

@immutable
@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.getPhoneCode(String phoneNumber) = _GetPhoneCodeEvent;
}
