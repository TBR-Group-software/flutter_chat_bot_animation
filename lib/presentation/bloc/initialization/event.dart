part of 'bloc.dart';

@immutable
@freezed
abstract class InitializationEvent with _$InitializationEvent {
  const factory InitializationEvent.start() = _StartEvent;
}
