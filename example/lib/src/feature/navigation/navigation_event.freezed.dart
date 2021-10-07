// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'navigation_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NavigationEventTearOff {
  const _$NavigationEventTearOff();

  ToStart toStart() {
    return const ToStart();
  }

  ToHome toHome() {
    return const ToHome();
  }
}

/// @nodoc
const $NavigationEvent = _$NavigationEventTearOff();

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
abstract class $ToStartCopyWith<$Res> {
  factory $ToStartCopyWith(ToStart value, $Res Function(ToStart) then) =
      _$ToStartCopyWithImpl<$Res>;
}

/// @nodoc
class _$ToStartCopyWithImpl<$Res> extends _$NavigationEventCopyWithImpl<$Res>
    implements $ToStartCopyWith<$Res> {
  _$ToStartCopyWithImpl(ToStart _value, $Res Function(ToStart) _then)
      : super(_value, (v) => _then(v as ToStart));

  @override
  ToStart get _value => super._value as ToStart;
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
    return identical(this, other) || (other is ToStart);
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
abstract class $ToHomeCopyWith<$Res> {
  factory $ToHomeCopyWith(ToHome value, $Res Function(ToHome) then) =
      _$ToHomeCopyWithImpl<$Res>;
}

/// @nodoc
class _$ToHomeCopyWithImpl<$Res> extends _$NavigationEventCopyWithImpl<$Res>
    implements $ToHomeCopyWith<$Res> {
  _$ToHomeCopyWithImpl(ToHome _value, $Res Function(ToHome) _then)
      : super(_value, (v) => _then(v as ToHome));

  @override
  ToHome get _value => super._value as ToHome;
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
    return identical(this, other) || (other is ToHome);
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
