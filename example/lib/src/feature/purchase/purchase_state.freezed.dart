// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'purchase_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PurchaseState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() inProgress,
    required TResult Function() purchaseSuccess,
    required TResult Function(ApphudError error) purchaseFailure,
    required TResult Function() restorePurchasesSuccess,
    required TResult Function(ApphudError error) restorePurchaseFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? inProgress,
    TResult Function()? purchaseSuccess,
    TResult Function(ApphudError error)? purchaseFailure,
    TResult Function()? restorePurchasesSuccess,
    TResult Function(ApphudError error)? restorePurchaseFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? inProgress,
    TResult Function()? purchaseSuccess,
    TResult Function(ApphudError error)? purchaseFailure,
    TResult Function()? restorePurchasesSuccess,
    TResult Function(ApphudError error)? restorePurchaseFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(InProgress value) inProgress,
    required TResult Function(PurchaseSuccess value) purchaseSuccess,
    required TResult Function(PurchaseFailure value) purchaseFailure,
    required TResult Function(RestorePurchasesSuccess value)
        restorePurchasesSuccess,
    required TResult Function(RestorePurchasesFailure value)
        restorePurchaseFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(InProgress value)? inProgress,
    TResult Function(PurchaseSuccess value)? purchaseSuccess,
    TResult Function(PurchaseFailure value)? purchaseFailure,
    TResult Function(RestorePurchasesSuccess value)? restorePurchasesSuccess,
    TResult Function(RestorePurchasesFailure value)? restorePurchaseFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(InProgress value)? inProgress,
    TResult Function(PurchaseSuccess value)? purchaseSuccess,
    TResult Function(PurchaseFailure value)? purchaseFailure,
    TResult Function(RestorePurchasesSuccess value)? restorePurchasesSuccess,
    TResult Function(RestorePurchasesFailure value)? restorePurchaseFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseStateCopyWith<$Res> {
  factory $PurchaseStateCopyWith(
          PurchaseState value, $Res Function(PurchaseState) then) =
      _$PurchaseStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$PurchaseStateCopyWithImpl<$Res>
    implements $PurchaseStateCopyWith<$Res> {
  _$PurchaseStateCopyWithImpl(this._value, this._then);

  final PurchaseState _value;
  // ignore: unused_field
  final $Res Function(PurchaseState) _then;
}

/// @nodoc
abstract class _$$InitCopyWith<$Res> {
  factory _$$InitCopyWith(_$Init value, $Res Function(_$Init) then) =
      __$$InitCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitCopyWithImpl<$Res> extends _$PurchaseStateCopyWithImpl<$Res>
    implements _$$InitCopyWith<$Res> {
  __$$InitCopyWithImpl(_$Init _value, $Res Function(_$Init) _then)
      : super(_value, (v) => _then(v as _$Init));

  @override
  _$Init get _value => super._value as _$Init;
}

/// @nodoc

class _$Init extends Init {
  const _$Init() : super._();

  @override
  String toString() {
    return 'PurchaseState.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Init);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() inProgress,
    required TResult Function() purchaseSuccess,
    required TResult Function(ApphudError error) purchaseFailure,
    required TResult Function() restorePurchasesSuccess,
    required TResult Function(ApphudError error) restorePurchaseFailure,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? inProgress,
    TResult Function()? purchaseSuccess,
    TResult Function(ApphudError error)? purchaseFailure,
    TResult Function()? restorePurchasesSuccess,
    TResult Function(ApphudError error)? restorePurchaseFailure,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? inProgress,
    TResult Function()? purchaseSuccess,
    TResult Function(ApphudError error)? purchaseFailure,
    TResult Function()? restorePurchasesSuccess,
    TResult Function(ApphudError error)? restorePurchaseFailure,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(InProgress value) inProgress,
    required TResult Function(PurchaseSuccess value) purchaseSuccess,
    required TResult Function(PurchaseFailure value) purchaseFailure,
    required TResult Function(RestorePurchasesSuccess value)
        restorePurchasesSuccess,
    required TResult Function(RestorePurchasesFailure value)
        restorePurchaseFailure,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(InProgress value)? inProgress,
    TResult Function(PurchaseSuccess value)? purchaseSuccess,
    TResult Function(PurchaseFailure value)? purchaseFailure,
    TResult Function(RestorePurchasesSuccess value)? restorePurchasesSuccess,
    TResult Function(RestorePurchasesFailure value)? restorePurchaseFailure,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(InProgress value)? inProgress,
    TResult Function(PurchaseSuccess value)? purchaseSuccess,
    TResult Function(PurchaseFailure value)? purchaseFailure,
    TResult Function(RestorePurchasesSuccess value)? restorePurchasesSuccess,
    TResult Function(RestorePurchasesFailure value)? restorePurchaseFailure,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class Init extends PurchaseState {
  const factory Init() = _$Init;
  const Init._() : super._();
}

/// @nodoc
abstract class _$$InProgressCopyWith<$Res> {
  factory _$$InProgressCopyWith(
          _$InProgress value, $Res Function(_$InProgress) then) =
      __$$InProgressCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InProgressCopyWithImpl<$Res> extends _$PurchaseStateCopyWithImpl<$Res>
    implements _$$InProgressCopyWith<$Res> {
  __$$InProgressCopyWithImpl(
      _$InProgress _value, $Res Function(_$InProgress) _then)
      : super(_value, (v) => _then(v as _$InProgress));

  @override
  _$InProgress get _value => super._value as _$InProgress;
}

/// @nodoc

class _$InProgress extends InProgress {
  const _$InProgress() : super._();

  @override
  String toString() {
    return 'PurchaseState.inProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() inProgress,
    required TResult Function() purchaseSuccess,
    required TResult Function(ApphudError error) purchaseFailure,
    required TResult Function() restorePurchasesSuccess,
    required TResult Function(ApphudError error) restorePurchaseFailure,
  }) {
    return inProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? inProgress,
    TResult Function()? purchaseSuccess,
    TResult Function(ApphudError error)? purchaseFailure,
    TResult Function()? restorePurchasesSuccess,
    TResult Function(ApphudError error)? restorePurchaseFailure,
  }) {
    return inProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? inProgress,
    TResult Function()? purchaseSuccess,
    TResult Function(ApphudError error)? purchaseFailure,
    TResult Function()? restorePurchasesSuccess,
    TResult Function(ApphudError error)? restorePurchaseFailure,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(InProgress value) inProgress,
    required TResult Function(PurchaseSuccess value) purchaseSuccess,
    required TResult Function(PurchaseFailure value) purchaseFailure,
    required TResult Function(RestorePurchasesSuccess value)
        restorePurchasesSuccess,
    required TResult Function(RestorePurchasesFailure value)
        restorePurchaseFailure,
  }) {
    return inProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(InProgress value)? inProgress,
    TResult Function(PurchaseSuccess value)? purchaseSuccess,
    TResult Function(PurchaseFailure value)? purchaseFailure,
    TResult Function(RestorePurchasesSuccess value)? restorePurchasesSuccess,
    TResult Function(RestorePurchasesFailure value)? restorePurchaseFailure,
  }) {
    return inProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(InProgress value)? inProgress,
    TResult Function(PurchaseSuccess value)? purchaseSuccess,
    TResult Function(PurchaseFailure value)? purchaseFailure,
    TResult Function(RestorePurchasesSuccess value)? restorePurchasesSuccess,
    TResult Function(RestorePurchasesFailure value)? restorePurchaseFailure,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress(this);
    }
    return orElse();
  }
}

