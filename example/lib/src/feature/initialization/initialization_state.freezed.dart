// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'initialization_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$InitializationStateTearOff {
  const _$InitializationStateTearOff();

  Trying trying(
      {bool isStartSuccess = false,
      bool isProductFetched = false,
      bool isPaywallsFetched = false,
      List<ApphudProductComposite> products = const [],
      ApphudPaywalls paywalls = const ApphudPaywalls()}) {
    return Trying(
      isStartSuccess: isStartSuccess,
      isProductFetched: isProductFetched,
      isPaywallsFetched: isPaywallsFetched,
      products: products,
      paywalls: paywalls,
    );
  }

  Success success(
      {List<ApphudProductComposite> products = const [],
      ApphudPaywalls paywalls = const ApphudPaywalls()}) {
    return Success(
      products: products,
      paywalls: paywalls,
    );
  }

  StartFail startFail(String error) {
    return StartFail(
      error,
    );
  }

  ProductsFetchFail productsFetchFail(String error) {
    return ProductsFetchFail(
      error,
    );
  }

  PaywallsFetchFail paywallsFetchFail(String error) {
    return PaywallsFetchFail(
      error,
    );
  }
}

/// @nodoc
const $InitializationState = _$InitializationStateTearOff();

/// @nodoc
mixin _$InitializationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isStartSuccess,
            bool isProductFetched,
            bool isPaywallsFetched,
            List<ApphudProductComposite> products,
            ApphudPaywalls paywalls)
        trying,
    required TResult Function(
            List<ApphudProductComposite> products, ApphudPaywalls paywalls)
        success,
    required TResult Function(String error) startFail,
    required TResult Function(String error) productsFetchFail,
    required TResult Function(String error) paywallsFetchFail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool isStartSuccess,
            bool isProductFetched,
            bool isPaywallsFetched,
            List<ApphudProductComposite> products,
            ApphudPaywalls paywalls)?
        trying,
    TResult Function(
            List<ApphudProductComposite> products, ApphudPaywalls paywalls)?
        success,
    TResult Function(String error)? startFail,
    TResult Function(String error)? productsFetchFail,
    TResult Function(String error)? paywallsFetchFail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Trying value) trying,
    required TResult Function(Success value) success,
    required TResult Function(StartFail value) startFail,
    required TResult Function(ProductsFetchFail value) productsFetchFail,
    required TResult Function(PaywallsFetchFail value) paywallsFetchFail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Trying value)? trying,
    TResult Function(Success value)? success,
    TResult Function(StartFail value)? startFail,
    TResult Function(ProductsFetchFail value)? productsFetchFail,
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
abstract class $TryingCopyWith<$Res> {
  factory $TryingCopyWith(Trying value, $Res Function(Trying) then) =
      _$TryingCopyWithImpl<$Res>;
  $Res call(
      {bool isStartSuccess,
      bool isProductFetched,
      bool isPaywallsFetched,
      List<ApphudProductComposite> products,
      ApphudPaywalls paywalls});
}

