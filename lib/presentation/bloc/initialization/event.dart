part of 'bloc.dart';

@immutable
@freezed
class InitializationEvent with _$InitializationEvent {
  const factory InitializationEvent.start() = _StartEvent;
}
