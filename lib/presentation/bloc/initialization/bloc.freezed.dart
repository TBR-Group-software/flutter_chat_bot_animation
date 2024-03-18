// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InitializationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() start,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? start,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? start,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartEvent value) start,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartEvent value)? start,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartEvent value)? start,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitializationEventCopyWith<$Res> {
  factory $InitializationEventCopyWith(
          InitializationEvent value, $Res Function(InitializationEvent) then) =
      _$InitializationEventCopyWithImpl<$Res, InitializationEvent>;
}

/// @nodoc
class _$InitializationEventCopyWithImpl<$Res, $Val extends InitializationEvent>
    implements $InitializationEventCopyWith<$Res> {
  _$InitializationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartEventImplCopyWith<$Res> {
  factory _$$StartEventImplCopyWith(
          _$StartEventImpl value, $Res Function(_$StartEventImpl) then) =
      __$$StartEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartEventImplCopyWithImpl<$Res>
    extends _$InitializationEventCopyWithImpl<$Res, _$StartEventImpl>
    implements _$$StartEventImplCopyWith<$Res> {
  __$$StartEventImplCopyWithImpl(
      _$StartEventImpl _value, $Res Function(_$StartEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartEventImpl implements _StartEvent {
  const _$StartEventImpl();

  @override
  String toString() {
    return 'InitializationEvent.start()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() start,
  }) {
    return start();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? start,
  }) {
    return start?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? start,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartEvent value) start,
  }) {
    return start(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartEvent value)? start,
  }) {
    return start?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartEvent value)? start,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start(this);
    }
    return orElse();
  }
}

abstract class _StartEvent implements InitializationEvent {
  const factory _StartEvent() = _$StartEventImpl;
}

/// @nodoc
mixin _$InitializationState {
  BlocStatus get status => throw _privateConstructorUsedError;
  InitializationStatus? get initializationStatus =>
      throw _privateConstructorUsedError;
  Object? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InitializationStateCopyWith<InitializationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitializationStateCopyWith<$Res> {
  factory $InitializationStateCopyWith(
          InitializationState value, $Res Function(InitializationState) then) =
      _$InitializationStateCopyWithImpl<$Res, InitializationState>;
  @useResult
  $Res call(
      {BlocStatus status,
      InitializationStatus? initializationStatus,
      Object? error});
}

/// @nodoc
class _$InitializationStateCopyWithImpl<$Res, $Val extends InitializationState>
    implements $InitializationStateCopyWith<$Res> {
  _$InitializationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? initializationStatus = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      initializationStatus: freezed == initializationStatus
          ? _value.initializationStatus
          : initializationStatus // ignore: cast_nullable_to_non_nullable
              as InitializationStatus?,
      error: freezed == error ? _value.error : error,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitializationStateImplCopyWith<$Res>
    implements $InitializationStateCopyWith<$Res> {
  factory _$$InitializationStateImplCopyWith(_$InitializationStateImpl value,
          $Res Function(_$InitializationStateImpl) then) =
      __$$InitializationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BlocStatus status,
      InitializationStatus? initializationStatus,
      Object? error});
}

/// @nodoc
class __$$InitializationStateImplCopyWithImpl<$Res>
    extends _$InitializationStateCopyWithImpl<$Res, _$InitializationStateImpl>
    implements _$$InitializationStateImplCopyWith<$Res> {
  __$$InitializationStateImplCopyWithImpl(_$InitializationStateImpl _value,
      $Res Function(_$InitializationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? initializationStatus = freezed,
    Object? error = freezed,
  }) {
    return _then(_$InitializationStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      initializationStatus: freezed == initializationStatus
          ? _value.initializationStatus
          : initializationStatus // ignore: cast_nullable_to_non_nullable
              as InitializationStatus?,
      error: freezed == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$InitializationStateImpl implements _InitializationState {
  const _$InitializationStateImpl(
      {required this.status, this.initializationStatus, this.error});

  @override
  final BlocStatus status;
  @override
  final InitializationStatus? initializationStatus;
  @override
  final Object? error;

  @override
  String toString() {
    return 'InitializationState(status: $status, initializationStatus: $initializationStatus, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializationStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.initializationStatus, initializationStatus) ||
                other.initializationStatus == initializationStatus) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, initializationStatus,
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializationStateImplCopyWith<_$InitializationStateImpl> get copyWith =>
      __$$InitializationStateImplCopyWithImpl<_$InitializationStateImpl>(
          this, _$identity);
}

abstract class _InitializationState implements InitializationState {
  const factory _InitializationState(
      {required final BlocStatus status,
      final InitializationStatus? initializationStatus,
      final Object? error}) = _$InitializationStateImpl;

  @override
  BlocStatus get status;
  @override
  InitializationStatus? get initializationStatus;
  @override
  Object? get error;
  @override
  @JsonKey(ignore: true)
  _$$InitializationStateImplCopyWith<_$InitializationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