/// @nodoc
class _$TryingCopyWithImpl<$Res> extends _$InitializationStateCopyWithImpl<$Res>
    implements $TryingCopyWith<$Res> {
  _$TryingCopyWithImpl(Trying _value, $Res Function(Trying) _then)
      : super(_value, (v) => _then(v as Trying));

  @override
  Trying get _value => super._value as Trying;

  @override
  $Res call({
    Object? isStartSuccess = freezed,
    Object? isProductFetched = freezed,
    Object? isPaywallsFetched = freezed,
    Object? products = freezed,
    Object? paywalls = freezed,
  }) {
    return _then(Trying(
      isStartSuccess: isStartSuccess == freezed
          ? _value.isStartSuccess
          : isStartSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isProductFetched: isProductFetched == freezed
          ? _value.isProductFetched
          : isProductFetched // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaywallsFetched: isPaywallsFetched == freezed
          ? _value.isPaywallsFetched
          : isPaywallsFetched // ignore: cast_nullable_to_non_nullable
              as bool,
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ApphudProductComposite>,
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
      this.isProductFetched = false,
      this.isPaywallsFetched = false,
      this.products = const [],
      this.paywalls = const ApphudPaywalls()})
      : super._();

  @JsonKey(defaultValue: false)
  @override
  final bool isStartSuccess;
  @JsonKey(defaultValue: false)
  @override
  final bool isProductFetched;
  @JsonKey(defaultValue: false)
  @override
  final bool isPaywallsFetched;
  @JsonKey(defaultValue: const [])
  @override
  final List<ApphudProductComposite> products;
  @JsonKey(defaultValue: const ApphudPaywalls())
  @override
  final ApphudPaywalls paywalls;

  @override
  String toString() {
    return 'InitializationState.trying(isStartSuccess: $isStartSuccess, isProductFetched: $isProductFetched, isPaywallsFetched: $isPaywallsFetched, products: $products, paywalls: $paywalls)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Trying &&
            (identical(other.isStartSuccess, isStartSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.isStartSuccess, isStartSuccess)) &&
            (identical(other.isProductFetched, isProductFetched) ||
                const DeepCollectionEquality()
                    .equals(other.isProductFetched, isProductFetched)) &&
            (identical(other.isPaywallsFetched, isPaywallsFetched) ||
                const DeepCollectionEquality()
                    .equals(other.isPaywallsFetched, isPaywallsFetched)) &&
            (identical(other.products, products) ||
                const DeepCollectionEquality()
                    .equals(other.products, products)) &&
            (identical(other.paywalls, paywalls) ||
                const DeepCollectionEquality()
                    .equals(other.paywalls, paywalls)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isStartSuccess) ^
      const DeepCollectionEquality().hash(isProductFetched) ^
      const DeepCollectionEquality().hash(isPaywallsFetched) ^
      const DeepCollectionEquality().hash(products) ^
      const DeepCollectionEquality().hash(paywalls);

  @JsonKey(ignore: true)
  @override
  $TryingCopyWith<Trying> get copyWith =>
      _$TryingCopyWithImpl<Trying>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isStartSuccess,
            bool isProductFetched,
            bool isPaywallsFetched,
            List<ApphudProductComposite> products,
            ApphudPaywalls paywalls)
        trying,
    required TResult Function(
            List<ApphudProductComposite> products, ApphudPaywalls paywalls)
        success,
    required TResult Function(String error) startFail,
    required TResult Function(String error) productsFetchFail,
    required TResult Function(String error) paywallsFetchFail,
  }) {
    return trying(isStartSuccess, isProductFetched, isPaywallsFetched, products,
        paywalls);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool isStartSuccess,
            bool isProductFetched,
            bool isPaywallsFetched,
            List<ApphudProductComposite> products,
            ApphudPaywalls paywalls)?
        trying,
    TResult Function(
            List<ApphudProductComposite> products, ApphudPaywalls paywalls)?
        success,
    TResult Function(String error)? startFail,
    TResult Function(String error)? productsFetchFail,
    TResult Function(String error)? paywallsFetchFail,
    required TResult orElse(),
  }) {
    if (trying != null) {
      return trying(isStartSuccess, isProductFetched, isPaywallsFetched,
          products, paywalls);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Trying value) trying,
    required TResult Function(Success value) success,
    required TResult Function(StartFail value) startFail,
    required TResult Function(ProductsFetchFail value) productsFetchFail,
    required TResult Function(PaywallsFetchFail value) paywallsFetchFail,
  }) {
    return trying(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Trying value)? trying,
    TResult Function(Success value)? success,
    TResult Function(StartFail value)? startFail,
    TResult Function(ProductsFetchFail value)? productsFetchFail,
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
      {bool isStartSuccess,
      bool isProductFetched,
      bool isPaywallsFetched,
      List<ApphudProductComposite> products,
      ApphudPaywalls paywalls}) = _$Trying;
  const Trying._() : super._();

  bool get isStartSuccess => throw _privateConstructorUsedError;
  bool get isProductFetched => throw _privateConstructorUsedError;
  bool get isPaywallsFetched => throw _privateConstructorUsedError;
  List<ApphudProductComposite> get products =>
      throw _privateConstructorUsedError;
  ApphudPaywalls get paywalls => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TryingCopyWith<Trying> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuccessCopyWith<$Res> {
  factory $SuccessCopyWith(Success value, $Res Function(Success) then) =
      _$SuccessCopyWithImpl<$Res>;
  $Res call({List<ApphudProductComposite> products, ApphudPaywalls paywalls});
}

