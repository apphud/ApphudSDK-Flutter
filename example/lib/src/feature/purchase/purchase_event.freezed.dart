// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'purchase_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PurchaseEventTearOff {
  const _$PurchaseEventTearOff();

  Purchase purchase(String id) {
    return Purchase(
      id,
    );
  }

  RestorePurchases restorePurchases() {
    return const RestorePurchases();
  }

  PurchaseProduct purchaseProduct(ApphudPaywallProduct product) {
    return PurchaseProduct(
      product,
    );
  }
}

/// @nodoc
const $PurchaseEvent = _$PurchaseEventTearOff();

/// @nodoc
mixin _$PurchaseEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) purchase,
    required TResult Function() restorePurchases,
    required TResult Function(ApphudPaywallProduct product) purchaseProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? purchase,
    TResult Function()? restorePurchases,
    TResult Function(ApphudPaywallProduct product)? purchaseProduct,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Purchase value) purchase,
    required TResult Function(RestorePurchases value) restorePurchases,
    required TResult Function(PurchaseProduct value) purchaseProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Purchase value)? purchase,
    TResult Function(RestorePurchases value)? restorePurchases,
    TResult Function(PurchaseProduct value)? purchaseProduct,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseEventCopyWith<$Res> {
  factory $PurchaseEventCopyWith(
          PurchaseEvent value, $Res Function(PurchaseEvent) then) =
      _$PurchaseEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$PurchaseEventCopyWithImpl<$Res>
    implements $PurchaseEventCopyWith<$Res> {
  _$PurchaseEventCopyWithImpl(this._value, this._then);

  final PurchaseEvent _value;
  // ignore: unused_field
  final $Res Function(PurchaseEvent) _then;
}

/// @nodoc
abstract class $PurchaseCopyWith<$Res> {
  factory $PurchaseCopyWith(Purchase value, $Res Function(Purchase) then) =
      _$PurchaseCopyWithImpl<$Res>;
  $Res call({String id});
}

/// @nodoc
class _$PurchaseCopyWithImpl<$Res> extends _$PurchaseEventCopyWithImpl<$Res>
    implements $PurchaseCopyWith<$Res> {
  _$PurchaseCopyWithImpl(Purchase _value, $Res Function(Purchase) _then)
      : super(_value, (v) => _then(v as Purchase));

  @override
  Purchase get _value => super._value as Purchase;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(Purchase(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Purchase extends Purchase {
  const _$Purchase(this.id) : super._();

  @override
  final String id;

  @override
  String toString() {
    return 'PurchaseEvent.purchase(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Purchase &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(id);

  @JsonKey(ignore: true)
  @override
  $PurchaseCopyWith<Purchase> get copyWith =>
      _$PurchaseCopyWithImpl<Purchase>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) purchase,
    required TResult Function() restorePurchases,
    required TResult Function(ApphudPaywallProduct product) purchaseProduct,
  }) {
    return purchase(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? purchase,
    TResult Function()? restorePurchases,
    TResult Function(ApphudPaywallProduct product)? purchaseProduct,
    required TResult orElse(),
  }) {
    if (purchase != null) {
      return purchase(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Purchase value) purchase,
    required TResult Function(RestorePurchases value) restorePurchases,
    required TResult Function(PurchaseProduct value) purchaseProduct,
  }) {
    return purchase(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Purchase value)? purchase,
    TResult Function(RestorePurchases value)? restorePurchases,
    TResult Function(PurchaseProduct value)? purchaseProduct,
    required TResult orElse(),
  }) {
    if (purchase != null) {
      return purchase(this);
    }
    return orElse();
  }
}

abstract class Purchase extends PurchaseEvent {
  const factory Purchase(String id) = _$Purchase;
  const Purchase._() : super._();

  String get id => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PurchaseCopyWith<Purchase> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestorePurchasesCopyWith<$Res> {
  factory $RestorePurchasesCopyWith(
          RestorePurchases value, $Res Function(RestorePurchases) then) =
      _$RestorePurchasesCopyWithImpl<$Res>;
}

/// @nodoc
class _$RestorePurchasesCopyWithImpl<$Res>
    extends _$PurchaseEventCopyWithImpl<$Res>
    implements $RestorePurchasesCopyWith<$Res> {
  _$RestorePurchasesCopyWithImpl(
      RestorePurchases _value, $Res Function(RestorePurchases) _then)
      : super(_value, (v) => _then(v as RestorePurchases));

  @override
  RestorePurchases get _value => super._value as RestorePurchases;
}

/// @nodoc

class _$RestorePurchases extends RestorePurchases {
  const _$RestorePurchases() : super._();

  @override
  String toString() {
    return 'PurchaseEvent.restorePurchases()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is RestorePurchases);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) purchase,
    required TResult Function() restorePurchases,
    required TResult Function(ApphudPaywallProduct product) purchaseProduct,
  }) {
    return restorePurchases();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? purchase,
    TResult Function()? restorePurchases,
    TResult Function(ApphudPaywallProduct product)? purchaseProduct,
    required TResult orElse(),
  }) {
    if (restorePurchases != null) {
      return restorePurchases();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Purchase value) purchase,
    required TResult Function(RestorePurchases value) restorePurchases,
    required TResult Function(PurchaseProduct value) purchaseProduct,
  }) {
    return restorePurchases(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Purchase value)? purchase,
    TResult Function(RestorePurchases value)? restorePurchases,
    TResult Function(PurchaseProduct value)? purchaseProduct,
    required TResult orElse(),
  }) {
    if (restorePurchases != null) {
      return restorePurchases(this);
    }
    return orElse();
  }
}

