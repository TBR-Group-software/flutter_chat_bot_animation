part of 'bloc.dart';

@immutable
@freezed
abstract class InitializationState extends AppBlocState
    with _$InitializationState {
  const InitializationState._({
    required super.status,
    super.error,
  });

  const factory InitializationState({
    required BlocStatus status,
    InitializationStatus? initializationStatus,
    Object? error,
  }) = _InitializationState;
}
