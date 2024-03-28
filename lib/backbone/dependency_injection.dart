import 'package:get_it/get_it.dart';

import '../presentation/bloc/auth/bloc.dart';
import '../presentation/bloc/initialization/bloc.dart';

final GetIt sl = GetIt.instance;

void init() {
  _authFlow();
  _initializationFlow();
}

void _authFlow() {
  sl.registerLazySingleton<AuthBloc>(() => AuthBloc());
}

void _initializationFlow() {
  sl.registerLazySingleton<InitializationBloc>(() => InitializationBloc());
}