abstract class InProgress extends PurchaseState {
  const factory InProgress() = _$InProgress;
  const InProgress._() : super._();
}

/// @nodoc
abstract class _$$PurchaseSuccessCopyWith<$Res> {
  factory _$$PurchaseSuccessCopyWith(
          _$PurchaseSuccess value, $Res Function(_$PurchaseSuccess) then) =
      __$$PurchaseSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PurchaseSuccessCopyWithImpl<$Res>
    extends _$PurchaseStateCopyWithImpl<$Res>
    implements _$$PurchaseSuccessCopyWith<$Res> {
  __$$PurchaseSuccessCopyWithImpl(
      _$PurchaseSuccess _value, $Res Function(_$PurchaseSuccess) _then)
      : super(_value, (v) => _then(v as _$PurchaseSuccess));

  @override
  _$PurchaseSuccess get _value => super._value as _$PurchaseSuccess;
}

/// @nodoc

class _$PurchaseSuccess extends PurchaseSuccess {
  const _$PurchaseSuccess() : super._();

  @override
  String toString() {
    return 'PurchaseState.purchaseSuccess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PurchaseSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() inProgress,
    required TResult Function() purchaseSuccess,
    required TResult Function(ApphudError error) purchaseFailure,
    required TResult Function() restorePurchasesSuccess,
    required TResult Function(ApphudError error) restorePurchaseFailure,
  }) {
    return purchaseSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? inProgress,
    TResult Function()? purchaseSuccess,
    TResult Function(ApphudError error)? purchaseFailure,
    TResult Function()? restorePurchasesSuccess,
    TResult Function(ApphudError error)? restorePurchaseFailure,
  }) {
    return purchaseSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? inProgress,
    TResult Function()? purchaseSuccess,
    TResult Function(ApphudError error)? purchaseFailure,
    TResult Function()? restorePurchasesSuccess,
    TResult Function(ApphudError error)? restorePurchaseFailure,
    required TResult orElse(),
  }) {
    if (purchaseSuccess != null) {
      return purchaseSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(InProgress value) inProgress,
    required TResult Function(PurchaseSuccess value) purchaseSuccess,
    required TResult Function(PurchaseFailure value) purchaseFailure,
    required TResult Function(RestorePurchasesSuccess value)
        restorePurchasesSuccess,
    required TResult Function(RestorePurchasesFailure value)
        restorePurchaseFailure,
  }) {
    return purchaseSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(InProgress value)? inProgress,
    TResult Function(PurchaseSuccess value)? purchaseSuccess,
    TResult Function(PurchaseFailure value)? purchaseFailure,
    TResult Function(RestorePurchasesSuccess value)? restorePurchasesSuccess,
    TResult Function(RestorePurchasesFailure value)? restorePurchaseFailure,
  }) {
    return purchaseSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(InProgress value)? inProgress,
    TResult Function(PurchaseSuccess value)? purchaseSuccess,
    TResult Function(PurchaseFailure value)? purchaseFailure,
    TResult Function(RestorePurchasesSuccess value)? restorePurchasesSuccess,
    TResult Function(RestorePurchasesFailure value)? restorePurchaseFailure,
    required TResult orElse(),
  }) {
    if (purchaseSuccess != null) {
      return purchaseSuccess(this);
    }
    return orElse();
  }
}

