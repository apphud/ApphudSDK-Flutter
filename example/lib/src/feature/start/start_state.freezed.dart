// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'start_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$StartStateTearOff {
  const _$StartStateTearOff();

  Trying trying(
      {bool isStartSuccess = false,
      bool isProductFetched = false,
      List<ApphudProduct> products = const []}) {
    return Trying(
      isStartSuccess: isStartSuccess,
      isProductFetched: isProductFetched,
      products: products,
    );
  }

  Success success({List<ApphudProduct> products = const []}) {
    return Success(
      products: products,
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
}

/// @nodoc
const $StartState = _$StartStateTearOff();

/// @nodoc
mixin _$StartState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isStartSuccess, bool isProductFetched,
            List<ApphudProduct> products)
        trying,
    required TResult Function(List<ApphudProduct> products) success,
    required TResult Function(String error) startFail,
    required TResult Function(String error) productsFetchFail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isStartSuccess, bool isProductFetched,
            List<ApphudProduct> products)?
        trying,
    TResult Function(List<ApphudProduct> products)? success,
    TResult Function(String error)? startFail,
    TResult Function(String error)? productsFetchFail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Trying value) trying,
    required TResult Function(Success value) success,
    required TResult Function(StartFail value) startFail,
    required TResult Function(ProductsFetchFail value) productsFetchFail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Trying value)? trying,
    TResult Function(Success value)? success,
    TResult Function(StartFail value)? startFail,
    TResult Function(ProductsFetchFail value)? productsFetchFail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartStateCopyWith<$Res> {
  factory $StartStateCopyWith(
          StartState value, $Res Function(StartState) then) =
      _$StartStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$StartStateCopyWithImpl<$Res> implements $StartStateCopyWith<$Res> {
  _$StartStateCopyWithImpl(this._value, this._then);

  final StartState _value;
  // ignore: unused_field
  final $Res Function(StartState) _then;
}

/// @nodoc
abstract class $TryingCopyWith<$Res> {
  factory $TryingCopyWith(Trying value, $Res Function(Trying) then) =
      _$TryingCopyWithImpl<$Res>;
  $Res call(
      {bool isStartSuccess,
      bool isProductFetched,
      List<ApphudProduct> products});
}

/// @nodoc
class _$TryingCopyWithImpl<$Res> extends _$StartStateCopyWithImpl<$Res>
    implements $TryingCopyWith<$Res> {
  _$TryingCopyWithImpl(Trying _value, $Res Function(Trying) _then)
      : super(_value, (v) => _then(v as Trying));

  @override
  Trying get _value => super._value as Trying;

  @override
  $Res call({
    Object? isStartSuccess = freezed,
    Object? isProductFetched = freezed,
    Object? products = freezed,
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
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ApphudProduct>,
    ));
  }
}

/// @nodoc

class _$Trying extends Trying {
  const _$Trying(
      {this.isStartSuccess = false,
      this.isProductFetched = false,
      this.products = const []})
      : super._();

  @JsonKey(defaultValue: false)
  @override
  final bool isStartSuccess;
  @JsonKey(defaultValue: false)
  @override
  final bool isProductFetched;
  @JsonKey(defaultValue: const [])
  @override
  final List<ApphudProduct> products;

  @override
  String toString() {
    return 'StartState.trying(isStartSuccess: $isStartSuccess, isProductFetched: $isProductFetched, products: $products)';
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
            (identical(other.products, products) ||
                const DeepCollectionEquality()
                    .equals(other.products, products)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isStartSuccess) ^
      const DeepCollectionEquality().hash(isProductFetched) ^
      const DeepCollectionEquality().hash(products);

  @JsonKey(ignore: true)
  @override
  $TryingCopyWith<Trying> get copyWith =>
      _$TryingCopyWithImpl<Trying>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isStartSuccess, bool isProductFetched,
            List<ApphudProduct> products)
        trying,
    required TResult Function(List<ApphudProduct> products) success,
    required TResult Function(String error) startFail,
    required TResult Function(String error) productsFetchFail,
  }) {
    return trying(isStartSuccess, isProductFetched, products);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isStartSuccess, bool isProductFetched,
            List<ApphudProduct> products)?
        trying,
    TResult Function(List<ApphudProduct> products)? success,
    TResult Function(String error)? startFail,
    TResult Function(String error)? productsFetchFail,
    required TResult orElse(),
  }) {
    if (trying != null) {
      return trying(isStartSuccess, isProductFetched, products);
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
    required TResult orElse(),
  }) {
    if (trying != null) {
      return trying(this);
    }
    return orElse();
  }
}

