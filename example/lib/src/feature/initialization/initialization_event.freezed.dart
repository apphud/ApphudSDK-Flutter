// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

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

  ProductsFetchSuccess productsFetchSuccess(List<ApphudProduct> products) {
    return ProductsFetchSuccess(
      products,
    );
  }

  ProductsFetchFailure productsFetchFailure(String error) {
    return ProductsFetchFailure(
      error,
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
    required TResult Function(List<ApphudProduct> products)
        productsFetchSuccess,
    required TResult Function(String error) productsFetchFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeTrying,
    TResult Function(List<ApphudProduct> products)? productsFetchSuccess,
    TResult Function(String error)? productsFetchFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeTrying value) initializeTrying,
    required TResult Function(ProductsFetchSuccess value) productsFetchSuccess,
    required TResult Function(ProductsFetchFailure value) productsFetchFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeTrying value)? initializeTrying,
    TResult Function(ProductsFetchSuccess value)? productsFetchSuccess,
    TResult Function(ProductsFetchFailure value)? productsFetchFailure,
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
    required TResult Function(List<ApphudProduct> products)
        productsFetchSuccess,
    required TResult Function(String error) productsFetchFailure,
  }) {
    return initializeTrying();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeTrying,
    TResult Function(List<ApphudProduct> products)? productsFetchSuccess,
    TResult Function(String error)? productsFetchFailure,
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
    required TResult Function(ProductsFetchSuccess value) productsFetchSuccess,
    required TResult Function(ProductsFetchFailure value) productsFetchFailure,
  }) {
    return initializeTrying(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeTrying value)? initializeTrying,
    TResult Function(ProductsFetchSuccess value)? productsFetchSuccess,
    TResult Function(ProductsFetchFailure value)? productsFetchFailure,
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
abstract class $ProductsFetchSuccessCopyWith<$Res> {
  factory $ProductsFetchSuccessCopyWith(ProductsFetchSuccess value,
          $Res Function(ProductsFetchSuccess) then) =
      _$ProductsFetchSuccessCopyWithImpl<$Res>;
  $Res call({List<ApphudProduct> products});
}

/// @nodoc
class _$ProductsFetchSuccessCopyWithImpl<$Res>
    extends _$InitializationEventCopyWithImpl<$Res>
    implements $ProductsFetchSuccessCopyWith<$Res> {
  _$ProductsFetchSuccessCopyWithImpl(
      ProductsFetchSuccess _value, $Res Function(ProductsFetchSuccess) _then)
      : super(_value, (v) => _then(v as ProductsFetchSuccess));

  @override
  ProductsFetchSuccess get _value => super._value as ProductsFetchSuccess;

  @override
  $Res call({
    Object? products = freezed,
  }) {
    return _then(ProductsFetchSuccess(
      products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ApphudProduct>,
    ));
  }
}

/// @nodoc

class _$ProductsFetchSuccess extends ProductsFetchSuccess {
  const _$ProductsFetchSuccess(this.products) : super._();

  @override
  final List<ApphudProduct> products;

  @override
  String toString() {
    return 'InitializationEvent.productsFetchSuccess(products: $products)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ProductsFetchSuccess &&
            (identical(other.products, products) ||
                const DeepCollectionEquality()
                    .equals(other.products, products)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(products);

  @JsonKey(ignore: true)
  @override
  $ProductsFetchSuccessCopyWith<ProductsFetchSuccess> get copyWith =>
      _$ProductsFetchSuccessCopyWithImpl<ProductsFetchSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeTrying,
    required TResult Function(List<ApphudProduct> products)
        productsFetchSuccess,
    required TResult Function(String error) productsFetchFailure,
  }) {
    return productsFetchSuccess(products);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeTrying,
    TResult Function(List<ApphudProduct> products)? productsFetchSuccess,
    TResult Function(String error)? productsFetchFailure,
    required TResult orElse(),
  }) {
    if (productsFetchSuccess != null) {
      return productsFetchSuccess(products);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeTrying value) initializeTrying,
    required TResult Function(ProductsFetchSuccess value) productsFetchSuccess,
    required TResult Function(ProductsFetchFailure value) productsFetchFailure,
  }) {
    return productsFetchSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeTrying value)? initializeTrying,
    TResult Function(ProductsFetchSuccess value)? productsFetchSuccess,
    TResult Function(ProductsFetchFailure value)? productsFetchFailure,
    required TResult orElse(),
  }) {
    if (productsFetchSuccess != null) {
      return productsFetchSuccess(this);
    }
    return orElse();
  }
}

abstract class ProductsFetchSuccess extends InitializationEvent {
  const factory ProductsFetchSuccess(List<ApphudProduct> products) =
      _$ProductsFetchSuccess;
  const ProductsFetchSuccess._() : super._();

  List<ApphudProduct> get products => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductsFetchSuccessCopyWith<ProductsFetchSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsFetchFailureCopyWith<$Res> {
  factory $ProductsFetchFailureCopyWith(ProductsFetchFailure value,
          $Res Function(ProductsFetchFailure) then) =
      _$ProductsFetchFailureCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class _$ProductsFetchFailureCopyWithImpl<$Res>
    extends _$InitializationEventCopyWithImpl<$Res>
    implements $ProductsFetchFailureCopyWith<$Res> {
  _$ProductsFetchFailureCopyWithImpl(
      ProductsFetchFailure _value, $Res Function(ProductsFetchFailure) _then)
      : super(_value, (v) => _then(v as ProductsFetchFailure));

  @override
  ProductsFetchFailure get _value => super._value as ProductsFetchFailure;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(ProductsFetchFailure(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProductsFetchFailure extends ProductsFetchFailure {
  const _$ProductsFetchFailure(this.error) : super._();

  @override
  final String error;

  @override
  String toString() {
    return 'InitializationEvent.productsFetchFailure(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ProductsFetchFailure &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  $ProductsFetchFailureCopyWith<ProductsFetchFailure> get copyWith =>
      _$ProductsFetchFailureCopyWithImpl<ProductsFetchFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeTrying,
    required TResult Function(List<ApphudProduct> products)
        productsFetchSuccess,
    required TResult Function(String error) productsFetchFailure,
  }) {
    return productsFetchFailure(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeTrying,
    TResult Function(List<ApphudProduct> products)? productsFetchSuccess,
    TResult Function(String error)? productsFetchFailure,
    required TResult orElse(),
  }) {
    if (productsFetchFailure != null) {
      return productsFetchFailure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializeTrying value) initializeTrying,
    required TResult Function(ProductsFetchSuccess value) productsFetchSuccess,
    required TResult Function(ProductsFetchFailure value) productsFetchFailure,
  }) {
    return productsFetchFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializeTrying value)? initializeTrying,
    TResult Function(ProductsFetchSuccess value)? productsFetchSuccess,
    TResult Function(ProductsFetchFailure value)? productsFetchFailure,
    required TResult orElse(),
  }) {
    if (productsFetchFailure != null) {
      return productsFetchFailure(this);
    }
    return orElse();
  }
}

abstract class ProductsFetchFailure extends InitializationEvent {
  const factory ProductsFetchFailure(String error) = _$ProductsFetchFailure;
  const ProductsFetchFailure._() : super._();

  String get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductsFetchFailureCopyWith<ProductsFetchFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