abstract class PurchaseSuccess extends PurchaseState {
  const factory PurchaseSuccess() = _$PurchaseSuccess;
  const PurchaseSuccess._() : super._();
}

/// @nodoc
abstract class _$$PurchaseFailureCopyWith<$Res> {
  factory _$$PurchaseFailureCopyWith(
          _$PurchaseFailure value, $Res Function(_$PurchaseFailure) then) =
      __$$PurchaseFailureCopyWithImpl<$Res>;
  $Res call({ApphudError error});
}

/// @nodoc
class __$$PurchaseFailureCopyWithImpl<$Res>
    extends _$PurchaseStateCopyWithImpl<$Res>
    implements _$$PurchaseFailureCopyWith<$Res> {
  __$$PurchaseFailureCopyWithImpl(
      _$PurchaseFailure _value, $Res Function(_$PurchaseFailure) _then)
      : super(_value, (v) => _then(v as _$PurchaseFailure));

  @override
  _$PurchaseFailure get _value => super._value as _$PurchaseFailure;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$PurchaseFailure(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ApphudError,
    ));
  }
}

/// @nodoc

class _$PurchaseFailure extends PurchaseFailure {
  const _$PurchaseFailure(this.error) : super._();

  @override
  final ApphudError error;

  @override
  String toString() {
    return 'PurchaseState.purchaseFailure(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseFailure &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$PurchaseFailureCopyWith<_$PurchaseFailure> get copyWith =>
      __$$PurchaseFailureCopyWithImpl<_$PurchaseFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() inProgress,
    required TResult Function() purchaseSuccess,
    required TResult Function(ApphudError error) purchaseFailure,
    required TResult Function() restorePurchasesSuccess,
    required TResult Function(ApphudError error) restorePurchaseFailure,
  }) {
    return purchaseFailure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? inProgress,
    TResult Function()? purchaseSuccess,
    TResult Function(ApphudError error)? purchaseFailure,
    TResult Function()? restorePurchasesSuccess,
    TResult Function(ApphudError error)? restorePurchaseFailure,
  }) {
    return purchaseFailure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? inProgress,
    TResult Function()? purchaseSuccess,
    TResult Function(ApphudError error)? purchaseFailure,
    TResult Function()? restorePurchasesSuccess,
    TResult Function(ApphudError error)? restorePurchaseFailure,
    required TResult orElse(),
  }) {
    if (purchaseFailure != null) {
      return purchaseFailure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(InProgress value) inProgress,
    required TResult Function(PurchaseSuccess value) purchaseSuccess,
    required TResult Function(PurchaseFailure value) purchaseFailure,
    required TResult Function(RestorePurchasesSuccess value)
        restorePurchasesSuccess,
    required TResult Function(RestorePurchasesFailure value)
        restorePurchaseFailure,
  }) {
    return purchaseFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(InProgress value)? inProgress,
    TResult Function(PurchaseSuccess value)? purchaseSuccess,
    TResult Function(PurchaseFailure value)? purchaseFailure,
    TResult Function(RestorePurchasesSuccess value)? restorePurchasesSuccess,
    TResult Function(RestorePurchasesFailure value)? restorePurchaseFailure,
  }) {
    return purchaseFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(InProgress value)? inProgress,
    TResult Function(PurchaseSuccess value)? purchaseSuccess,
    TResult Function(PurchaseFailure value)? purchaseFailure,
    TResult Function(RestorePurchasesSuccess value)? restorePurchasesSuccess,
    TResult Function(RestorePurchasesFailure value)? restorePurchaseFailure,
    required TResult orElse(),
  }) {
    if (purchaseFailure != null) {
      return purchaseFailure(this);
    }
    return orElse();
  }
}

