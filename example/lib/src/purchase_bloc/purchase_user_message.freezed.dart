// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_user_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PurchaseUserMessage {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PurchaseUserMessage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PurchaseUserMessage()';
  }
}

/// @nodoc
class $PurchaseUserMessageCopyWith<$Res> {
  $PurchaseUserMessageCopyWith(
      PurchaseUserMessage _, $Res Function(PurchaseUserMessage) __);
}

/// Adds pattern-matching-related methods to [PurchaseUserMessage].
extension PurchaseUserMessagePatterns on PurchaseUserMessage {
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
    TResult Function(PurchaseNoneUserMessage value)? none,
    TResult Function(PurchasePurchaseSuccessUserMessage value)? purchaseSuccess,
    TResult Function(PurchasePurchaseFailureUserMessage value)? purchaseFailure,
    TResult Function(PurchaseRestorePurchasesSuccessUserMessage value)?
        restorePurchasesSuccess,
    TResult Function(PurchaseRestorePurchasesFailureUserMessage value)?
        restorePurchasesFailure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case PurchaseNoneUserMessage() when none != null:
        return none(_that);
      case PurchasePurchaseSuccessUserMessage() when purchaseSuccess != null:
        return purchaseSuccess(_that);
      case PurchasePurchaseFailureUserMessage() when purchaseFailure != null:
        return purchaseFailure(_that);
      case PurchaseRestorePurchasesSuccessUserMessage()
          when restorePurchasesSuccess != null:
        return restorePurchasesSuccess(_that);
      case PurchaseRestorePurchasesFailureUserMessage()
          when restorePurchasesFailure != null:
        return restorePurchasesFailure(_that);
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
    required TResult Function(PurchaseNoneUserMessage value) none,
    required TResult Function(PurchasePurchaseSuccessUserMessage value)
        purchaseSuccess,
    required TResult Function(PurchasePurchaseFailureUserMessage value)
        purchaseFailure,
    required TResult Function(PurchaseRestorePurchasesSuccessUserMessage value)
        restorePurchasesSuccess,
    required TResult Function(PurchaseRestorePurchasesFailureUserMessage value)
        restorePurchasesFailure,
  }) {
    final _that = this;
    switch (_that) {
      case PurchaseNoneUserMessage():
        return none(_that);
      case PurchasePurchaseSuccessUserMessage():
        return purchaseSuccess(_that);
      case PurchasePurchaseFailureUserMessage():
        return purchaseFailure(_that);
      case PurchaseRestorePurchasesSuccessUserMessage():
        return restorePurchasesSuccess(_that);
      case PurchaseRestorePurchasesFailureUserMessage():
        return restorePurchasesFailure(_that);
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
    TResult? Function(PurchaseNoneUserMessage value)? none,
    TResult? Function(PurchasePurchaseSuccessUserMessage value)?
        purchaseSuccess,
    TResult? Function(PurchasePurchaseFailureUserMessage value)?
        purchaseFailure,
    TResult? Function(PurchaseRestorePurchasesSuccessUserMessage value)?
        restorePurchasesSuccess,
    TResult? Function(PurchaseRestorePurchasesFailureUserMessage value)?
        restorePurchasesFailure,
  }) {
    final _that = this;
    switch (_that) {
      case PurchaseNoneUserMessage() when none != null:
        return none(_that);
      case PurchasePurchaseSuccessUserMessage() when purchaseSuccess != null:
        return purchaseSuccess(_that);
      case PurchasePurchaseFailureUserMessage() when purchaseFailure != null:
        return purchaseFailure(_that);
      case PurchaseRestorePurchasesSuccessUserMessage()
          when restorePurchasesSuccess != null:
        return restorePurchasesSuccess(_that);
      case PurchaseRestorePurchasesFailureUserMessage()
          when restorePurchasesFailure != null:
        return restorePurchasesFailure(_that);
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
    TResult Function()? none,
    TResult Function()? purchaseSuccess,
    TResult Function(ApphudError error)? purchaseFailure,
    TResult Function()? restorePurchasesSuccess,
    TResult Function(ApphudError error)? restorePurchasesFailure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case PurchaseNoneUserMessage() when none != null:
        return none();
      case PurchasePurchaseSuccessUserMessage() when purchaseSuccess != null:
        return purchaseSuccess();
      case PurchasePurchaseFailureUserMessage() when purchaseFailure != null:
        return purchaseFailure(_that.error);
      case PurchaseRestorePurchasesSuccessUserMessage()
          when restorePurchasesSuccess != null:
        return restorePurchasesSuccess();
      case PurchaseRestorePurchasesFailureUserMessage()
          when restorePurchasesFailure != null:
        return restorePurchasesFailure(_that.error);
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
    required TResult Function() none,
    required TResult Function() purchaseSuccess,
    required TResult Function(ApphudError error) purchaseFailure,
    required TResult Function() restorePurchasesSuccess,
    required TResult Function(ApphudError error) restorePurchasesFailure,
  }) {
    final _that = this;
    switch (_that) {
      case PurchaseNoneUserMessage():
        return none();
      case PurchasePurchaseSuccessUserMessage():
        return purchaseSuccess();
      case PurchasePurchaseFailureUserMessage():
        return purchaseFailure(_that.error);
      case PurchaseRestorePurchasesSuccessUserMessage():
        return restorePurchasesSuccess();
      case PurchaseRestorePurchasesFailureUserMessage():
        return restorePurchasesFailure(_that.error);
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
    TResult? Function()? none,
    TResult? Function()? purchaseSuccess,
    TResult? Function(ApphudError error)? purchaseFailure,
    TResult? Function()? restorePurchasesSuccess,
    TResult? Function(ApphudError error)? restorePurchasesFailure,
  }) {
    final _that = this;
    switch (_that) {
      case PurchaseNoneUserMessage() when none != null:
        return none();
      case PurchasePurchaseSuccessUserMessage() when purchaseSuccess != null:
        return purchaseSuccess();
      case PurchasePurchaseFailureUserMessage() when purchaseFailure != null:
        return purchaseFailure(_that.error);
      case PurchaseRestorePurchasesSuccessUserMessage()
          when restorePurchasesSuccess != null:
        return restorePurchasesSuccess();
      case PurchaseRestorePurchasesFailureUserMessage()
          when restorePurchasesFailure != null:
        return restorePurchasesFailure(_that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc

class PurchaseNoneUserMessage extends PurchaseUserMessage {
  const PurchaseNoneUserMessage() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PurchaseNoneUserMessage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PurchaseUserMessage.none()';
  }
}

/// @nodoc

class PurchasePurchaseSuccessUserMessage extends PurchaseUserMessage {
  const PurchasePurchaseSuccessUserMessage() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PurchasePurchaseSuccessUserMessage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PurchaseUserMessage.purchaseSuccess()';
  }
}

/// @nodoc

class PurchasePurchaseFailureUserMessage extends PurchaseUserMessage {
  const PurchasePurchaseFailureUserMessage(this.error) : super._();

  final ApphudError error;

  /// Create a copy of PurchaseUserMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PurchasePurchaseFailureUserMessageCopyWith<
          PurchasePurchaseFailureUserMessage>
      get copyWith => _$PurchasePurchaseFailureUserMessageCopyWithImpl<
          PurchasePurchaseFailureUserMessage>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PurchasePurchaseFailureUserMessage &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'PurchaseUserMessage.purchaseFailure(error: $error)';
  }
}

