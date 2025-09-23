// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PurchaseEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PurchaseEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PurchaseEvent()';
  }
}

/// @nodoc
class $PurchaseEventCopyWith<$Res> {
  $PurchaseEventCopyWith(PurchaseEvent _, $Res Function(PurchaseEvent) __);
}

/// Adds pattern-matching-related methods to [PurchaseEvent].
extension PurchaseEventPatterns on PurchaseEvent {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PurchaseStartedEvent value)? started,
    TResult Function(PurchasePaywallsFetchedEvent value)? paywallsFetched,
    TResult Function(PurchasePlacementsFetchedEvent value)? placementsFetched,
    TResult Function(PurchaseRestorePurchasesEvent value)? restorePurchases,
    TResult Function(PurchasePurchaseProductEvent value)? purchaseProduct,
    TResult Function(PurchaseGrantPromotionalEvent value)? grantPromotional,
    TResult Function(PurchaseTrackPurchaseEvent value)? trackPurchase,
    TResult Function(PurchasePaywallShownEvent value)? paywallShown,
    TResult Function(PurchasePaywallClosedEvent value)? paywallClosed,
    TResult Function(PurchaseSyncPurchaseEvent value)? syncPurchase,
    TResult Function(PurchaseCallAllEvent value)? callAll,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case PurchaseStartedEvent() when started != null:
        return started(_that);
      case PurchasePaywallsFetchedEvent() when paywallsFetched != null:
        return paywallsFetched(_that);
      case PurchasePlacementsFetchedEvent() when placementsFetched != null:
        return placementsFetched(_that);
      case PurchaseRestorePurchasesEvent() when restorePurchases != null:
        return restorePurchases(_that);
      case PurchasePurchaseProductEvent() when purchaseProduct != null:
        return purchaseProduct(_that);
      case PurchaseGrantPromotionalEvent() when grantPromotional != null:
        return grantPromotional(_that);
      case PurchaseTrackPurchaseEvent() when trackPurchase != null:
        return trackPurchase(_that);
      case PurchasePaywallShownEvent() when paywallShown != null:
        return paywallShown(_that);
      case PurchasePaywallClosedEvent() when paywallClosed != null:
        return paywallClosed(_that);
      case PurchaseSyncPurchaseEvent() when syncPurchase != null:
        return syncPurchase(_that);
      case PurchaseCallAllEvent() when callAll != null:
        return callAll(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PurchaseStartedEvent value) started,
    required TResult Function(PurchasePaywallsFetchedEvent value)
        paywallsFetched,
    required TResult Function(PurchasePlacementsFetchedEvent value)
        placementsFetched,
    required TResult Function(PurchaseRestorePurchasesEvent value)
        restorePurchases,
    required TResult Function(PurchasePurchaseProductEvent value)
        purchaseProduct,
    required TResult Function(PurchaseGrantPromotionalEvent value)
        grantPromotional,
    required TResult Function(PurchaseTrackPurchaseEvent value) trackPurchase,
    required TResult Function(PurchasePaywallShownEvent value) paywallShown,
    required TResult Function(PurchasePaywallClosedEvent value) paywallClosed,
    required TResult Function(PurchaseSyncPurchaseEvent value) syncPurchase,
    required TResult Function(PurchaseCallAllEvent value) callAll,
  }) {
    final _that = this;
    switch (_that) {
      case PurchaseStartedEvent():
        return started(_that);
      case PurchasePaywallsFetchedEvent():
        return paywallsFetched(_that);
      case PurchasePlacementsFetchedEvent():
        return placementsFetched(_that);
      case PurchaseRestorePurchasesEvent():
        return restorePurchases(_that);
      case PurchasePurchaseProductEvent():
        return purchaseProduct(_that);
      case PurchaseGrantPromotionalEvent():
        return grantPromotional(_that);
      case PurchaseTrackPurchaseEvent():
        return trackPurchase(_that);
      case PurchasePaywallShownEvent():
        return paywallShown(_that);
      case PurchasePaywallClosedEvent():
        return paywallClosed(_that);
      case PurchaseSyncPurchaseEvent():
        return syncPurchase(_that);
      case PurchaseCallAllEvent():
        return callAll(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PurchaseStartedEvent value)? started,
    TResult? Function(PurchasePaywallsFetchedEvent value)? paywallsFetched,
    TResult? Function(PurchasePlacementsFetchedEvent value)? placementsFetched,
    TResult? Function(PurchaseRestorePurchasesEvent value)? restorePurchases,
    TResult? Function(PurchasePurchaseProductEvent value)? purchaseProduct,
    TResult? Function(PurchaseGrantPromotionalEvent value)? grantPromotional,
    TResult? Function(PurchaseTrackPurchaseEvent value)? trackPurchase,
    TResult? Function(PurchasePaywallShownEvent value)? paywallShown,
    TResult? Function(PurchasePaywallClosedEvent value)? paywallClosed,
    TResult? Function(PurchaseSyncPurchaseEvent value)? syncPurchase,
    TResult? Function(PurchaseCallAllEvent value)? callAll,
  }) {
    final _that = this;
    switch (_that) {
      case PurchaseStartedEvent() when started != null:
        return started(_that);
      case PurchasePaywallsFetchedEvent() when paywallsFetched != null:
        return paywallsFetched(_that);
      case PurchasePlacementsFetchedEvent() when placementsFetched != null:
        return placementsFetched(_that);
      case PurchaseRestorePurchasesEvent() when restorePurchases != null:
        return restorePurchases(_that);
      case PurchasePurchaseProductEvent() when purchaseProduct != null:
        return purchaseProduct(_that);
      case PurchaseGrantPromotionalEvent() when grantPromotional != null:
        return grantPromotional(_that);
      case PurchaseTrackPurchaseEvent() when trackPurchase != null:
        return trackPurchase(_that);
      case PurchasePaywallShownEvent() when paywallShown != null:
        return paywallShown(_that);
      case PurchasePaywallClosedEvent() when paywallClosed != null:
        return paywallClosed(_that);
      case PurchaseSyncPurchaseEvent() when syncPurchase != null:
        return syncPurchase(_that);
      case PurchaseCallAllEvent() when callAll != null:
        return callAll(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(ApphudPaywalls paywalls)? paywallsFetched,
    TResult Function(List<ApphudPlacement> placements)? placementsFetched,
    TResult Function()? restorePurchases,
    TResult Function(ApphudProduct product)? purchaseProduct,
    TResult Function(ApphudProduct product)? grantPromotional,
    TResult Function(ApphudProduct product)? trackPurchase,
    TResult Function(ApphudPaywall paywall)? paywallShown,
    TResult Function(ApphudPaywall paywall)? paywallClosed,
    TResult Function()? syncPurchase,
    TResult Function()? callAll,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case PurchaseStartedEvent() when started != null:
        return started();
      case PurchasePaywallsFetchedEvent() when paywallsFetched != null:
        return paywallsFetched(_that.paywalls);
      case PurchasePlacementsFetchedEvent() when placementsFetched != null:
        return placementsFetched(_that.placements);
      case PurchaseRestorePurchasesEvent() when restorePurchases != null:
        return restorePurchases();
      case PurchasePurchaseProductEvent() when purchaseProduct != null:
        return purchaseProduct(_that.product);
      case PurchaseGrantPromotionalEvent() when grantPromotional != null:
        return grantPromotional(_that.product);
      case PurchaseTrackPurchaseEvent() when trackPurchase != null:
        return trackPurchase(_that.product);
      case PurchasePaywallShownEvent() when paywallShown != null:
        return paywallShown(_that.paywall);
      case PurchasePaywallClosedEvent() when paywallClosed != null:
        return paywallClosed(_that.paywall);
      case PurchaseSyncPurchaseEvent() when syncPurchase != null:
        return syncPurchase();
      case PurchaseCallAllEvent() when callAll != null:
        return callAll();
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(ApphudPaywalls paywalls) paywallsFetched,
    required TResult Function(List<ApphudPlacement> placements)
        placementsFetched,
    required TResult Function() restorePurchases,
    required TResult Function(ApphudProduct product) purchaseProduct,
    required TResult Function(ApphudProduct product) grantPromotional,
    required TResult Function(ApphudProduct product) trackPurchase,
    required TResult Function(ApphudPaywall paywall) paywallShown,
    required TResult Function(ApphudPaywall paywall) paywallClosed,
    required TResult Function() syncPurchase,
    required TResult Function() callAll,
  }) {
    final _that = this;
    switch (_that) {
      case PurchaseStartedEvent():
        return started();
      case PurchasePaywallsFetchedEvent():
        return paywallsFetched(_that.paywalls);
      case PurchasePlacementsFetchedEvent():
        return placementsFetched(_that.placements);
      case PurchaseRestorePurchasesEvent():
        return restorePurchases();
      case PurchasePurchaseProductEvent():
        return purchaseProduct(_that.product);
      case PurchaseGrantPromotionalEvent():
        return grantPromotional(_that.product);
      case PurchaseTrackPurchaseEvent():
        return trackPurchase(_that.product);
      case PurchasePaywallShownEvent():
        return paywallShown(_that.paywall);
      case PurchasePaywallClosedEvent():
        return paywallClosed(_that.paywall);
      case PurchaseSyncPurchaseEvent():
        return syncPurchase();
      case PurchaseCallAllEvent():
        return callAll();
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(ApphudPaywalls paywalls)? paywallsFetched,
    TResult? Function(List<ApphudPlacement> placements)? placementsFetched,
    TResult? Function()? restorePurchases,
    TResult? Function(ApphudProduct product)? purchaseProduct,
    TResult? Function(ApphudProduct product)? grantPromotional,
    TResult? Function(ApphudProduct product)? trackPurchase,
    TResult? Function(ApphudPaywall paywall)? paywallShown,
    TResult? Function(ApphudPaywall paywall)? paywallClosed,
    TResult? Function()? syncPurchase,
    TResult? Function()? callAll,
  }) {
    final _that = this;
    switch (_that) {
      case PurchaseStartedEvent() when started != null:
        return started();
      case PurchasePaywallsFetchedEvent() when paywallsFetched != null:
        return paywallsFetched(_that.paywalls);
      case PurchasePlacementsFetchedEvent() when placementsFetched != null:
        return placementsFetched(_that.placements);
      case PurchaseRestorePurchasesEvent() when restorePurchases != null:
        return restorePurchases();
      case PurchasePurchaseProductEvent() when purchaseProduct != null:
        return purchaseProduct(_that.product);
      case PurchaseGrantPromotionalEvent() when grantPromotional != null:
        return grantPromotional(_that.product);
      case PurchaseTrackPurchaseEvent() when trackPurchase != null:
        return trackPurchase(_that.product);
      case PurchasePaywallShownEvent() when paywallShown != null:
        return paywallShown(_that.paywall);
      case PurchasePaywallClosedEvent() when paywallClosed != null:
        return paywallClosed(_that.paywall);
      case PurchaseSyncPurchaseEvent() when syncPurchase != null:
        return syncPurchase();
      case PurchaseCallAllEvent() when callAll != null:
        return callAll();
      case _:
        return null;
    }
  }
}