abstract class PurchaseFailure extends PurchaseState {
  const factory PurchaseFailure(final ApphudError error) = _$PurchaseFailure;
  const PurchaseFailure._() : super._();

  ApphudError get error;
  @JsonKey(ignore: true)
  _$$PurchaseFailureCopyWith<_$PurchaseFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RestorePurchasesSuccessCopyWith<$Res> {
  factory _$$RestorePurchasesSuccessCopyWith(_$RestorePurchasesSuccess value,
          $Res Function(_$RestorePurchasesSuccess) then) =
      __$$RestorePurchasesSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RestorePurchasesSuccessCopyWithImpl<$Res>
    extends _$PurchaseStateCopyWithImpl<$Res>
    implements _$$RestorePurchasesSuccessCopyWith<$Res> {
  __$$RestorePurchasesSuccessCopyWithImpl(_$RestorePurchasesSuccess _value,
      $Res Function(_$RestorePurchasesSuccess) _then)
      : super(_value, (v) => _then(v as _$RestorePurchasesSuccess));

  @override
  _$RestorePurchasesSuccess get _value =>
      super._value as _$RestorePurchasesSuccess;
}

/// @nodoc

class _$RestorePurchasesSuccess extends RestorePurchasesSuccess {
  const _$RestorePurchasesSuccess() : super._();

  @override
  String toString() {
    return 'PurchaseState.restorePurchasesSuccess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestorePurchasesSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() inProgress,
    required TResult Function() purchaseSuccess,
    required TResult Function(ApphudError error) purchaseFailure,
    required TResult Function() restorePurchasesSuccess,
    required TResult Function(ApphudError error) restorePurchaseFailure,
  }) {
    return restorePurchasesSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? inProgress,
    TResult Function()? purchaseSuccess,
    TResult Function(ApphudError error)? purchaseFailure,
    TResult Function()? restorePurchasesSuccess,
    TResult Function(ApphudError error)? restorePurchaseFailure,
  }) {
    return restorePurchasesSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? inProgress,
    TResult Function()? purchaseSuccess,
    TResult Function(ApphudError error)? purchaseFailure,
    TResult Function()? restorePurchasesSuccess,
    TResult Function(ApphudError error)? restorePurchaseFailure,
    required TResult orElse(),
  }) {
    if (restorePurchasesSuccess != null) {
      return restorePurchasesSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(InProgress value) inProgress,
    required TResult Function(PurchaseSuccess value) purchaseSuccess,
    required TResult Function(PurchaseFailure value) purchaseFailure,
    required TResult Function(RestorePurchasesSuccess value)
        restorePurchasesSuccess,
    required TResult Function(RestorePurchasesFailure value)
        restorePurchaseFailure,
  }) {
    return restorePurchasesSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(InProgress value)? inProgress,
    TResult Function(PurchaseSuccess value)? purchaseSuccess,
    TResult Function(PurchaseFailure value)? purchaseFailure,
    TResult Function(RestorePurchasesSuccess value)? restorePurchasesSuccess,
    TResult Function(RestorePurchasesFailure value)? restorePurchaseFailure,
  }) {
    return restorePurchasesSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(InProgress value)? inProgress,
    TResult Function(PurchaseSuccess value)? purchaseSuccess,
    TResult Function(PurchaseFailure value)? purchaseFailure,
    TResult Function(RestorePurchasesSuccess value)? restorePurchasesSuccess,
    TResult Function(RestorePurchasesFailure value)? restorePurchaseFailure,
    required TResult orElse(),
  }) {
    if (restorePurchasesSuccess != null) {
      return restorePurchasesSuccess(this);
    }
    return orElse();
  }
}

