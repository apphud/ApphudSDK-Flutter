// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PurchaseState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PurchaseState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PurchaseState()';
  }
}

/// @nodoc
class $PurchaseStateCopyWith<$Res> {
  $PurchaseStateCopyWith(PurchaseState _, $Res Function(PurchaseState) __);
}

/// Adds pattern-matching-related methods to [PurchaseState].
extension PurchaseStatePatterns on PurchaseState {
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
    TResult Function(PurchaseInitializationState value)? initialization,
    TResult Function(PurchaseSuccessState value)? success,
    TResult Function(PurchaseStartFailedState value)? startFailed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case PurchaseInitializationState() when initialization != null:
        return initialization(_that);
      case PurchaseSuccessState() when success != null:
        return success(_that);
      case PurchaseStartFailedState() when startFailed != null:
        return startFailed(_that);
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
    required TResult Function(PurchaseInitializationState value) initialization,
    required TResult Function(PurchaseSuccessState value) success,
    required TResult Function(PurchaseStartFailedState value) startFailed,
  }) {
    final _that = this;
    switch (_that) {
      case PurchaseInitializationState():
        return initialization(_that);
      case PurchaseSuccessState():
        return success(_that);
      case PurchaseStartFailedState():
        return startFailed(_that);
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
    TResult? Function(PurchaseInitializationState value)? initialization,
    TResult? Function(PurchaseSuccessState value)? success,
    TResult? Function(PurchaseStartFailedState value)? startFailed,
  }) {
    final _that = this;
    switch (_that) {
      case PurchaseInitializationState() when initialization != null:
        return initialization(_that);
      case PurchaseSuccessState() when success != null:
        return success(_that);
      case PurchaseStartFailedState() when startFailed != null:
        return startFailed(_that);
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
    TResult Function(
            bool isStartSuccess,
            bool isPaywallsFetched,
            bool isPlacementsFetched,
            ApphudPaywalls paywalls,
            List<ApphudPlacement> placements)?
        initialization,
    TResult Function(ApphudPaywalls paywalls, List<ApphudPlacement> placements,
            bool inProgress, PurchaseUserMessage userMessage)?
        success,
    TResult Function(String error)? startFailed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case PurchaseInitializationState() when initialization != null:
        return initialization(_that.isStartSuccess, _that.isPaywallsFetched,
            _that.isPlacementsFetched, _that.paywalls, _that.placements);
      case PurchaseSuccessState() when success != null:
        return success(_that.paywalls, _that.placements, _that.inProgress,
            _that.userMessage);
      case PurchaseStartFailedState() when startFailed != null:
        return startFailed(_that.error);
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
    required TResult Function(
            bool isStartSuccess,
            bool isPaywallsFetched,
            bool isPlacementsFetched,
            ApphudPaywalls paywalls,
            List<ApphudPlacement> placements)
        initialization,
    required TResult Function(
            ApphudPaywalls paywalls,
            List<ApphudPlacement> placements,
            bool inProgress,
            PurchaseUserMessage userMessage)
        success,
    required TResult Function(String error) startFailed,
  }) {
    final _that = this;
    switch (_that) {
      case PurchaseInitializationState():
        return initialization(_that.isStartSuccess, _that.isPaywallsFetched,
            _that.isPlacementsFetched, _that.paywalls, _that.placements);
      case PurchaseSuccessState():
        return success(_that.paywalls, _that.placements, _that.inProgress,
            _that.userMessage);
      case PurchaseStartFailedState():
        return startFailed(_that.error);
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
    TResult? Function(
            bool isStartSuccess,
            bool isPaywallsFetched,
            bool isPlacementsFetched,
            ApphudPaywalls paywalls,
            List<ApphudPlacement> placements)?
        initialization,
    TResult? Function(ApphudPaywalls paywalls, List<ApphudPlacement> placements,
            bool inProgress, PurchaseUserMessage userMessage)?
        success,
    TResult? Function(String error)? startFailed,
  }) {
    final _that = this;
    switch (_that) {
      case PurchaseInitializationState() when initialization != null:
        return initialization(_that.isStartSuccess, _that.isPaywallsFetched,
            _that.isPlacementsFetched, _that.paywalls, _that.placements);
      case PurchaseSuccessState() when success != null:
        return success(_that.paywalls, _that.placements, _that.inProgress,
            _that.userMessage);
      case PurchaseStartFailedState() when startFailed != null:
        return startFailed(_that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc

class PurchaseInitializationState extends PurchaseState {
  const PurchaseInitializationState(
      {this.isStartSuccess = false,
      this.isPaywallsFetched = false,
      this.isPlacementsFetched = false,
      this.paywalls = const ApphudPaywalls(),
      final List<ApphudPlacement> placements = const []})
      : _placements = placements,
        super._();

  @JsonKey()
  final bool isStartSuccess;
  @JsonKey()
  final bool isPaywallsFetched;
  @JsonKey()
  final bool isPlacementsFetched;
  @JsonKey()
  final ApphudPaywalls paywalls;
  final List<ApphudPlacement> _placements;
  @JsonKey()
  List<ApphudPlacement> get placements {
    if (_placements is EqualUnmodifiableListView) return _placements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_placements);
  }

  /// Create a copy of PurchaseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PurchaseInitializationStateCopyWith<PurchaseInitializationState>
      get copyWith => _$PurchaseInitializationStateCopyWithImpl<
          PurchaseInitializationState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PurchaseInitializationState &&
            (identical(other.isStartSuccess, isStartSuccess) ||
                other.isStartSuccess == isStartSuccess) &&
            (identical(other.isPaywallsFetched, isPaywallsFetched) ||
                other.isPaywallsFetched == isPaywallsFetched) &&
            (identical(other.isPlacementsFetched, isPlacementsFetched) ||
                other.isPlacementsFetched == isPlacementsFetched) &&
            (identical(other.paywalls, paywalls) ||
                other.paywalls == paywalls) &&
            const DeepCollectionEquality()
                .equals(other._placements, _placements));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isStartSuccess,
      isPaywallsFetched,
      isPlacementsFetched,
      paywalls,
      const DeepCollectionEquality().hash(_placements));

  @override
  String toString() {
    return 'PurchaseState.initialization(isStartSuccess: $isStartSuccess, isPaywallsFetched: $isPaywallsFetched, isPlacementsFetched: $isPlacementsFetched, paywalls: $paywalls, placements: $placements)';
  }
}