/// @nodoc

class PurchaseStartedEvent extends PurchaseEvent {
  const PurchaseStartedEvent() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PurchaseStartedEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PurchaseEvent.started()';
  }
}

/// @nodoc

class PurchasePaywallsFetchedEvent extends PurchaseEvent {
  const PurchasePaywallsFetchedEvent(this.paywalls) : super._();

  final ApphudPaywalls paywalls;

  /// Create a copy of PurchaseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PurchasePaywallsFetchedEventCopyWith<PurchasePaywallsFetchedEvent>
      get copyWith => _$PurchasePaywallsFetchedEventCopyWithImpl<
          PurchasePaywallsFetchedEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PurchasePaywallsFetchedEvent &&
            (identical(other.paywalls, paywalls) ||
                other.paywalls == paywalls));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paywalls);

  @override
  String toString() {
    return 'PurchaseEvent.paywallsFetched(paywalls: $paywalls)';
  }
}

/// @nodoc
abstract mixin class $PurchasePaywallsFetchedEventCopyWith<$Res>
    implements $PurchaseEventCopyWith<$Res> {
  factory $PurchasePaywallsFetchedEventCopyWith(
          PurchasePaywallsFetchedEvent value,
          $Res Function(PurchasePaywallsFetchedEvent) _then) =
      _$PurchasePaywallsFetchedEventCopyWithImpl;
  @useResult
  $Res call({ApphudPaywalls paywalls});
}

