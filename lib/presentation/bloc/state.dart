import 'status.dart';

abstract class AppBlocState {
  const AppBlocState({
    required this.status,
    this.error,
  }) : assert(status != BlocStatus.error || error != null);

  final BlocStatus status;
  final Object? error;
}