/// @nodoc
class _$SuccessCopyWithImpl<$Res>
    extends _$InitializationStateCopyWithImpl<$Res>
    implements $SuccessCopyWith<$Res> {
  _$SuccessCopyWithImpl(Success _value, $Res Function(Success) _then)
      : super(_value, (v) => _then(v as Success));

  @override
  Success get _value => super._value as Success;

  @override
  $Res call({
    Object? products = freezed,
    Object? paywalls = freezed,
  }) {
    return _then(Success(
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ApphudProductComposite>,
      paywalls: paywalls == freezed
          ? _value.paywalls
          : paywalls // ignore: cast_nullable_to_non_nullable
              as ApphudPaywalls,
    ));
  }
}

/// @nodoc

class _$Success extends Success {
  const _$Success(
      {this.products = const [], this.paywalls = const ApphudPaywalls()})
      : super._();

  @JsonKey(defaultValue: const [])
  @override
  final List<ApphudProductComposite> products;
  @JsonKey(defaultValue: const ApphudPaywalls())
  @override
  final ApphudPaywalls paywalls;

  @override
  String toString() {
    return 'InitializationState.success(products: $products, paywalls: $paywalls)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Success &&
            (identical(other.products, products) ||
                const DeepCollectionEquality()
                    .equals(other.products, products)) &&
            (identical(other.paywalls, paywalls) ||
                const DeepCollectionEquality()
                    .equals(other.paywalls, paywalls)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(products) ^
      const DeepCollectionEquality().hash(paywalls);

  @JsonKey(ignore: true)
  @override
  $SuccessCopyWith<Success> get copyWith =>
      _$SuccessCopyWithImpl<Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isStartSuccess,
            bool isProductFetched,
            bool isPaywallsFetched,
            List<ApphudProductComposite> products,
            ApphudPaywalls paywalls)
        trying,
    required TResult Function(
            List<ApphudProductComposite> products, ApphudPaywalls paywalls)
        success,
    required TResult Function(String error) startFail,
    required TResult Function(String error) productsFetchFail,
    required TResult Function(String error) paywallsFetchFail,
  }) {
    return success(products, paywalls);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool isStartSuccess,
            bool isProductFetched,
            bool isPaywallsFetched,
            List<ApphudProductComposite> products,
            ApphudPaywalls paywalls)?
        trying,
    TResult Function(
            List<ApphudProductComposite> products, ApphudPaywalls paywalls)?
        success,
    TResult Function(String error)? startFail,
    TResult Function(String error)? productsFetchFail,
    TResult Function(String error)? paywallsFetchFail,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(products, paywalls);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Trying value) trying,
    required TResult Function(Success value) success,
    required TResult Function(StartFail value) startFail,
    required TResult Function(ProductsFetchFail value) productsFetchFail,
    required TResult Function(PaywallsFetchFail value) paywallsFetchFail,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Trying value)? trying,
    TResult Function(Success value)? success,
    TResult Function(StartFail value)? startFail,
    TResult Function(ProductsFetchFail value)? productsFetchFail,
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
  const factory Success(
      {List<ApphudProductComposite> products,
      ApphudPaywalls paywalls}) = _$Success;
  const Success._() : super._();

  List<ApphudProductComposite> get products =>
      throw _privateConstructorUsedError;
  ApphudPaywalls get paywalls => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SuccessCopyWith<Success> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartFailCopyWith<$Res> {
  factory $StartFailCopyWith(StartFail value, $Res Function(StartFail) then) =
      _$StartFailCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class _$StartFailCopyWithImpl<$Res>
    extends _$InitializationStateCopyWithImpl<$Res>
    implements $StartFailCopyWith<$Res> {
  _$StartFailCopyWithImpl(StartFail _value, $Res Function(StartFail) _then)
      : super(_value, (v) => _then(v as StartFail));

  @override
  StartFail get _value => super._value as StartFail;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(StartFail(
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
        (other is StartFail &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  $StartFailCopyWith<StartFail> get copyWith =>
      _$StartFailCopyWithImpl<StartFail>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isStartSuccess,
            bool isProductFetched,
            bool isPaywallsFetched,
            List<ApphudProductComposite> products,
            ApphudPaywalls paywalls)
        trying,
    required TResult Function(
            List<ApphudProductComposite> products, ApphudPaywalls paywalls)
        success,
    required TResult Function(String error) startFail,
    required TResult Function(String error) productsFetchFail,
    required TResult Function(String error) paywallsFetchFail,
  }) {
    return startFail(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool isStartSuccess,
            bool isProductFetched,
            bool isPaywallsFetched,
            List<ApphudProductComposite> products,
            ApphudPaywalls paywalls)?
        trying,
    TResult Function(
            List<ApphudProductComposite> products, ApphudPaywalls paywalls)?
        success,
    TResult Function(String error)? startFail,
    TResult Function(String error)? productsFetchFail,
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
    required TResult Function(ProductsFetchFail value) productsFetchFail,
    required TResult Function(PaywallsFetchFail value) paywallsFetchFail,
  }) {
    return startFail(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Trying value)? trying,
    TResult Function(Success value)? success,
    TResult Function(StartFail value)? startFail,
    TResult Function(ProductsFetchFail value)? productsFetchFail,
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
  const factory StartFail(String error) = _$StartFail;
  const StartFail._() : super._();

  String get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StartFailCopyWith<StartFail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsFetchFailCopyWith<$Res> {
  factory $ProductsFetchFailCopyWith(
          ProductsFetchFail value, $Res Function(ProductsFetchFail) then) =
      _$ProductsFetchFailCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class _$ProductsFetchFailCopyWithImpl<$Res>
    extends _$InitializationStateCopyWithImpl<$Res>
    implements $ProductsFetchFailCopyWith<$Res> {
  _$ProductsFetchFailCopyWithImpl(
      ProductsFetchFail _value, $Res Function(ProductsFetchFail) _then)
      : super(_value, (v) => _then(v as ProductsFetchFail));

  @override
  ProductsFetchFail get _value => super._value as ProductsFetchFail;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(ProductsFetchFail(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProductsFetchFail extends ProductsFetchFail {
  const _$ProductsFetchFail(this.error) : super._();

  @override
  final String error;

  @override
  String toString() {
    return 'InitializationState.productsFetchFail(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ProductsFetchFail &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  $ProductsFetchFailCopyWith<ProductsFetchFail> get copyWith =>
      _$ProductsFetchFailCopyWithImpl<ProductsFetchFail>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isStartSuccess,
            bool isProductFetched,
            bool isPaywallsFetched,
            List<ApphudProductComposite> products,
            ApphudPaywalls paywalls)
        trying,
    required TResult Function(
            List<ApphudProductComposite> products, ApphudPaywalls paywalls)
        success,
    required TResult Function(String error) startFail,
    required TResult Function(String error) productsFetchFail,
    required TResult Function(String error) paywallsFetchFail,
  }) {
    return productsFetchFail(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool isStartSuccess,
            bool isProductFetched,
            bool isPaywallsFetched,
            List<ApphudProductComposite> products,
            ApphudPaywalls paywalls)?
        trying,
    TResult Function(
            List<ApphudProductComposite> products, ApphudPaywalls paywalls)?
        success,
    TResult Function(String error)? startFail,
    TResult Function(String error)? productsFetchFail,
    TResult Function(String error)? paywallsFetchFail,
    required TResult orElse(),
  }) {
    if (productsFetchFail != null) {
      return productsFetchFail(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Trying value) trying,
    required TResult Function(Success value) success,
    required TResult Function(StartFail value) startFail,
    required TResult Function(ProductsFetchFail value) productsFetchFail,
    required TResult Function(PaywallsFetchFail value) paywallsFetchFail,
  }) {
    return productsFetchFail(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Trying value)? trying,
    TResult Function(Success value)? success,
    TResult Function(StartFail value)? startFail,
    TResult Function(ProductsFetchFail value)? productsFetchFail,
    TResult Function(PaywallsFetchFail value)? paywallsFetchFail,
    required TResult orElse(),
  }) {
    if (productsFetchFail != null) {
      return productsFetchFail(this);
    }
    return orElse();
  }
}

abstract class ProductsFetchFail extends InitializationState {
  const factory ProductsFetchFail(String error) = _$ProductsFetchFail;
  const ProductsFetchFail._() : super._();

  String get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductsFetchFailCopyWith<ProductsFetchFail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaywallsFetchFailCopyWith<$Res> {
  factory $PaywallsFetchFailCopyWith(
          PaywallsFetchFail value, $Res Function(PaywallsFetchFail) then) =
      _$PaywallsFetchFailCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class _$PaywallsFetchFailCopyWithImpl<$Res>
    extends _$InitializationStateCopyWithImpl<$Res>
    implements $PaywallsFetchFailCopyWith<$Res> {
  _$PaywallsFetchFailCopyWithImpl(
      PaywallsFetchFail _value, $Res Function(PaywallsFetchFail) _then)
      : super(_value, (v) => _then(v as PaywallsFetchFail));

  @override
  PaywallsFetchFail get _value => super._value as PaywallsFetchFail;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(PaywallsFetchFail(
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
        (other is PaywallsFetchFail &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  $PaywallsFetchFailCopyWith<PaywallsFetchFail> get copyWith =>
      _$PaywallsFetchFailCopyWithImpl<PaywallsFetchFail>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isStartSuccess,
            bool isProductFetched,
            bool isPaywallsFetched,
            List<ApphudProductComposite> products,
            ApphudPaywalls paywalls)
        trying,
    required TResult Function(
            List<ApphudProductComposite> products, ApphudPaywalls paywalls)
        success,
    required TResult Function(String error) startFail,
    required TResult Function(String error) productsFetchFail,
    required TResult Function(String error) paywallsFetchFail,
  }) {
    return paywallsFetchFail(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            bool isStartSuccess,
            bool isProductFetched,
            bool isPaywallsFetched,
            List<ApphudProductComposite> products,
            ApphudPaywalls paywalls)?
        trying,
    TResult Function(
            List<ApphudProductComposite> products, ApphudPaywalls paywalls)?
        success,
    TResult Function(String error)? startFail,
    TResult Function(String error)? productsFetchFail,
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
    required TResult Function(ProductsFetchFail value) productsFetchFail,
    required TResult Function(PaywallsFetchFail value) paywallsFetchFail,
  }) {
    return paywallsFetchFail(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Trying value)? trying,
    TResult Function(Success value)? success,
    TResult Function(StartFail value)? startFail,
    TResult Function(ProductsFetchFail value)? productsFetchFail,
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
  const factory PaywallsFetchFail(String error) = _$PaywallsFetchFail;
  const PaywallsFetchFail._() : super._();

  String get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaywallsFetchFailCopyWith<PaywallsFetchFail> get copyWith =>
      throw _privateConstructorUsedError;
}
