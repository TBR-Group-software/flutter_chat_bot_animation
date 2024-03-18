part of 'bloc.dart';

@immutable
@freezed
class InitializationState extends AppBlocState with _$InitializationState {
  const factory InitializationState({
    required BlocStatus status,
    InitializationStatus? initializationStatus,
    Object? error,
  }) = _InitializationState;
}
