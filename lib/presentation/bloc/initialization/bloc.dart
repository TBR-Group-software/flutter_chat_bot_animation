import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entity/initialization_status.dart';
import '../base.dart';
import '../state.dart';
import '../status.dart';

part 'bloc.freezed.dart';
part 'event.dart';
part 'state.dart';

class InitializationBloc
    extends AppBloc<InitializationEvent, InitializationState> {
  InitializationBloc()
      : super(const InitializationState(status: BlocStatus.initial)) {
    on<InitializationEvent>(_onEvent);
  }

  final _dummyStatuses = [
    const InitializationStatus(label: 'Phone Verified', percent: 5),
    const InitializationStatus(label: 'Activation Started ...', percent: 18),
    const InitializationStatus(
      label: 'Atom core initialization...',
      percent: 25,
    ),
    const InitializationStatus(label: 'Adding photons...', percent: 32),
    const InitializationStatus(label: 'Adding photons...', percent: 48),
    const InitializationStatus(label: 'Atom power settings...', percent: 56),
    const InitializationStatus(label: 'Atom power settings...', percent: 63),
    const InitializationStatus(label: 'Atom power settings...', percent: 75),
  ];

  Future<void> _onEvent(
    InitializationEvent event,
    Emitter<InitializationState> emit,
  ) async {
    try {
      await event.when<Future<void>>(
        start: () async => _start(emit: emit),
      );
    } on Object catch (error) {
      _emitErrorState(error, emit: emit);
    }
  }

  void _emitErrorState(Object error,
      {required Emitter<InitializationState> emit}) {
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

  void _emitLoadingState(Emitter<InitializationState> emit) {
    if (state.status != BlocStatus.loading) {
      emit(state.copyWith(status: BlocStatus.loading));
    }
  }

  Future<void> _start({
    required Emitter<InitializationState> emit,
  }) async {
    _emitLoadingState(emit);

    for (final status in _dummyStatuses) {
      emit(
        state.copyWith(
          initializationStatus: status,
          status: BlocStatus.loaded,
        ),
      );
      await Future.delayed(const Duration(milliseconds: 1200));
    }
  }
}
