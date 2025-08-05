// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InitializationEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is InitializationEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'InitializationEvent()';
  }
}

/// @nodoc
class $InitializationEventCopyWith<$Res> {
  $InitializationEventCopyWith(
      InitializationEvent _, $Res Function(InitializationEvent) __);
}

/// Adds pattern-matching-related methods to [InitializationEvent].
extension InitializationEventPatterns on InitializationEvent {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartEvent value)? start,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StartEvent() when start != null:
        return start(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartEvent value) start,
  }) {
    final _that = this;
    switch (_that) {
      case _StartEvent():
        return start(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartEvent value)? start,
  }) {
    final _that = this;
    switch (_that) {
      case _StartEvent() when start != null:
        return start(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? start,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _StartEvent() when start != null:
        return start();
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() start,
  }) {
    final _that = this;
    switch (_that) {
      case _StartEvent():
        return start();
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? start,
  }) {
    final _that = this;
    switch (_that) {
      case _StartEvent() when start != null:
        return start();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _StartEvent implements InitializationEvent {
  const _StartEvent();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _StartEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'InitializationEvent.start()';
  }
}

/// @nodoc
mixin _$InitializationState {
  BlocStatus get status;
  InitializationStatus? get initializationStatus;
  Object? get error;

  /// Create a copy of InitializationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InitializationStateCopyWith<InitializationState> get copyWith =>
      _$InitializationStateCopyWithImpl<InitializationState>(
          this as InitializationState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InitializationState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.initializationStatus, initializationStatus) ||
                other.initializationStatus == initializationStatus) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, initializationStatus,
      const DeepCollectionEquality().hash(error));

  @override
  String toString() {
    return 'InitializationState(status: $status, initializationStatus: $initializationStatus, error: $error)';
  }
}

/// @nodoc
abstract mixin class $InitializationStateCopyWith<$Res> {
  factory $InitializationStateCopyWith(
          InitializationState value, $Res Function(InitializationState) _then) =
      _$InitializationStateCopyWithImpl;
  @useResult
  $Res call(
      {BlocStatus status,
      InitializationStatus? initializationStatus,
      Object? error});
}

/// @nodoc
class _$InitializationStateCopyWithImpl<$Res>
    implements $InitializationStateCopyWith<$Res> {
  _$InitializationStateCopyWithImpl(this._self, this._then);

  final InitializationState _self;
  final $Res Function(InitializationState) _then;

  /// Create a copy of InitializationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? initializationStatus = freezed,
    Object? error = freezed,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      initializationStatus: freezed == initializationStatus
          ? _self.initializationStatus
          : initializationStatus // ignore: cast_nullable_to_non_nullable
              as InitializationStatus?,
      error: freezed == error ? _self.error : error,
    ));
  }
}

/// Adds pattern-matching-related methods to [InitializationState].
extension InitializationStatePatterns on InitializationState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_InitializationState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InitializationState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_InitializationState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InitializationState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_InitializationState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InitializationState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(BlocStatus status,
            InitializationStatus? initializationStatus, Object? error)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InitializationState() when $default != null:
        return $default(_that.status, _that.initializationStatus, _that.error);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(BlocStatus status,
            InitializationStatus? initializationStatus, Object? error)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InitializationState():
        return $default(_that.status, _that.initializationStatus, _that.error);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(BlocStatus status,
            InitializationStatus? initializationStatus, Object? error)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InitializationState() when $default != null:
        return $default(_that.status, _that.initializationStatus, _that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _InitializationState extends InitializationState {
  const _InitializationState(
      {required final BlocStatus status,
      this.initializationStatus,
      final Object? error})
      : super._(status: status, error: error);

  @override
  final InitializationStatus? initializationStatus;

  /// Create a copy of InitializationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InitializationStateCopyWith<_InitializationState> get copyWith =>
      __$InitializationStateCopyWithImpl<_InitializationState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InitializationState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.initializationStatus, initializationStatus) ||
                other.initializationStatus == initializationStatus) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, initializationStatus,
      const DeepCollectionEquality().hash(error));

  @override
  String toString() {
    return 'InitializationState(status: $status, initializationStatus: $initializationStatus, error: $error)';
  }
}

/// @nodoc
abstract mixin class _$InitializationStateCopyWith<$Res>
    implements $InitializationStateCopyWith<$Res> {
  factory _$InitializationStateCopyWith(_InitializationState value,
          $Res Function(_InitializationState) _then) =
      __$InitializationStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {BlocStatus status,
      InitializationStatus? initializationStatus,
      Object? error});
}

/// @nodoc
class __$InitializationStateCopyWithImpl<$Res>
    implements _$InitializationStateCopyWith<$Res> {
  __$InitializationStateCopyWithImpl(this._self, this._then);

  final _InitializationState _self;
  final $Res Function(_InitializationState) _then;

  /// Create a copy of InitializationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? initializationStatus = freezed,
    Object? error = freezed,
  }) {
    return _then(_InitializationState(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      initializationStatus: freezed == initializationStatus
          ? _self.initializationStatus
          : initializationStatus // ignore: cast_nullable_to_non_nullable
              as InitializationStatus?,
      error: freezed == error ? _self.error : error,
    ));
  }
}

// dart format on
