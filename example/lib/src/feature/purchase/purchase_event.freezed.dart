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
}

/// @nodoc
const $PurchaseEvent = _$PurchaseEventTearOff();

/// @nodoc
mixin _$PurchaseEvent {
  String get id => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) purchase,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? purchase,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Purchase value) purchase,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Purchase value)? purchase,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PurchaseEventCopyWith<PurchaseEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseEventCopyWith<$Res> {
  factory $PurchaseEventCopyWith(
          PurchaseEvent value, $Res Function(PurchaseEvent) then) =
      _$PurchaseEventCopyWithImpl<$Res>;
  $Res call({String id});
}

/// @nodoc
class _$PurchaseEventCopyWithImpl<$Res>
    implements $PurchaseEventCopyWith<$Res> {
  _$PurchaseEventCopyWithImpl(this._value, this._then);

  final PurchaseEvent _value;
  // ignore: unused_field
  final $Res Function(PurchaseEvent) _then;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class $PurchaseCopyWith<$Res> implements $PurchaseEventCopyWith<$Res> {
  factory $PurchaseCopyWith(Purchase value, $Res Function(Purchase) then) =
      _$PurchaseCopyWithImpl<$Res>;
  @override
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
  }) {
    return purchase(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? purchase,
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
  }) {
    return purchase(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Purchase value)? purchase,
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

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $PurchaseCopyWith<Purchase> get copyWith =>
      throw _privateConstructorUsedError;
}
