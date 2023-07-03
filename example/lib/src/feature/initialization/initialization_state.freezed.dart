// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'initialization_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InitializationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isStartSuccess, bool isPaywallsFetched,
            ApphudPaywalls paywalls)
        trying,
    required TResult Function(ApphudPaywalls paywalls) success,
    required TResult Function(String error) startFail,
    required TResult Function(String error) paywallsFetchFail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isStartSuccess, bool isPaywallsFetched,
            ApphudPaywalls paywalls)?
        trying,
    TResult Function(ApphudPaywalls paywalls)? success,
    TResult Function(String error)? startFail,
    TResult Function(String error)? paywallsFetchFail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isStartSuccess, bool isPaywallsFetched,
            ApphudPaywalls paywalls)?
        trying,
    TResult Function(ApphudPaywalls paywalls)? success,
    TResult Function(String error)? startFail,
    TResult Function(String error)? paywallsFetchFail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Trying value) trying,
    required TResult Function(Success value) success,
    required TResult Function(StartFail value) startFail,
    required TResult Function(PaywallsFetchFail value) paywallsFetchFail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Trying value)? trying,
    TResult Function(Success value)? success,
    TResult Function(StartFail value)? startFail,
    TResult Function(PaywallsFetchFail value)? paywallsFetchFail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Trying value)? trying,
    TResult Function(Success value)? success,
    TResult Function(StartFail value)? startFail,
    TResult Function(PaywallsFetchFail value)? paywallsFetchFail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitializationStateCopyWith<$Res> {
  factory $InitializationStateCopyWith(
          InitializationState value, $Res Function(InitializationState) then) =
      _$InitializationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitializationStateCopyWithImpl<$Res>
    implements $InitializationStateCopyWith<$Res> {
  _$InitializationStateCopyWithImpl(this._value, this._then);

  final InitializationState _value;
  // ignore: unused_field
  final $Res Function(InitializationState) _then;
}

/// @nodoc
abstract class _$$TryingCopyWith<$Res> {
  factory _$$TryingCopyWith(_$Trying value, $Res Function(_$Trying) then) =
      __$$TryingCopyWithImpl<$Res>;
  $Res call(
      {bool isStartSuccess, bool isPaywallsFetched, ApphudPaywalls paywalls});
}

/// @nodoc
class __$$TryingCopyWithImpl<$Res>
    extends _$InitializationStateCopyWithImpl<$Res>
    implements _$$TryingCopyWith<$Res> {
  __$$TryingCopyWithImpl(_$Trying _value, $Res Function(_$Trying) _then)
      : super(_value, (v) => _then(v as _$Trying));

  @override
  _$Trying get _value => super._value as _$Trying;

  @override
  $Res call({
    Object? isStartSuccess = freezed,
    Object? isPaywallsFetched = freezed,
    Object? paywalls = freezed,
  }) {
    return _then(_$Trying(
      isStartSuccess: isStartSuccess == freezed
          ? _value.isStartSuccess
          : isStartSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaywallsFetched: isPaywallsFetched == freezed
          ? _value.isPaywallsFetched
          : isPaywallsFetched // ignore: cast_nullable_to_non_nullable
              as bool,
      paywalls: paywalls == freezed
          ? _value.paywalls
          : paywalls // ignore: cast_nullable_to_non_nullable
              as ApphudPaywalls,
    ));
  }
}

/// @nodoc

class _$Trying extends Trying {
  const _$Trying(
      {this.isStartSuccess = false,
      this.isPaywallsFetched = false,
      this.paywalls = const ApphudPaywalls()})
      : super._();

  @override
  @JsonKey()
  final bool isStartSuccess;
  @override
  @JsonKey()
  final bool isPaywallsFetched;
  @override
  @JsonKey()
  final ApphudPaywalls paywalls;

  @override
  String toString() {
    return 'InitializationState.trying(isStartSuccess: $isStartSuccess, isPaywallsFetched: $isPaywallsFetched, paywalls: $paywalls)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Trying &&
            const DeepCollectionEquality()
                .equals(other.isStartSuccess, isStartSuccess) &&
            const DeepCollectionEquality()
                .equals(other.isPaywallsFetched, isPaywallsFetched) &&
            const DeepCollectionEquality().equals(other.paywalls, paywalls));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isStartSuccess),
      const DeepCollectionEquality().hash(isPaywallsFetched),
      const DeepCollectionEquality().hash(paywalls));

  @JsonKey(ignore: true)
  @override
  _$$TryingCopyWith<_$Trying> get copyWith =>
      __$$TryingCopyWithImpl<_$Trying>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isStartSuccess, bool isPaywallsFetched,
            ApphudPaywalls paywalls)
        trying,
    required TResult Function(ApphudPaywalls paywalls) success,
    required TResult Function(String error) startFail,
    required TResult Function(String error) paywallsFetchFail,
  }) {
    return trying(isStartSuccess, isPaywallsFetched, paywalls);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isStartSuccess, bool isPaywallsFetched,
            ApphudPaywalls paywalls)?
        trying,
    TResult Function(ApphudPaywalls paywalls)? success,
    TResult Function(String error)? startFail,
    TResult Function(String error)? paywallsFetchFail,
  }) {
    return trying?.call(isStartSuccess, isPaywallsFetched, paywalls);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isStartSuccess, bool isPaywallsFetched,
            ApphudPaywalls paywalls)?
        trying,
    TResult Function(ApphudPaywalls paywalls)? success,
    TResult Function(String error)? startFail,
    TResult Function(String error)? paywallsFetchFail,
    required TResult orElse(),
  }) {
    if (trying != null) {
      return trying(isStartSuccess, isPaywallsFetched, paywalls);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Trying value) trying,
    required TResult Function(Success value) success,
    required TResult Function(StartFail value) startFail,
    required TResult Function(PaywallsFetchFail value) paywallsFetchFail,
  }) {
    return trying(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Trying value)? trying,
    TResult Function(Success value)? success,
    TResult Function(StartFail value)? startFail,
    TResult Function(PaywallsFetchFail value)? paywallsFetchFail,
  }) {
    return trying?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Trying value)? trying,
    TResult Function(Success value)? success,
    TResult Function(StartFail value)? startFail,
    TResult Function(PaywallsFetchFail value)? paywallsFetchFail,
    required TResult orElse(),
  }) {
    if (trying != null) {
      return trying(this);
    }
    return orElse();
  }
}

