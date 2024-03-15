import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../base.dart';
import '../state.dart';
import '../status.dart';

part 'bloc.freezed.dart';
part 'event.dart';
part 'state.dart';

class AuthBloc extends AppBloc<AuthEvent, AuthState> {
  AuthBloc()
      : super(const AuthState(
          status: BlocStatus.initial,
          codeReceived: false,
        )) {
    on<AuthEvent>(_onEvent);
  }

  Future<void> _onEvent(AuthEvent event, Emitter<AuthState> emit) async {
    try {
      await event.when<Future<void>>(
        getPhoneCode: (phoneNumber) async => _getPhoneCode(
          phoneNumber: phoneNumber,
          emit: emit,
        ),
      );
    } on Object catch (error) {
      _emitErrorState(error, emit: emit);
    }
  }

  void _emitErrorState(Object error, {required Emitter<AuthState> emit}) {
    emit(
      state.copyWith(
        status: BlocStatus.error,
        error: error,
      ),
    );

    emit(
      state.copyWith(
        status: BlocStatus.loaded,
        error: null,
      ),
    );
  }

  void _emitLoadingState(Emitter<AuthState> emit) {
    if (state.status != BlocStatus.loading) {
      emit(state.copyWith(status: BlocStatus.loading));
    }
  }

  Future<void> _getPhoneCode({
    required String phoneNumber,
    required Emitter<AuthState> emit,
  }) async {
    _emitLoadingState(emit);

    await Future.delayed(const Duration(seconds: 3));

    emit(state.copyWith(codeReceived: true, status: BlocStatus.loaded));
  }
}