/// @nodoc
class _$PurchasePaywallsFetchedEventCopyWithImpl<$Res>
    implements $PurchasePaywallsFetchedEventCopyWith<$Res> {
  _$PurchasePaywallsFetchedEventCopyWithImpl(this._self, this._then);

  final PurchasePaywallsFetchedEvent _self;
  final $Res Function(PurchasePaywallsFetchedEvent) _then;

  /// Create a copy of PurchaseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? paywalls = null,
  }) {
    return _then(PurchasePaywallsFetchedEvent(
      null == paywalls
          ? _self.paywalls
          : paywalls // ignore: cast_nullable_to_non_nullable
              as ApphudPaywalls,
    ));
  }
}

/// @nodoc

class PurchasePlacementsFetchedEvent extends PurchaseEvent {
  const PurchasePlacementsFetchedEvent(final List<ApphudPlacement> placements)
      : _placements = placements,
        super._();

  final List<ApphudPlacement> _placements;
  List<ApphudPlacement> get placements {
    if (_placements is EqualUnmodifiableListView) return _placements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_placements);
  }

  /// Create a copy of PurchaseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PurchasePlacementsFetchedEventCopyWith<PurchasePlacementsFetchedEvent>
      get copyWith => _$PurchasePlacementsFetchedEventCopyWithImpl<
          PurchasePlacementsFetchedEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PurchasePlacementsFetchedEvent &&
            const DeepCollectionEquality()
                .equals(other._placements, _placements));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_placements));

  @override
  String toString() {
    return 'PurchaseEvent.placementsFetched(placements: $placements)';
  }
}

