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

  PaywallShown paywallShown(ApphudPaywall paywall) {
    return PaywallShown(
      paywall,
    );
  }

  PaywallClosed paywallClosed(ApphudPaywall paywall) {
    return PaywallClosed(
      paywall,
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
    required TResult Function(ApphudPaywall paywall) paywallShown,
    required TResult Function(ApphudPaywall paywall) paywallClosed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? purchase,
    TResult Function()? restorePurchases,
    TResult Function(ApphudPaywallProduct product)? purchaseProduct,
    TResult Function(ApphudPaywall paywall)? paywallShown,
    TResult Function(ApphudPaywall paywall)? paywallClosed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Purchase value) purchase,
    required TResult Function(RestorePurchases value) restorePurchases,
    required TResult Function(PurchaseProduct value) purchaseProduct,
    required TResult Function(PaywallShown value) paywallShown,
    required TResult Function(PaywallClosed value) paywallClosed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Purchase value)? purchase,
    TResult Function(RestorePurchases value)? restorePurchases,
    TResult Function(PurchaseProduct value)? purchaseProduct,
    TResult Function(PaywallShown value)? paywallShown,
    TResult Function(PaywallClosed value)? paywallClosed,
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
    required TResult Function(ApphudPaywall paywall) paywallShown,
    required TResult Function(ApphudPaywall paywall) paywallClosed,
  }) {
    return purchase(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? purchase,
    TResult Function()? restorePurchases,
    TResult Function(ApphudPaywallProduct product)? purchaseProduct,
    TResult Function(ApphudPaywall paywall)? paywallShown,
    TResult Function(ApphudPaywall paywall)? paywallClosed,
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
    required TResult Function(PaywallShown value) paywallShown,
    required TResult Function(PaywallClosed value) paywallClosed,
  }) {
    return purchase(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Purchase value)? purchase,
    TResult Function(RestorePurchases value)? restorePurchases,
    TResult Function(PurchaseProduct value)? purchaseProduct,
    TResult Function(PaywallShown value)? paywallShown,
    TResult Function(PaywallClosed value)? paywallClosed,
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
    required TResult Function(ApphudPaywall paywall) paywallShown,
    required TResult Function(ApphudPaywall paywall) paywallClosed,
  }) {
    return restorePurchases();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? purchase,
    TResult Function()? restorePurchases,
    TResult Function(ApphudPaywallProduct product)? purchaseProduct,
    TResult Function(ApphudPaywall paywall)? paywallShown,
    TResult Function(ApphudPaywall paywall)? paywallClosed,
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
    required TResult Function(PaywallShown value) paywallShown,
    required TResult Function(PaywallClosed value) paywallClosed,
  }) {
    return restorePurchases(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Purchase value)? purchase,
    TResult Function(RestorePurchases value)? restorePurchases,
    TResult Function(PurchaseProduct value)? purchaseProduct,
    TResult Function(PaywallShown value)? paywallShown,
    TResult Function(PaywallClosed value)? paywallClosed,
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
    required TResult Function(ApphudPaywall paywall) paywallShown,
    required TResult Function(ApphudPaywall paywall) paywallClosed,
  }) {
    return purchaseProduct(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? purchase,
    TResult Function()? restorePurchases,
    TResult Function(ApphudPaywallProduct product)? purchaseProduct,
    TResult Function(ApphudPaywall paywall)? paywallShown,
    TResult Function(ApphudPaywall paywall)? paywallClosed,
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
    required TResult Function(PaywallShown value) paywallShown,
    required TResult Function(PaywallClosed value) paywallClosed,
  }) {
    return purchaseProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Purchase value)? purchase,
    TResult Function(RestorePurchases value)? restorePurchases,
    TResult Function(PurchaseProduct value)? purchaseProduct,
    TResult Function(PaywallShown value)? paywallShown,
    TResult Function(PaywallClosed value)? paywallClosed,
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

/// @nodoc
abstract class $PaywallShownCopyWith<$Res> {
  factory $PaywallShownCopyWith(
          PaywallShown value, $Res Function(PaywallShown) then) =
      _$PaywallShownCopyWithImpl<$Res>;
  $Res call({ApphudPaywall paywall});
}

/// @nodoc
class _$PaywallShownCopyWithImpl<$Res> extends _$PurchaseEventCopyWithImpl<$Res>
    implements $PaywallShownCopyWith<$Res> {
  _$PaywallShownCopyWithImpl(
      PaywallShown _value, $Res Function(PaywallShown) _then)
      : super(_value, (v) => _then(v as PaywallShown));

  @override
  PaywallShown get _value => super._value as PaywallShown;

  @override
  $Res call({
    Object? paywall = freezed,
  }) {
    return _then(PaywallShown(
      paywall == freezed
          ? _value.paywall
          : paywall // ignore: cast_nullable_to_non_nullable
              as ApphudPaywall,
    ));
  }
}

/// @nodoc

class _$PaywallShown extends PaywallShown {
  const _$PaywallShown(this.paywall) : super._();

  @override
  final ApphudPaywall paywall;