abstract class Trying extends StartState {
  const factory Trying(
      {bool isStartSuccess,
      bool isProductFetched,
      List<ApphudProduct> products}) = _$Trying;
  const Trying._() : super._();

  bool get isStartSuccess => throw _privateConstructorUsedError;
  bool get isProductFetched => throw _privateConstructorUsedError;
  List<ApphudProduct> get products => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TryingCopyWith<Trying> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuccessCopyWith<$Res> {
  factory $SuccessCopyWith(Success value, $Res Function(Success) then) =
      _$SuccessCopyWithImpl<$Res>;
  $Res call({List<ApphudProduct> products});
}

/// @nodoc
class _$SuccessCopyWithImpl<$Res> extends _$StartStateCopyWithImpl<$Res>
    implements $SuccessCopyWith<$Res> {
  _$SuccessCopyWithImpl(Success _value, $Res Function(Success) _then)
      : super(_value, (v) => _then(v as Success));

  @override
  Success get _value => super._value as Success;

  @override
  $Res call({
    Object? products = freezed,
  }) {
    return _then(Success(
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ApphudProduct>,
    ));
  }
}

/// @nodoc

class _$Success extends Success {
  const _$Success({this.products = const []}) : super._();

  @JsonKey(defaultValue: const [])
  @override
  final List<ApphudProduct> products;

  @override
  String toString() {
    return 'StartState.success(products: $products)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Success &&
            (identical(other.products, products) ||
                const DeepCollectionEquality()
                    .equals(other.products, products)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(products);

  @JsonKey(ignore: true)
  @override
  $SuccessCopyWith<Success> get copyWith =>
      _$SuccessCopyWithImpl<Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isStartSuccess, bool isProductFetched,
            List<ApphudProduct> products)
        trying,
    required TResult Function(List<ApphudProduct> products) success,
    required TResult Function(String error) startFail,
    required TResult Function(String error) productsFetchFail,
  }) {
    return success(products);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isStartSuccess, bool isProductFetched,
            List<ApphudProduct> products)?
        trying,
    TResult Function(List<ApphudProduct> products)? success,
    TResult Function(String error)? startFail,
    TResult Function(String error)? productsFetchFail,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(products);
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
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success extends StartState {
  const factory Success({List<ApphudProduct> products}) = _$Success;
  const Success._() : super._();

  List<ApphudProduct> get products => throw _privateConstructorUsedError;
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
class _$StartFailCopyWithImpl<$Res> extends _$StartStateCopyWithImpl<$Res>
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
    return 'StartState.startFail(error: $error)';
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
    required TResult Function(bool isStartSuccess, bool isProductFetched,
            List<ApphudProduct> products)
        trying,
    required TResult Function(List<ApphudProduct> products) success,
    required TResult Function(String error) startFail,
    required TResult Function(String error) productsFetchFail,
  }) {
    return startFail(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isStartSuccess, bool isProductFetched,
            List<ApphudProduct> products)?
        trying,
    TResult Function(List<ApphudProduct> products)? success,
    TResult Function(String error)? startFail,
    TResult Function(String error)? productsFetchFail,
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
    required TResult orElse(),
  }) {
    if (startFail != null) {
      return startFail(this);
    }
    return orElse();
  }
}

abstract class StartFail extends StartState {
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
    extends _$StartStateCopyWithImpl<$Res>
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
    return 'StartState.productsFetchFail(error: $error)';
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
    required TResult Function(bool isStartSuccess, bool isProductFetched,
            List<ApphudProduct> products)
        trying,
    required TResult Function(List<ApphudProduct> products) success,
    required TResult Function(String error) startFail,
    required TResult Function(String error) productsFetchFail,
  }) {
    return productsFetchFail(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isStartSuccess, bool isProductFetched,
            List<ApphudProduct> products)?
        trying,
    TResult Function(List<ApphudProduct> products)? success,
    TResult Function(String error)? startFail,
    TResult Function(String error)? productsFetchFail,
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
    required TResult orElse(),
  }) {
    if (productsFetchFail != null) {
      return productsFetchFail(this);
    }
    return orElse();
  }
}

abstract class ProductsFetchFail extends StartState {
  const factory ProductsFetchFail(String error) = _$ProductsFetchFail;
  const ProductsFetchFail._() : super._();

  String get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductsFetchFailCopyWith<ProductsFetchFail> get copyWith =>
      throw _privateConstructorUsedError;
}