/// @nodoc
abstract mixin class $PurchasePlacementsFetchedEventCopyWith<$Res>
    implements $PurchaseEventCopyWith<$Res> {
  factory $PurchasePlacementsFetchedEventCopyWith(
          PurchasePlacementsFetchedEvent value,
          $Res Function(PurchasePlacementsFetchedEvent) _then) =
      _$PurchasePlacementsFetchedEventCopyWithImpl;
  @useResult
  $Res call({List<ApphudPlacement> placements});
}

/// @nodoc
class _$PurchasePlacementsFetchedEventCopyWithImpl<$Res>
    implements $PurchasePlacementsFetchedEventCopyWith<$Res> {
  _$PurchasePlacementsFetchedEventCopyWithImpl(this._self, this._then);

  final PurchasePlacementsFetchedEvent _self;
  final $Res Function(PurchasePlacementsFetchedEvent) _then;

  /// Create a copy of PurchaseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? placements = null,
  }) {
    return _then(PurchasePlacementsFetchedEvent(
      null == placements
          ? _self._placements
          : placements // ignore: cast_nullable_to_non_nullable
              as List<ApphudPlacement>,
    ));
  }
}

/// @nodoc

class PurchaseRestorePurchasesEvent extends PurchaseEvent {
  const PurchaseRestorePurchasesEvent() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PurchaseRestorePurchasesEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PurchaseEvent.restorePurchases()';
  }
}

/// @nodoc

class PurchasePurchaseProductEvent extends PurchaseEvent {
  const PurchasePurchaseProductEvent(this.product) : super._();

  final ApphudProduct product;

  /// Create a copy of PurchaseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PurchasePurchaseProductEventCopyWith<PurchasePurchaseProductEvent>
      get copyWith => _$PurchasePurchaseProductEventCopyWithImpl<
          PurchasePurchaseProductEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PurchasePurchaseProductEvent &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @override
  String toString() {
    return 'PurchaseEvent.purchaseProduct(product: $product)';
  }
}

