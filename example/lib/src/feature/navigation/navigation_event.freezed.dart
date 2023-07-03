// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
    TResult Function()? toStart,
    TResult Function()? toHome,
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
    TResult Function(ToStart value)? toStart,
    TResult Function(ToHome value)? toHome,
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
      _$NavigationEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$NavigationEventCopyWithImpl<$Res>
    implements $NavigationEventCopyWith<$Res> {
  _$NavigationEventCopyWithImpl(this._value, this._then);

  final NavigationEvent _value;
  // ignore: unused_field
  final $Res Function(NavigationEvent) _then;
}

/// @nodoc
abstract class _$$ToStartCopyWith<$Res> {
  factory _$$ToStartCopyWith(_$ToStart value, $Res Function(_$ToStart) then) =
      __$$ToStartCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToStartCopyWithImpl<$Res> extends _$NavigationEventCopyWithImpl<$Res>
    implements _$$ToStartCopyWith<$Res> {
  __$$ToStartCopyWithImpl(_$ToStart _value, $Res Function(_$ToStart) _then)
      : super(_value, (v) => _then(v as _$ToStart));

  @override
  _$ToStart get _value => super._value as _$ToStart;
}

/// @nodoc

class _$ToStart extends ToStart {
  const _$ToStart() : super._();

  @override
  String toString() {
    return 'NavigationEvent.toStart()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ToStart);
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
    TResult Function()? toStart,
    TResult Function()? toHome,
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
    TResult Function(ToStart value)? toStart,
    TResult Function(ToHome value)? toHome,
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
  const factory ToStart() = _$ToStart;
  const ToStart._() : super._();
}

/// @nodoc
abstract class _$$ToHomeCopyWith<$Res> {
  factory _$$ToHomeCopyWith(_$ToHome value, $Res Function(_$ToHome) then) =
      __$$ToHomeCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToHomeCopyWithImpl<$Res> extends _$NavigationEventCopyWithImpl<$Res>
    implements _$$ToHomeCopyWith<$Res> {
  __$$ToHomeCopyWithImpl(_$ToHome _value, $Res Function(_$ToHome) _then)
      : super(_value, (v) => _then(v as _$ToHome));

  @override
  _$ToHome get _value => super._value as _$ToHome;
}

/// @nodoc

class _$ToHome extends ToHome {
  const _$ToHome() : super._();

  @override
  String toString() {
    return 'NavigationEvent.toHome()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ToHome);
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
    TResult Function()? toStart,
    TResult Function()? toHome,
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
    TResult Function(ToStart value)? toStart,
    TResult Function(ToHome value)? toHome,
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
  const factory ToHome() = _$ToHome;
  const ToHome._() : super._();
}