/// @nodoc
abstract mixin class $PurchaseInitializationStateCopyWith<$Res>
    implements $PurchaseStateCopyWith<$Res> {
  factory $PurchaseInitializationStateCopyWith(
          PurchaseInitializationState value,
          $Res Function(PurchaseInitializationState) _then) =
      _$PurchaseInitializationStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isStartSuccess,
      bool isPaywallsFetched,
      bool isPlacementsFetched,
      ApphudPaywalls paywalls,
      List<ApphudPlacement> placements});
}

/// @nodoc
class _$PurchaseInitializationStateCopyWithImpl<$Res>
    implements $PurchaseInitializationStateCopyWith<$Res> {
  _$PurchaseInitializationStateCopyWithImpl(this._self, this._then);

  final PurchaseInitializationState _self;
  final $Res Function(PurchaseInitializationState) _then;

  /// Create a copy of PurchaseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isStartSuccess = null,
    Object? isPaywallsFetched = null,
    Object? isPlacementsFetched = null,
    Object? paywalls = null,
    Object? placements = null,
  }) {
    return _then(PurchaseInitializationState(
      isStartSuccess: null == isStartSuccess
          ? _self.isStartSuccess
          : isStartSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaywallsFetched: null == isPaywallsFetched
          ? _self.isPaywallsFetched
          : isPaywallsFetched // ignore: cast_nullable_to_non_nullable
              as bool,
      isPlacementsFetched: null == isPlacementsFetched
          ? _self.isPlacementsFetched
          : isPlacementsFetched // ignore: cast_nullable_to_non_nullable
              as bool,
      paywalls: null == paywalls
          ? _self.paywalls
          : paywalls // ignore: cast_nullable_to_non_nullable
              as ApphudPaywalls,
      placements: null == placements
          ? _self._placements
          : placements // ignore: cast_nullable_to_non_nullable
              as List<ApphudPlacement>,
    ));
  }
}

/// @nodoc

class PurchaseSuccessState extends PurchaseState {
  const PurchaseSuccessState(
      {this.paywalls = const ApphudPaywalls(),
      final List<ApphudPlacement> placements = const [],
      this.inProgress = false,
      this.userMessage = const PurchaseUserMessage.none()})
      : _placements = placements,
        super._();