/// @nodoc
abstract mixin class $PurchasePurchaseProductEventCopyWith<$Res>
    implements $PurchaseEventCopyWith<$Res> {
  factory $PurchasePurchaseProductEventCopyWith(
          PurchasePurchaseProductEvent value,
          $Res Function(PurchasePurchaseProductEvent) _then) =
      _$PurchasePurchaseProductEventCopyWithImpl;
  @useResult
  $Res call({ApphudProduct product});
}

/// @nodoc
class _$PurchasePurchaseProductEventCopyWithImpl<$Res>
    implements $PurchasePurchaseProductEventCopyWith<$Res> {
  _$PurchasePurchaseProductEventCopyWithImpl(this._self, this._then);

  final PurchasePurchaseProductEvent _self;
  final $Res Function(PurchasePurchaseProductEvent) _then;

  /// Create a copy of PurchaseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? product = null,
  }) {
    return _then(PurchasePurchaseProductEvent(
      null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as ApphudProduct,
    ));
  }
}

/// @nodoc

class PurchaseGrantPromotionalEvent extends PurchaseEvent {
  const PurchaseGrantPromotionalEvent(this.product) : super._();

  final ApphudProduct product;

  /// Create a copy of PurchaseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PurchaseGrantPromotionalEventCopyWith<PurchaseGrantPromotionalEvent>
      get copyWith => _$PurchaseGrantPromotionalEventCopyWithImpl<
          PurchaseGrantPromotionalEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PurchaseGrantPromotionalEvent &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @override
  String toString() {
    return 'PurchaseEvent.grantPromotional(product: $product)';
  }
}

/// @nodoc
abstract mixin class $PurchaseGrantPromotionalEventCopyWith<$Res>
    implements $PurchaseEventCopyWith<$Res> {
  factory $PurchaseGrantPromotionalEventCopyWith(
          PurchaseGrantPromotionalEvent value,
          $Res Function(PurchaseGrantPromotionalEvent) _then) =
      _$PurchaseGrantPromotionalEventCopyWithImpl;
  @useResult
  $Res call({ApphudProduct product});
}

/// @nodoc
class _$PurchaseGrantPromotionalEventCopyWithImpl<$Res>
    implements $PurchaseGrantPromotionalEventCopyWith<$Res> {
  _$PurchaseGrantPromotionalEventCopyWithImpl(this._self, this._then);

  final PurchaseGrantPromotionalEvent _self;
  final $Res Function(PurchaseGrantPromotionalEvent) _then;

  /// Create a copy of PurchaseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? product = null,
  }) {
    return _then(PurchaseGrantPromotionalEvent(
      null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as ApphudProduct,
    ));
  }
}

/// @nodoc

class PurchaseTrackPurchaseEvent extends PurchaseEvent {
  const PurchaseTrackPurchaseEvent(this.product) : super._();

  final ApphudProduct product;

  /// Create a copy of PurchaseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PurchaseTrackPurchaseEventCopyWith<PurchaseTrackPurchaseEvent>
      get copyWith =>
          _$PurchaseTrackPurchaseEventCopyWithImpl<PurchaseTrackPurchaseEvent>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PurchaseTrackPurchaseEvent &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @override
  String toString() {
    return 'PurchaseEvent.trackPurchase(product: $product)';
  }
}

/// @nodoc
abstract mixin class $PurchaseTrackPurchaseEventCopyWith<$Res>
    implements $PurchaseEventCopyWith<$Res> {
  factory $PurchaseTrackPurchaseEventCopyWith(PurchaseTrackPurchaseEvent value,
          $Res Function(PurchaseTrackPurchaseEvent) _then) =
      _$PurchaseTrackPurchaseEventCopyWithImpl;
  @useResult
  $Res call({ApphudProduct product});
}

/// @nodoc
class _$PurchaseTrackPurchaseEventCopyWithImpl<$Res>
    implements $PurchaseTrackPurchaseEventCopyWith<$Res> {
  _$PurchaseTrackPurchaseEventCopyWithImpl(this._self, this._then);

  final PurchaseTrackPurchaseEvent _self;
  final $Res Function(PurchaseTrackPurchaseEvent) _then;

  /// Create a copy of PurchaseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? product = null,
  }) {
    return _then(PurchaseTrackPurchaseEvent(
      null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as ApphudProduct,
    ));
  }
}