abstract class RestorePurchases extends PurchaseEvent {
  const factory RestorePurchases() = _$RestorePurchases;
  const RestorePurchases._() : super._();
}

/// @nodoc
abstract class $PurchaseProductCopyWith<$Res> {
  factory $PurchaseProductCopyWith(
          PurchaseProduct value, $Res Function(PurchaseProduct) then) =
      _$PurchaseProductCopyWithImpl<$Res>;
  $Res call({ApphudPaywallProduct product});
}

/// @nodoc
class _$PurchaseProductCopyWithImpl<$Res>
    extends _$PurchaseEventCopyWithImpl<$Res>
    implements $PurchaseProductCopyWith<$Res> {
  _$PurchaseProductCopyWithImpl(
      PurchaseProduct _value, $Res Function(PurchaseProduct) _then)
      : super(_value, (v) => _then(v as PurchaseProduct));

  @override
  PurchaseProduct get _value => super._value as PurchaseProduct;

  @override
  $Res call({
    Object? product = freezed,
  }) {
    return _then(PurchaseProduct(
      product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ApphudPaywallProduct,
    ));
  }
}

/// @nodoc

class _$PurchaseProduct extends PurchaseProduct {
  const _$PurchaseProduct(this.product) : super._();

  @override
  final ApphudPaywallProduct product;

  @override
  String toString() {
    return 'PurchaseEvent.purchaseProduct(product: $product)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PurchaseProduct &&
            (identical(other.product, product) ||
                const DeepCollectionEquality().equals(other.product, product)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(product);

  @JsonKey(ignore: true)
  @override
  $PurchaseProductCopyWith<PurchaseProduct> get copyWith =>
      _$PurchaseProductCopyWithImpl<PurchaseProduct>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) purchase,
    required TResult Function() restorePurchases,
    required TResult Function(ApphudPaywallProduct product) purchaseProduct,
  }) {
    return purchaseProduct(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? purchase,
    TResult Function()? restorePurchases,
    TResult Function(ApphudPaywallProduct product)? purchaseProduct,
    required TResult orElse(),
  }) {
    if (purchaseProduct != null) {
      return purchaseProduct(product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Purchase value) purchase,
    required TResult Function(RestorePurchases value) restorePurchases,
    required TResult Function(PurchaseProduct value) purchaseProduct,
  }) {
    return purchaseProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Purchase value)? purchase,
    TResult Function(RestorePurchases value)? restorePurchases,
    TResult Function(PurchaseProduct value)? purchaseProduct,
    required TResult orElse(),
  }) {
    if (purchaseProduct != null) {
      return purchaseProduct(this);
    }
    return orElse();
  }
}

abstract class PurchaseProduct extends PurchaseEvent {
  const factory PurchaseProduct(ApphudPaywallProduct product) =
      _$PurchaseProduct;
  const PurchaseProduct._() : super._();

  ApphudPaywallProduct get product => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PurchaseProductCopyWith<PurchaseProduct> get copyWith =>
      throw _privateConstructorUsedError;
}
