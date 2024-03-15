import 'package:get_it/get_it.dart';

import '../presentation/bloc/auth/bloc.dart';

final GetIt sl = GetIt.instance;

void init() {
  _authFlow();
}

void _authFlow() {
  sl.registerLazySingleton<AuthBloc>(() => AuthBloc());
}
