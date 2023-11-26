// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
    TResult? Function(bool isStartSuccess, bool isPaywallsFetched,
            ApphudPaywalls paywalls)?
        trying,
    TResult? Function(ApphudPaywalls paywalls)? success,
    TResult? Function(String error)? startFail,
    TResult? Function(String error)? paywallsFetchFail,
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
    TResult? Function(Trying value)? trying,
    TResult? Function(Success value)? success,
    TResult? Function(StartFail value)? startFail,
    TResult? Function(PaywallsFetchFail value)? paywallsFetchFail,
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
      _$InitializationStateCopyWithImpl<$Res, InitializationState>;
}

/// @nodoc
class _$InitializationStateCopyWithImpl<$Res, $Val extends InitializationState>
    implements $InitializationStateCopyWith<$Res> {
  _$InitializationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$TryingImplCopyWith<$Res> {
  factory _$$TryingImplCopyWith(
          _$TryingImpl value, $Res Function(_$TryingImpl) then) =
      __$$TryingImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {bool isStartSuccess, bool isPaywallsFetched, ApphudPaywalls paywalls});
}

/// @nodoc
class __$$TryingImplCopyWithImpl<$Res>
    extends _$InitializationStateCopyWithImpl<$Res, _$TryingImpl>
    implements _$$TryingImplCopyWith<$Res> {
  __$$TryingImplCopyWithImpl(
      _$TryingImpl _value, $Res Function(_$TryingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isStartSuccess = null,
    Object? isPaywallsFetched = null,
    Object? paywalls = null,
  }) {
    return _then(_$TryingImpl(
      isStartSuccess: null == isStartSuccess
          ? _value.isStartSuccess
          : isStartSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaywallsFetched: null == isPaywallsFetched
          ? _value.isPaywallsFetched
          : isPaywallsFetched // ignore: cast_nullable_to_non_nullable
              as bool,
      paywalls: null == paywalls
          ? _value.paywalls
          : paywalls // ignore: cast_nullable_to_non_nullable
              as ApphudPaywalls,
    ));
  }
}

/// @nodoc

class _$TryingImpl extends Trying {
  const _$TryingImpl(
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
            other is _$TryingImpl &&
            (identical(other.isStartSuccess, isStartSuccess) ||
                other.isStartSuccess == isStartSuccess) &&
            (identical(other.isPaywallsFetched, isPaywallsFetched) ||
                other.isPaywallsFetched == isPaywallsFetched) &&
            (identical(other.paywalls, paywalls) ||
                other.paywalls == paywalls));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isStartSuccess, isPaywallsFetched, paywalls);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TryingImplCopyWith<_$TryingImpl> get copyWith =>
      __$$TryingImplCopyWithImpl<_$TryingImpl>(this, _$identity);

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
    TResult? Function(bool isStartSuccess, bool isPaywallsFetched,
            ApphudPaywalls paywalls)?
        trying,
    TResult? Function(ApphudPaywalls paywalls)? success,
    TResult? Function(String error)? startFail,
    TResult? Function(String error)? paywallsFetchFail,
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
    TResult? Function(Trying value)? trying,
    TResult? Function(Success value)? success,
    TResult? Function(StartFail value)? startFail,
    TResult? Function(PaywallsFetchFail value)? paywallsFetchFail,
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
      final ApphudPaywalls paywalls}) = _$TryingImpl;
  const Trying._() : super._();

  bool get isStartSuccess;
  bool get isPaywallsFetched;
  ApphudPaywalls get paywalls;
  @JsonKey(ignore: true)
  _$$TryingImplCopyWith<_$TryingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ApphudPaywalls paywalls});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$InitializationStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paywalls = null,
  }) {
    return _then(_$SuccessImpl(
      paywalls: null == paywalls
          ? _value.paywalls
          : paywalls // ignore: cast_nullable_to_non_nullable
              as ApphudPaywalls,
    ));
  }
}

/// @nodoc