  @override
  String toString() {
    return 'PurchaseEvent.paywallShown(paywall: $paywall)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PaywallShown &&
            (identical(other.paywall, paywall) ||
                const DeepCollectionEquality().equals(other.paywall, paywall)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(paywall);

  @JsonKey(ignore: true)
  @override
  $PaywallShownCopyWith<PaywallShown> get copyWith =>
      _$PaywallShownCopyWithImpl<PaywallShown>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) purchase,
    required TResult Function() restorePurchases,
    required TResult Function(ApphudPaywallProduct product) purchaseProduct,
    required TResult Function(ApphudPaywall paywall) paywallShown,
    required TResult Function(ApphudPaywall paywall) paywallClosed,
  }) {
    return paywallShown(paywall);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? purchase,
    TResult Function()? restorePurchases,
    TResult Function(ApphudPaywallProduct product)? purchaseProduct,
    TResult Function(ApphudPaywall paywall)? paywallShown,
    TResult Function(ApphudPaywall paywall)? paywallClosed,
    required TResult orElse(),
  }) {
    if (paywallShown != null) {
      return paywallShown(paywall);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Purchase value) purchase,
    required TResult Function(RestorePurchases value) restorePurchases,
    required TResult Function(PurchaseProduct value) purchaseProduct,
    required TResult Function(PaywallShown value) paywallShown,
    required TResult Function(PaywallClosed value) paywallClosed,
  }) {
    return paywallShown(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Purchase value)? purchase,
    TResult Function(RestorePurchases value)? restorePurchases,
    TResult Function(PurchaseProduct value)? purchaseProduct,
    TResult Function(PaywallShown value)? paywallShown,
    TResult Function(PaywallClosed value)? paywallClosed,
    required TResult orElse(),
  }) {
    if (paywallShown != null) {
      return paywallShown(this);
    }
    return orElse();
  }
}

abstract class PaywallShown extends PurchaseEvent {
  const factory PaywallShown(ApphudPaywall paywall) = _$PaywallShown;
  const PaywallShown._() : super._();

  ApphudPaywall get paywall => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaywallShownCopyWith<PaywallShown> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaywallClosedCopyWith<$Res> {
  factory $PaywallClosedCopyWith(
          PaywallClosed value, $Res Function(PaywallClosed) then) =
      _$PaywallClosedCopyWithImpl<$Res>;
  $Res call({ApphudPaywall paywall});
}

/// @nodoc
class _$PaywallClosedCopyWithImpl<$Res>
    extends _$PurchaseEventCopyWithImpl<$Res>
    implements $PaywallClosedCopyWith<$Res> {
  _$PaywallClosedCopyWithImpl(
      PaywallClosed _value, $Res Function(PaywallClosed) _then)
      : super(_value, (v) => _then(v as PaywallClosed));

  @override
  PaywallClosed get _value => super._value as PaywallClosed;

  @override
  $Res call({
    Object? paywall = freezed,
  }) {
    return _then(PaywallClosed(
      paywall == freezed
          ? _value.paywall
          : paywall // ignore: cast_nullable_to_non_nullable
              as ApphudPaywall,
    ));
  }
}

/// @nodoc

class _$PaywallClosed extends PaywallClosed {
  const _$PaywallClosed(this.paywall) : super._();

  @override
  final ApphudPaywall paywall;

  @override
  String toString() {
    return 'PurchaseEvent.paywallClosed(paywall: $paywall)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PaywallClosed &&
            (identical(other.paywall, paywall) ||
                const DeepCollectionEquality().equals(other.paywall, paywall)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(paywall);

  @JsonKey(ignore: true)
  @override
  $PaywallClosedCopyWith<PaywallClosed> get copyWith =>
      _$PaywallClosedCopyWithImpl<PaywallClosed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) purchase,
    required TResult Function() restorePurchases,
    required TResult Function(ApphudPaywallProduct product) purchaseProduct,
    required TResult Function(ApphudPaywall paywall) paywallShown,
    required TResult Function(ApphudPaywall paywall) paywallClosed,
  }) {
    return paywallClosed(paywall);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? purchase,
    TResult Function()? restorePurchases,
    TResult Function(ApphudPaywallProduct product)? purchaseProduct,
    TResult Function(ApphudPaywall paywall)? paywallShown,
    TResult Function(ApphudPaywall paywall)? paywallClosed,
    required TResult orElse(),
  }) {
    if (paywallClosed != null) {
      return paywallClosed(paywall);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Purchase value) purchase,
    required TResult Function(RestorePurchases value) restorePurchases,
    required TResult Function(PurchaseProduct value) purchaseProduct,
    required TResult Function(PaywallShown value) paywallShown,
    required TResult Function(PaywallClosed value) paywallClosed,
  }) {
    return paywallClosed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Purchase value)? purchase,
    TResult Function(RestorePurchases value)? restorePurchases,
    TResult Function(PurchaseProduct value)? purchaseProduct,
    TResult Function(PaywallShown value)? paywallShown,
    TResult Function(PaywallClosed value)? paywallClosed,
    required TResult orElse(),
  }) {
    if (paywallClosed != null) {
      return paywallClosed(this);
    }
    return orElse();
  }
}

abstract class PaywallClosed extends PurchaseEvent {
  const factory PaywallClosed(ApphudPaywall paywall) = _$PaywallClosed;
  const PaywallClosed._() : super._();

  ApphudPaywall get paywall => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaywallClosedCopyWith<PaywallClosed> get copyWith =>
      throw _privateConstructorUsedError;
}