abstract class Trying extends InitializationState {
  const factory Trying(
      {final bool isStartSuccess,
      final bool isPaywallsFetched,
      final ApphudPaywalls paywalls}) = _$Trying;
  const Trying._() : super._();

  bool get isStartSuccess;
  bool get isPaywallsFetched;
  ApphudPaywalls get paywalls;
  @JsonKey(ignore: true)
  _$$TryingCopyWith<_$Trying> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessCopyWith<$Res> {
  factory _$$SuccessCopyWith(_$Success value, $Res Function(_$Success) then) =
      __$$SuccessCopyWithImpl<$Res>;
  $Res call({ApphudPaywalls paywalls});
}

/// @nodoc
class __$$SuccessCopyWithImpl<$Res>
    extends _$InitializationStateCopyWithImpl<$Res>
    implements _$$SuccessCopyWith<$Res> {
  __$$SuccessCopyWithImpl(_$Success _value, $Res Function(_$Success) _then)
      : super(_value, (v) => _then(v as _$Success));

  @override
  _$Success get _value => super._value as _$Success;

  @override
  $Res call({
    Object? paywalls = freezed,
  }) {
    return _then(_$Success(
      paywalls: paywalls == freezed
          ? _value.paywalls
          : paywalls // ignore: cast_nullable_to_non_nullable
              as ApphudPaywalls,
    ));
  }
}

/// @nodoc

class _$Success extends Success {
  const _$Success({this.paywalls = const ApphudPaywalls()}) : super._();

  @override
  @JsonKey()
  final ApphudPaywalls paywalls;

  @override
  String toString() {
    return 'InitializationState.success(paywalls: $paywalls)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Success &&
            const DeepCollectionEquality().equals(other.paywalls, paywalls));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(paywalls));

