part of 'bloc.dart';

@immutable
@freezed
abstract class AuthState extends AppBlocState with _$AuthState {
  const AuthState._({
    required super.status,
    super.error,
  });

  const factory AuthState({
    required BlocStatus status,
    required bool codeReceived,
    Object? error,
  }) = _AuthState;
}
