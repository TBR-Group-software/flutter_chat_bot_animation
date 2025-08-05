part of 'bloc.dart';

@immutable
@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.getPhoneCode(String phoneNumber) = _GetPhoneCodeEvent;
}