  @JsonKey(ignore: true)
  @override
  _$$SuccessCopyWith<_$Success> get copyWith =>
      __$$SuccessCopyWithImpl<_$Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isStartSuccess, bool isPaywallsFetched,
            ApphudPaywalls paywalls)
        trying,
    required TResult Function(ApphudPaywalls paywalls) success,
    required TResult Function(String error) startFail,
    required TResult Function(String error) paywallsFetchFail,
  }) {
    return success(paywalls);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isStartSuccess, bool isPaywallsFetched,
            ApphudPaywalls paywalls)?
        trying,
    TResult Function(ApphudPaywalls paywalls)? success,
    TResult Function(String error)? startFail,
    TResult Function(String error)? paywallsFetchFail,
  }) {
    return success?.call(paywalls);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isStartSuccess, bool isPaywallsFetched,
            ApphudPaywalls paywalls)?
        trying,
    TResult Function(ApphudPaywalls paywalls)? success,
    TResult Function(String error)? startFail,
    TResult Function(String error)? paywallsFetchFail,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(paywalls);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Trying value) trying,
    required TResult Function(Success value) success,
    required TResult Function(StartFail value) startFail,
    required TResult Function(PaywallsFetchFail value) paywallsFetchFail,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Trying value)? trying,
    TResult Function(Success value)? success,
    TResult Function(StartFail value)? startFail,
    TResult Function(PaywallsFetchFail value)? paywallsFetchFail,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Trying value)? trying,
    TResult Function(Success value)? success,
    TResult Function(StartFail value)? startFail,
    TResult Function(PaywallsFetchFail value)? paywallsFetchFail,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success extends InitializationState {
  const factory Success({final ApphudPaywalls paywalls}) = _$Success;
  const Success._() : super._();

  ApphudPaywalls get paywalls;
  @JsonKey(ignore: true)
  _$$SuccessCopyWith<_$Success> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StartFailCopyWith<$Res> {
  factory _$$StartFailCopyWith(
          _$StartFail value, $Res Function(_$StartFail) then) =
      __$$StartFailCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class __$$StartFailCopyWithImpl<$Res>
    extends _$InitializationStateCopyWithImpl<$Res>
    implements _$$StartFailCopyWith<$Res> {
  __$$StartFailCopyWithImpl(
      _$StartFail _value, $Res Function(_$StartFail) _then)
      : super(_value, (v) => _then(v as _$StartFail));

  @override
  _$StartFail get _value => super._value as _$StartFail;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$StartFail(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$StartFail extends StartFail {
  const _$StartFail(this.error) : super._();

  @override
  final String error;

  @override
  String toString() {
    return 'InitializationState.startFail(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartFail &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$StartFailCopyWith<_$StartFail> get copyWith =>
      __$$StartFailCopyWithImpl<_$StartFail>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isStartSuccess, bool isPaywallsFetched,
            ApphudPaywalls paywalls)
        trying,
    required TResult Function(ApphudPaywalls paywalls) success,
    required TResult Function(String error) startFail,
    required TResult Function(String error) paywallsFetchFail,
  }) {
    return startFail(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isStartSuccess, bool isPaywallsFetched,
            ApphudPaywalls paywalls)?
        trying,
    TResult Function(ApphudPaywalls paywalls)? success,
    TResult Function(String error)? startFail,
    TResult Function(String error)? paywallsFetchFail,
  }) {
    return startFail?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isStartSuccess, bool isPaywallsFetched,
            ApphudPaywalls paywalls)?
        trying,
    TResult Function(ApphudPaywalls paywalls)? success,
    TResult Function(String error)? startFail,
    TResult Function(String error)? paywallsFetchFail,
    required TResult orElse(),
  }) {
    if (startFail != null) {
      return startFail(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Trying value) trying,
    required TResult Function(Success value) success,
    required TResult Function(StartFail value) startFail,
    required TResult Function(PaywallsFetchFail value) paywallsFetchFail,
  }) {
    return startFail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Trying value)? trying,
    TResult Function(Success value)? success,
    TResult Function(StartFail value)? startFail,
    TResult Function(PaywallsFetchFail value)? paywallsFetchFail,
  }) {
    return startFail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Trying value)? trying,
    TResult Function(Success value)? success,
    TResult Function(StartFail value)? startFail,
    TResult Function(PaywallsFetchFail value)? paywallsFetchFail,
    required TResult orElse(),
  }) {
    if (startFail != null) {
      return startFail(this);
    }
    return orElse();
  }
}