/// @nodoc

class PurchasePaywallShownEvent extends PurchaseEvent {
  const PurchasePaywallShownEvent(this.paywall) : super._();

  final ApphudPaywall paywall;

  /// Create a copy of PurchaseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PurchasePaywallShownEventCopyWith<PurchasePaywallShownEvent> get copyWith =>
      _$PurchasePaywallShownEventCopyWithImpl<PurchasePaywallShownEvent>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PurchasePaywallShownEvent &&
            (identical(other.paywall, paywall) || other.paywall == paywall));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paywall);

  @override
  String toString() {
    return 'PurchaseEvent.paywallShown(paywall: $paywall)';
  }
}

/// @nodoc
abstract mixin class $PurchasePaywallShownEventCopyWith<$Res>
    implements $PurchaseEventCopyWith<$Res> {
  factory $PurchasePaywallShownEventCopyWith(PurchasePaywallShownEvent value,
          $Res Function(PurchasePaywallShownEvent) _then) =
      _$PurchasePaywallShownEventCopyWithImpl;
  @useResult
  $Res call({ApphudPaywall paywall});
}

/// @nodoc
class _$PurchasePaywallShownEventCopyWithImpl<$Res>
    implements $PurchasePaywallShownEventCopyWith<$Res> {
  _$PurchasePaywallShownEventCopyWithImpl(this._self, this._then);

  final PurchasePaywallShownEvent _self;
  final $Res Function(PurchasePaywallShownEvent) _then;

  /// Create a copy of PurchaseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? paywall = null,
  }) {
    return _then(PurchasePaywallShownEvent(
      null == paywall
          ? _self.paywall
          : paywall // ignore: cast_nullable_to_non_nullable
              as ApphudPaywall,
    ));
  }
}

/// @nodoc

class PurchasePaywallClosedEvent extends PurchaseEvent {
  const PurchasePaywallClosedEvent(this.paywall) : super._();

  final ApphudPaywall paywall;

  /// Create a copy of PurchaseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PurchasePaywallClosedEventCopyWith<PurchasePaywallClosedEvent>
      get copyWith =>
          _$PurchasePaywallClosedEventCopyWithImpl<PurchasePaywallClosedEvent>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PurchasePaywallClosedEvent &&
            (identical(other.paywall, paywall) || other.paywall == paywall));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paywall);

  @override
  String toString() {
    return 'PurchaseEvent.paywallClosed(paywall: $paywall)';
  }
}

/// @nodoc
abstract mixin class $PurchasePaywallClosedEventCopyWith<$Res>
    implements $PurchaseEventCopyWith<$Res> {
  factory $PurchasePaywallClosedEventCopyWith(PurchasePaywallClosedEvent value,
          $Res Function(PurchasePaywallClosedEvent) _then) =
      _$PurchasePaywallClosedEventCopyWithImpl;
  @useResult
  $Res call({ApphudPaywall paywall});
}

/// @nodoc
class _$PurchasePaywallClosedEventCopyWithImpl<$Res>
    implements $PurchasePaywallClosedEventCopyWith<$Res> {
  _$PurchasePaywallClosedEventCopyWithImpl(this._self, this._then);

  final PurchasePaywallClosedEvent _self;
  final $Res Function(PurchasePaywallClosedEvent) _then;

  /// Create a copy of PurchaseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? paywall = null,
  }) {
    return _then(PurchasePaywallClosedEvent(
      null == paywall
          ? _self.paywall
          : paywall // ignore: cast_nullable_to_non_nullable
              as ApphudPaywall,
    ));
  }
}

/// @nodoc

class PurchaseSyncPurchaseEvent extends PurchaseEvent {
  const PurchaseSyncPurchaseEvent() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PurchaseSyncPurchaseEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PurchaseEvent.syncPurchase()';
  }
}

/// @nodoc

class PurchaseCallAllEvent extends PurchaseEvent {
  const PurchaseCallAllEvent() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PurchaseCallAllEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PurchaseEvent.callAll()';
  }
}

// dart format on