  @JsonKey()
  final ApphudPaywalls paywalls;
  final List<ApphudPlacement> _placements;
  @JsonKey()
  List<ApphudPlacement> get placements {
    if (_placements is EqualUnmodifiableListView) return _placements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_placements);
  }

  @JsonKey()
  final bool inProgress;
  @JsonKey()
  final PurchaseUserMessage userMessage;

  /// Create a copy of PurchaseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PurchaseSuccessStateCopyWith<PurchaseSuccessState> get copyWith =>
      _$PurchaseSuccessStateCopyWithImpl<PurchaseSuccessState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PurchaseSuccessState &&
            (identical(other.paywalls, paywalls) ||
                other.paywalls == paywalls) &&
            const DeepCollectionEquality()
                .equals(other._placements, _placements) &&
            (identical(other.inProgress, inProgress) ||
                other.inProgress == inProgress) &&
            (identical(other.userMessage, userMessage) ||
                other.userMessage == userMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      paywalls,
      const DeepCollectionEquality().hash(_placements),
      inProgress,
      userMessage);

  @override
  String toString() {
    return 'PurchaseState.success(paywalls: $paywalls, placements: $placements, inProgress: $inProgress, userMessage: $userMessage)';
  }
}

/// @nodoc
abstract mixin class $PurchaseSuccessStateCopyWith<$Res>
    implements $PurchaseStateCopyWith<$Res> {
  factory $PurchaseSuccessStateCopyWith(PurchaseSuccessState value,
          $Res Function(PurchaseSuccessState) _then) =
      _$PurchaseSuccessStateCopyWithImpl;
  @useResult
  $Res call(
      {ApphudPaywalls paywalls,
      List<ApphudPlacement> placements,
      bool inProgress,
      PurchaseUserMessage userMessage});

  $PurchaseUserMessageCopyWith<$Res> get userMessage;
}

/// @nodoc
class _$PurchaseSuccessStateCopyWithImpl<$Res>
    implements $PurchaseSuccessStateCopyWith<$Res> {
  _$PurchaseSuccessStateCopyWithImpl(this._self, this._then);

  final PurchaseSuccessState _self;
  final $Res Function(PurchaseSuccessState) _then;

  /// Create a copy of PurchaseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? paywalls = null,
    Object? placements = null,
    Object? inProgress = null,
    Object? userMessage = null,
  }) {
    return _then(PurchaseSuccessState(
      paywalls: null == paywalls
          ? _self.paywalls
          : paywalls // ignore: cast_nullable_to_non_nullable
              as ApphudPaywalls,
      placements: null == placements
          ? _self._placements
          : placements // ignore: cast_nullable_to_non_nullable
              as List<ApphudPlacement>,
      inProgress: null == inProgress
          ? _self.inProgress
          : inProgress // ignore: cast_nullable_to_non_nullable
              as bool,
      userMessage: null == userMessage
          ? _self.userMessage
          : userMessage // ignore: cast_nullable_to_non_nullable
              as PurchaseUserMessage,
    ));
  }

  /// Create a copy of PurchaseState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PurchaseUserMessageCopyWith<$Res> get userMessage {
    return $PurchaseUserMessageCopyWith<$Res>(_self.userMessage, (value) {
      return _then(_self.copyWith(userMessage: value));
    });
  }
}

/// @nodoc

class PurchaseStartFailedState extends PurchaseState {
  const PurchaseStartFailedState(this.error) : super._();

  final String error;

  /// Create a copy of PurchaseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PurchaseStartFailedStateCopyWith<PurchaseStartFailedState> get copyWith =>
      _$PurchaseStartFailedStateCopyWithImpl<PurchaseStartFailedState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PurchaseStartFailedState &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'PurchaseState.startFailed(error: $error)';
  }
}

/// @nodoc
abstract mixin class $PurchaseStartFailedStateCopyWith<$Res>
    implements $PurchaseStateCopyWith<$Res> {
  factory $PurchaseStartFailedStateCopyWith(PurchaseStartFailedState value,
          $Res Function(PurchaseStartFailedState) _then) =
      _$PurchaseStartFailedStateCopyWithImpl;
  @useResult
  $Res call({String error});
}

/// @nodoc
class _$PurchaseStartFailedStateCopyWithImpl<$Res>
    implements $PurchaseStartFailedStateCopyWith<$Res> {
  _$PurchaseStartFailedStateCopyWithImpl(this._self, this._then);

  final PurchaseStartFailedState _self;
  final $Res Function(PurchaseStartFailedState) _then;

  /// Create a copy of PurchaseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(PurchaseStartFailedState(
      null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