abstract class StartFail extends InitializationState {
  const factory StartFail(final String error) = _$StartFail;
  const StartFail._() : super._();

  String get error;
  @JsonKey(ignore: true)
  _$$StartFailCopyWith<_$StartFail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PaywallsFetchFailCopyWith<$Res> {
  factory _$$PaywallsFetchFailCopyWith(
          _$PaywallsFetchFail value, $Res Function(_$PaywallsFetchFail) then) =
      __$$PaywallsFetchFailCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class __$$PaywallsFetchFailCopyWithImpl<$Res>
    extends _$InitializationStateCopyWithImpl<$Res>
    implements _$$PaywallsFetchFailCopyWith<$Res> {
  __$$PaywallsFetchFailCopyWithImpl(
      _$PaywallsFetchFail _value, $Res Function(_$PaywallsFetchFail) _then)
      : super(_value, (v) => _then(v as _$PaywallsFetchFail));

  @override
  _$PaywallsFetchFail get _value => super._value as _$PaywallsFetchFail;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$PaywallsFetchFail(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PaywallsFetchFail extends PaywallsFetchFail {
  const _$PaywallsFetchFail(this.error) : super._();

  @override
  final String error;

  @override
  String toString() {
    return 'InitializationState.paywallsFetchFail(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaywallsFetchFail &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$PaywallsFetchFailCopyWith<_$PaywallsFetchFail> get copyWith =>
      __$$PaywallsFetchFailCopyWithImpl<_$PaywallsFetchFail>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isStartSuccess, bool isPaywallsFetched,
            ApphudPaywalls paywalls)
        trying,
    required TResult Function(ApphudPaywalls paywalls) success,
    required TResult Function(String error) startFail,
    required TResult Function(String error) paywallsFetchFail,
  }) {
    return paywallsFetchFail(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool isStartSuccess, bool isPaywallsFetched,
            ApphudPaywalls paywalls)?
        trying,
    TResult Function(ApphudPaywalls paywalls)? success,
    TResult Function(String error)? startFail,
    TResult Function(String error)? paywallsFetchFail,
  }) {
    return paywallsFetchFail?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isStartSuccess, bool isPaywallsFetched,
            ApphudPaywalls paywalls)?
        trying,
    TResult Function(ApphudPaywalls paywalls)? success,
    TResult Function(String error)? startFail,
    TResult Function(String error)? paywallsFetchFail,
    required TResult orElse(),
  }) {
    if (paywallsFetchFail != null) {
      return paywallsFetchFail(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Trying value) trying,
    required TResult Function(Success value) success,
    required TResult Function(StartFail value) startFail,
    required TResult Function(PaywallsFetchFail value) paywallsFetchFail,
  }) {
    return paywallsFetchFail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Trying value)? trying,
    TResult Function(Success value)? success,
    TResult Function(StartFail value)? startFail,
    TResult Function(PaywallsFetchFail value)? paywallsFetchFail,
  }) {
    return paywallsFetchFail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Trying value)? trying,
    TResult Function(Success value)? success,
    TResult Function(StartFail value)? startFail,
    TResult Function(PaywallsFetchFail value)? paywallsFetchFail,
    required TResult orElse(),
  }) {
    if (paywallsFetchFail != null) {
      return paywallsFetchFail(this);
    }
    return orElse();
  }
}

abstract class PaywallsFetchFail extends InitializationState {
  const factory PaywallsFetchFail(final String error) = _$PaywallsFetchFail;
  const PaywallsFetchFail._() : super._();

  String get error;
  @JsonKey(ignore: true)
  _$$PaywallsFetchFailCopyWith<_$PaywallsFetchFail> get copyWith =>
      throw _privateConstructorUsedError;
}