/// @nodoc
abstract mixin class $PurchasePurchaseFailureUserMessageCopyWith<$Res>
    implements $PurchaseUserMessageCopyWith<$Res> {
  factory $PurchasePurchaseFailureUserMessageCopyWith(
          PurchasePurchaseFailureUserMessage value,
          $Res Function(PurchasePurchaseFailureUserMessage) _then) =
      _$PurchasePurchaseFailureUserMessageCopyWithImpl;
  @useResult
  $Res call({ApphudError error});
}

/// @nodoc
class _$PurchasePurchaseFailureUserMessageCopyWithImpl<$Res>
    implements $PurchasePurchaseFailureUserMessageCopyWith<$Res> {
  _$PurchasePurchaseFailureUserMessageCopyWithImpl(this._self, this._then);

  final PurchasePurchaseFailureUserMessage _self;
  final $Res Function(PurchasePurchaseFailureUserMessage) _then;

  /// Create a copy of PurchaseUserMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(PurchasePurchaseFailureUserMessage(
      null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as ApphudError,
    ));
  }
}

/// @nodoc

class PurchaseRestorePurchasesSuccessUserMessage extends PurchaseUserMessage {
  const PurchaseRestorePurchasesSuccessUserMessage() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PurchaseRestorePurchasesSuccessUserMessage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PurchaseUserMessage.restorePurchasesSuccess()';
  }
}

/// @nodoc

class PurchaseRestorePurchasesFailureUserMessage extends PurchaseUserMessage {
  const PurchaseRestorePurchasesFailureUserMessage(this.error) : super._();

  final ApphudError error;

  /// Create a copy of PurchaseUserMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PurchaseRestorePurchasesFailureUserMessageCopyWith<
          PurchaseRestorePurchasesFailureUserMessage>
      get copyWith => _$PurchaseRestorePurchasesFailureUserMessageCopyWithImpl<
          PurchaseRestorePurchasesFailureUserMessage>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PurchaseRestorePurchasesFailureUserMessage &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'PurchaseUserMessage.restorePurchasesFailure(error: $error)';
  }
}

/// @nodoc
abstract mixin class $PurchaseRestorePurchasesFailureUserMessageCopyWith<$Res>
    implements $PurchaseUserMessageCopyWith<$Res> {
  factory $PurchaseRestorePurchasesFailureUserMessageCopyWith(
          PurchaseRestorePurchasesFailureUserMessage value,
          $Res Function(PurchaseRestorePurchasesFailureUserMessage) _then) =
      _$PurchaseRestorePurchasesFailureUserMessageCopyWithImpl;
  @useResult
  $Res call({ApphudError error});
}

/// @nodoc
class _$PurchaseRestorePurchasesFailureUserMessageCopyWithImpl<$Res>
    implements $PurchaseRestorePurchasesFailureUserMessageCopyWith<$Res> {
  _$PurchaseRestorePurchasesFailureUserMessageCopyWithImpl(
      this._self, this._then);

  final PurchaseRestorePurchasesFailureUserMessage _self;
  final $Res Function(PurchaseRestorePurchasesFailureUserMessage) _then;

  /// Create a copy of PurchaseUserMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(PurchaseRestorePurchasesFailureUserMessage(
      null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as ApphudError,
    ));
  }
}

// dart format on