class _$SuccessImpl extends Success {
  const _$SuccessImpl({this.paywalls = const ApphudPaywalls()}) : super._();

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
            other is _$SuccessImpl &&
            (identical(other.paywalls, paywalls) ||
                other.paywalls == paywalls));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paywalls);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

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
    TResult? Function(bool isStartSuccess, bool isPaywallsFetched,
            ApphudPaywalls paywalls)?
        trying,
    TResult? Function(ApphudPaywalls paywalls)? success,
    TResult? Function(String error)? startFail,
    TResult? Function(String error)? paywallsFetchFail,
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
    TResult? Function(Trying value)? trying,
    TResult? Function(Success value)? success,
    TResult? Function(StartFail value)? startFail,
    TResult? Function(PaywallsFetchFail value)? paywallsFetchFail,
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
  const factory Success({final ApphudPaywalls paywalls}) = _$SuccessImpl;
  const Success._() : super._();

  ApphudPaywalls get paywalls;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StartFailImplCopyWith<$Res> {
  factory _$$StartFailImplCopyWith(
          _$StartFailImpl value, $Res Function(_$StartFailImpl) then) =
      __$$StartFailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$StartFailImplCopyWithImpl<$Res>
    extends _$InitializationStateCopyWithImpl<$Res, _$StartFailImpl>
    implements _$$StartFailImplCopyWith<$Res> {
  __$$StartFailImplCopyWithImpl(
      _$StartFailImpl _value, $Res Function(_$StartFailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$StartFailImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$StartFailImpl extends StartFail {
  const _$StartFailImpl(this.error) : super._();

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
            other is _$StartFailImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StartFailImplCopyWith<_$StartFailImpl> get copyWith =>
      __$$StartFailImplCopyWithImpl<_$StartFailImpl>(this, _$identity);

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
    TResult? Function(bool isStartSuccess, bool isPaywallsFetched,
            ApphudPaywalls paywalls)?
        trying,
    TResult? Function(ApphudPaywalls paywalls)? success,
    TResult? Function(String error)? startFail,
    TResult? Function(String error)? paywallsFetchFail,
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
    TResult? Function(Trying value)? trying,
    TResult? Function(Success value)? success,
    TResult? Function(StartFail value)? startFail,
    TResult? Function(PaywallsFetchFail value)? paywallsFetchFail,
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
  const factory StartFail(final String error) = _$StartFailImpl;
  const StartFail._() : super._();

  String get error;
  @JsonKey(ignore: true)
  _$$StartFailImplCopyWith<_$StartFailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PaywallsFetchFailImplCopyWith<$Res> {
  factory _$$PaywallsFetchFailImplCopyWith(_$PaywallsFetchFailImpl value,
          $Res Function(_$PaywallsFetchFailImpl) then) =
      __$$PaywallsFetchFailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$PaywallsFetchFailImplCopyWithImpl<$Res>
    extends _$InitializationStateCopyWithImpl<$Res, _$PaywallsFetchFailImpl>
    implements _$$PaywallsFetchFailImplCopyWith<$Res> {
  __$$PaywallsFetchFailImplCopyWithImpl(_$PaywallsFetchFailImpl _value,
      $Res Function(_$PaywallsFetchFailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$PaywallsFetchFailImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PaywallsFetchFailImpl extends PaywallsFetchFail {
  const _$PaywallsFetchFailImpl(this.error) : super._();

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
            other is _$PaywallsFetchFailImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaywallsFetchFailImplCopyWith<_$PaywallsFetchFailImpl> get copyWith =>
      __$$PaywallsFetchFailImplCopyWithImpl<_$PaywallsFetchFailImpl>(
          this, _$identity);

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
    TResult? Function(bool isStartSuccess, bool isPaywallsFetched,
            ApphudPaywalls paywalls)?
        trying,
    TResult? Function(ApphudPaywalls paywalls)? success,
    TResult? Function(String error)? startFail,
    TResult? Function(String error)? paywallsFetchFail,
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
    TResult? Function(Trying value)? trying,
    TResult? Function(Success value)? success,
    TResult? Function(StartFail value)? startFail,
    TResult? Function(PaywallsFetchFail value)? paywallsFetchFail,
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
  const factory PaywallsFetchFail(final String error) = _$PaywallsFetchFailImpl;
  const PaywallsFetchFail._() : super._();

  String get error;
  @JsonKey(ignore: true)
  _$$PaywallsFetchFailImplCopyWith<_$PaywallsFetchFailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
