// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'initialization_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$InitializationEventTearOff {
  const _$InitializationEventTearOff();

  InitializeTrying initializeTrying() {
    return const InitializeTrying();
  }

  PaywallsFetchSuccess paywallsFetchSuccess(ApphudPaywalls paywalls) {
    return PaywallsFetchSuccess(
      paywalls,
    );
  }
}

/// @nodoc
const $InitializationEvent = _$InitializationEventTearOff();

/// @nodoc
mixin _$InitializationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeTrying,
    required TResult Function(ApphudPaywalls paywalls) paywallsFetchSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initializeTrying,
    TResult Function(ApphudPaywalls paywalls)? paywallsFetchSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeTrying,
    TResult Function(ApphudPaywalls paywalls)? paywallsFetchSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeTrying value) initializeTrying,
    required TResult Function(PaywallsFetchSuccess value) paywallsFetchSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitializeTrying value)? initializeTrying,
    TResult Function(PaywallsFetchSuccess value)? paywallsFetchSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeTrying value)? initializeTrying,
    TResult Function(PaywallsFetchSuccess value)? paywallsFetchSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitializationEventCopyWith<$Res> {
  factory $InitializationEventCopyWith(
          InitializationEvent value, $Res Function(InitializationEvent) then) =
      _$InitializationEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitializationEventCopyWithImpl<$Res>
    implements $InitializationEventCopyWith<$Res> {
  _$InitializationEventCopyWithImpl(this._value, this._then);

  final InitializationEvent _value;
  // ignore: unused_field
  final $Res Function(InitializationEvent) _then;
}

/// @nodoc
abstract class $InitializeTryingCopyWith<$Res> {
  factory $InitializeTryingCopyWith(
          InitializeTrying value, $Res Function(InitializeTrying) then) =
      _$InitializeTryingCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitializeTryingCopyWithImpl<$Res>
    extends _$InitializationEventCopyWithImpl<$Res>
    implements $InitializeTryingCopyWith<$Res> {
  _$InitializeTryingCopyWithImpl(
      InitializeTrying _value, $Res Function(InitializeTrying) _then)
      : super(_value, (v) => _then(v as InitializeTrying));

  @override
  InitializeTrying get _value => super._value as InitializeTrying;
}

/// @nodoc

class _$InitializeTrying extends InitializeTrying {
  const _$InitializeTrying() : super._();

  @override
  String toString() {
    return 'InitializationEvent.initializeTrying()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitializeTrying);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeTrying,
    required TResult Function(ApphudPaywalls paywalls) paywallsFetchSuccess,
  }) {
    return initializeTrying();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initializeTrying,
    TResult Function(ApphudPaywalls paywalls)? paywallsFetchSuccess,
  }) {
    return initializeTrying?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeTrying,
    TResult Function(ApphudPaywalls paywalls)? paywallsFetchSuccess,
    required TResult orElse(),
  }) {
    if (initializeTrying != null) {
      return initializeTrying();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeTrying value) initializeTrying,
    required TResult Function(PaywallsFetchSuccess value) paywallsFetchSuccess,
  }) {
    return initializeTrying(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitializeTrying value)? initializeTrying,
    TResult Function(PaywallsFetchSuccess value)? paywallsFetchSuccess,
  }) {
    return initializeTrying?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeTrying value)? initializeTrying,
    TResult Function(PaywallsFetchSuccess value)? paywallsFetchSuccess,
    required TResult orElse(),
  }) {
    if (initializeTrying != null) {
      return initializeTrying(this);
    }
    return orElse();
  }
}

abstract class InitializeTrying extends InitializationEvent {
  const factory InitializeTrying() = _$InitializeTrying;
  const InitializeTrying._() : super._();
}

/// @nodoc
abstract class $PaywallsFetchSuccessCopyWith<$Res> {
  factory $PaywallsFetchSuccessCopyWith(PaywallsFetchSuccess value,
          $Res Function(PaywallsFetchSuccess) then) =
      _$PaywallsFetchSuccessCopyWithImpl<$Res>;
  $Res call({ApphudPaywalls paywalls});
}

/// @nodoc
class _$PaywallsFetchSuccessCopyWithImpl<$Res>
    extends _$InitializationEventCopyWithImpl<$Res>
    implements $PaywallsFetchSuccessCopyWith<$Res> {
  _$PaywallsFetchSuccessCopyWithImpl(
      PaywallsFetchSuccess _value, $Res Function(PaywallsFetchSuccess) _then)
      : super(_value, (v) => _then(v as PaywallsFetchSuccess));

  @override
  PaywallsFetchSuccess get _value => super._value as PaywallsFetchSuccess;

  @override
  $Res call({
    Object? paywalls = freezed,
  }) {
    return _then(PaywallsFetchSuccess(
      paywalls == freezed
          ? _value.paywalls
          : paywalls // ignore: cast_nullable_to_non_nullable
              as ApphudPaywalls,
    ));
  }
}

/// @nodoc

class _$PaywallsFetchSuccess extends PaywallsFetchSuccess {
  const _$PaywallsFetchSuccess(this.paywalls) : super._();

  @override
  final ApphudPaywalls paywalls;

  @override
  String toString() {
    return 'InitializationEvent.paywallsFetchSuccess(paywalls: $paywalls)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PaywallsFetchSuccess &&
            (identical(other.paywalls, paywalls) ||
                const DeepCollectionEquality()
                    .equals(other.paywalls, paywalls)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(paywalls);

  @JsonKey(ignore: true)
  @override
  $PaywallsFetchSuccessCopyWith<PaywallsFetchSuccess> get copyWith =>
      _$PaywallsFetchSuccessCopyWithImpl<PaywallsFetchSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeTrying,
    required TResult Function(ApphudPaywalls paywalls) paywallsFetchSuccess,
  }) {
    return paywallsFetchSuccess(paywalls);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initializeTrying,
    TResult Function(ApphudPaywalls paywalls)? paywallsFetchSuccess,
  }) {
    return paywallsFetchSuccess?.call(paywalls);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeTrying,
    TResult Function(ApphudPaywalls paywalls)? paywallsFetchSuccess,
    required TResult orElse(),
  }) {
    if (paywallsFetchSuccess != null) {
      return paywallsFetchSuccess(paywalls);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeTrying value) initializeTrying,
    required TResult Function(PaywallsFetchSuccess value) paywallsFetchSuccess,
  }) {
    return paywallsFetchSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitializeTrying value)? initializeTrying,
    TResult Function(PaywallsFetchSuccess value)? paywallsFetchSuccess,
  }) {
    return paywallsFetchSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeTrying value)? initializeTrying,
    TResult Function(PaywallsFetchSuccess value)? paywallsFetchSuccess,
    required TResult orElse(),
  }) {
    if (paywallsFetchSuccess != null) {
      return paywallsFetchSuccess(this);
    }
    return orElse();
  }
}

abstract class PaywallsFetchSuccess extends InitializationEvent {
  const factory PaywallsFetchSuccess(ApphudPaywalls paywalls) =
      _$PaywallsFetchSuccess;
  const PaywallsFetchSuccess._() : super._();

  ApphudPaywalls get paywalls => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaywallsFetchSuccessCopyWith<PaywallsFetchSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}
