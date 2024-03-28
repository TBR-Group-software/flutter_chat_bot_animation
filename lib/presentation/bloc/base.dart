import 'package:bloc/bloc.dart';

import 'state.dart';

abstract class AppBloc<E, S extends AppBlocState> extends Bloc<E, S> {
  AppBloc(super.initialState);
}
