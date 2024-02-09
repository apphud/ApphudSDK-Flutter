// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'navigation_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NavigationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() toStart,
    required TResult Function() toHome,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? toStart,
    TResult? Function()? toHome,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? toStart,
    TResult Function()? toHome,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ToStart value) toStart,
    required TResult Function(ToHome value) toHome,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ToStart value)? toStart,
    TResult? Function(ToHome value)? toHome,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ToStart value)? toStart,
    TResult Function(ToHome value)? toHome,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationEventCopyWith<$Res> {
  factory $NavigationEventCopyWith(
          NavigationEvent value, $Res Function(NavigationEvent) then) =
      _$NavigationEventCopyWithImpl<$Res, NavigationEvent>;
}

/// @nodoc
class _$NavigationEventCopyWithImpl<$Res, $Val extends NavigationEvent>
    implements $NavigationEventCopyWith<$Res> {
  _$NavigationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ToStartImplCopyWith<$Res> {
  factory _$$ToStartImplCopyWith(
          _$ToStartImpl value, $Res Function(_$ToStartImpl) then) =
      __$$ToStartImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToStartImplCopyWithImpl<$Res>
    extends _$NavigationEventCopyWithImpl<$Res, _$ToStartImpl>
    implements _$$ToStartImplCopyWith<$Res> {
  __$$ToStartImplCopyWithImpl(
      _$ToStartImpl _value, $Res Function(_$ToStartImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ToStartImpl extends ToStart {
  const _$ToStartImpl() : super._();

  @override
  String toString() {
    return 'NavigationEvent.toStart()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ToStartImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() toStart,
    required TResult Function() toHome,
  }) {
    return toStart();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? toStart,
    TResult? Function()? toHome,
  }) {
    return toStart?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? toStart,
    TResult Function()? toHome,
    required TResult orElse(),
  }) {
    if (toStart != null) {
      return toStart();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ToStart value) toStart,
    required TResult Function(ToHome value) toHome,
  }) {
    return toStart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ToStart value)? toStart,
    TResult? Function(ToHome value)? toHome,
  }) {
    return toStart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ToStart value)? toStart,
    TResult Function(ToHome value)? toHome,
    required TResult orElse(),
  }) {
    if (toStart != null) {
      return toStart(this);
    }
    return orElse();
  }
}

abstract class ToStart extends NavigationEvent {
  const factory ToStart() = _$ToStartImpl;
  const ToStart._() : super._();
}

/// @nodoc
abstract class _$$ToHomeImplCopyWith<$Res> {
  factory _$$ToHomeImplCopyWith(
          _$ToHomeImpl value, $Res Function(_$ToHomeImpl) then) =
      __$$ToHomeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToHomeImplCopyWithImpl<$Res>
    extends _$NavigationEventCopyWithImpl<$Res, _$ToHomeImpl>
    implements _$$ToHomeImplCopyWith<$Res> {
  __$$ToHomeImplCopyWithImpl(
      _$ToHomeImpl _value, $Res Function(_$ToHomeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ToHomeImpl extends ToHome {
  const _$ToHomeImpl() : super._();

  @override
  String toString() {
    return 'NavigationEvent.toHome()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ToHomeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() toStart,
    required TResult Function() toHome,
  }) {
    return toHome();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? toStart,
    TResult? Function()? toHome,
  }) {
    return toHome?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? toStart,
    TResult Function()? toHome,
    required TResult orElse(),
  }) {
    if (toHome != null) {
      return toHome();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ToStart value) toStart,
    required TResult Function(ToHome value) toHome,
  }) {
    return toHome(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ToStart value)? toStart,
    TResult? Function(ToHome value)? toHome,
  }) {
    return toHome?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ToStart value)? toStart,
    TResult Function(ToHome value)? toHome,
    required TResult orElse(),
  }) {
    if (toHome != null) {
      return toHome(this);
    }
    return orElse();
  }
}

abstract class ToHome extends NavigationEvent {
  const factory ToHome() = _$ToHomeImpl;
  const ToHome._() : super._();
}