abstract class RestorePurchasesSuccess extends PurchaseState {
  const factory RestorePurchasesSuccess() = _$RestorePurchasesSuccess;
  const RestorePurchasesSuccess._() : super._();
}

/// @nodoc
abstract class _$$RestorePurchasesFailureCopyWith<$Res> {
  factory _$$RestorePurchasesFailureCopyWith(_$RestorePurchasesFailure value,
          $Res Function(_$RestorePurchasesFailure) then) =
      __$$RestorePurchasesFailureCopyWithImpl<$Res>;
  $Res call({ApphudError error});
}

/// @nodoc
class __$$RestorePurchasesFailureCopyWithImpl<$Res>
    extends _$PurchaseStateCopyWithImpl<$Res>
    implements _$$RestorePurchasesFailureCopyWith<$Res> {
  __$$RestorePurchasesFailureCopyWithImpl(_$RestorePurchasesFailure _value,
      $Res Function(_$RestorePurchasesFailure) _then)
      : super(_value, (v) => _then(v as _$RestorePurchasesFailure));

  @override
  _$RestorePurchasesFailure get _value =>
      super._value as _$RestorePurchasesFailure;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$RestorePurchasesFailure(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ApphudError,
    ));
  }
}

/// @nodoc

class _$RestorePurchasesFailure extends RestorePurchasesFailure {
  const _$RestorePurchasesFailure(this.error) : super._();

  @override
  final ApphudError error;

  @override
  String toString() {
    return 'PurchaseState.restorePurchaseFailure(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestorePurchasesFailure &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$RestorePurchasesFailureCopyWith<_$RestorePurchasesFailure> get copyWith =>
      __$$RestorePurchasesFailureCopyWithImpl<_$RestorePurchasesFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() inProgress,
    required TResult Function() purchaseSuccess,
    required TResult Function(ApphudError error) purchaseFailure,
    required TResult Function() restorePurchasesSuccess,
    required TResult Function(ApphudError error) restorePurchaseFailure,
  }) {
    return restorePurchaseFailure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? inProgress,
    TResult Function()? purchaseSuccess,
    TResult Function(ApphudError error)? purchaseFailure,
    TResult Function()? restorePurchasesSuccess,
    TResult Function(ApphudError error)? restorePurchaseFailure,
  }) {
    return restorePurchaseFailure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? inProgress,
    TResult Function()? purchaseSuccess,
    TResult Function(ApphudError error)? purchaseFailure,
    TResult Function()? restorePurchasesSuccess,
    TResult Function(ApphudError error)? restorePurchaseFailure,
    required TResult orElse(),
  }) {
    if (restorePurchaseFailure != null) {
      return restorePurchaseFailure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(InProgress value) inProgress,
    required TResult Function(PurchaseSuccess value) purchaseSuccess,
    required TResult Function(PurchaseFailure value) purchaseFailure,
    required TResult Function(RestorePurchasesSuccess value)
        restorePurchasesSuccess,
    required TResult Function(RestorePurchasesFailure value)
        restorePurchaseFailure,
  }) {
    return restorePurchaseFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(InProgress value)? inProgress,
    TResult Function(PurchaseSuccess value)? purchaseSuccess,
    TResult Function(PurchaseFailure value)? purchaseFailure,
    TResult Function(RestorePurchasesSuccess value)? restorePurchasesSuccess,
    TResult Function(RestorePurchasesFailure value)? restorePurchaseFailure,
  }) {
    return restorePurchaseFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(InProgress value)? inProgress,
    TResult Function(PurchaseSuccess value)? purchaseSuccess,
    TResult Function(PurchaseFailure value)? purchaseFailure,
    TResult Function(RestorePurchasesSuccess value)? restorePurchasesSuccess,
    TResult Function(RestorePurchasesFailure value)? restorePurchaseFailure,
    required TResult orElse(),
  }) {
    if (restorePurchaseFailure != null) {
      return restorePurchaseFailure(this);
    }
    return orElse();
  }
}

abstract class RestorePurchasesFailure extends PurchaseState {
  const factory RestorePurchasesFailure(final ApphudError error) =
      _$RestorePurchasesFailure;
  const RestorePurchasesFailure._() : super._();

  ApphudError get error;
  @JsonKey(ignore: true)
  _$$RestorePurchasesFailureCopyWith<_$RestorePurchasesFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
