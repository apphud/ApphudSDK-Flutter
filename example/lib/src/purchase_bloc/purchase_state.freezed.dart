// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PurchaseInitializationState value) initialization,
    required TResult Function(PurchaseSuccessState value) success,
    required TResult Function(PurchaseStartFailedState value) startFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PurchaseInitializationState value)? initialization,
    TResult? Function(PurchaseSuccessState value)? success,
    TResult? Function(PurchaseStartFailedState value)? startFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PurchaseInitializationState value)? initialization,
    TResult Function(PurchaseSuccessState value)? success,
    TResult Function(PurchaseStartFailedState value)? startFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseStateCopyWith<$Res> {
  factory $PurchaseStateCopyWith(
          PurchaseState value, $Res Function(PurchaseState) then) =
      _$PurchaseStateCopyWithImpl<$Res, PurchaseState>;
}

/// @nodoc
class _$PurchaseStateCopyWithImpl<$Res, $Val extends PurchaseState>
    implements $PurchaseStateCopyWith<$Res> {
  _$PurchaseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PurchaseInitializationStateImplCopyWith<$Res> {
  factory _$$PurchaseInitializationStateImplCopyWith(
          _$PurchaseInitializationStateImpl value,
          $Res Function(_$PurchaseInitializationStateImpl) then) =
      __$$PurchaseInitializationStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {bool isStartSuccess,
      bool isPaywallsFetched,
      bool isPlacementsFetched,
      ApphudPaywalls paywalls,
      List<ApphudPlacement> placements});
}

/// @nodoc
class __$$PurchaseInitializationStateImplCopyWithImpl<$Res>
    extends _$PurchaseStateCopyWithImpl<$Res, _$PurchaseInitializationStateImpl>
    implements _$$PurchaseInitializationStateImplCopyWith<$Res> {
  __$$PurchaseInitializationStateImplCopyWithImpl(
      _$PurchaseInitializationStateImpl _value,
      $Res Function(_$PurchaseInitializationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isStartSuccess = null,
    Object? isPaywallsFetched = null,
    Object? isPlacementsFetched = null,
    Object? paywalls = null,
    Object? placements = null,
  }) {
    return _then(_$PurchaseInitializationStateImpl(
      isStartSuccess: null == isStartSuccess
          ? _value.isStartSuccess
          : isStartSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaywallsFetched: null == isPaywallsFetched
          ? _value.isPaywallsFetched
          : isPaywallsFetched // ignore: cast_nullable_to_non_nullable
              as bool,
      isPlacementsFetched: null == isPlacementsFetched
          ? _value.isPlacementsFetched
          : isPlacementsFetched // ignore: cast_nullable_to_non_nullable
              as bool,
      paywalls: null == paywalls
          ? _value.paywalls
          : paywalls // ignore: cast_nullable_to_non_nullable
              as ApphudPaywalls,
      placements: null == placements
          ? _value._placements
          : placements // ignore: cast_nullable_to_non_nullable
              as List<ApphudPlacement>,
    ));
  }
}

/// @nodoc

class _$PurchaseInitializationStateImpl extends PurchaseInitializationState {
  const _$PurchaseInitializationStateImpl(
      {this.isStartSuccess = false,
      this.isPaywallsFetched = false,
      this.isPlacementsFetched = false,
      this.paywalls = const ApphudPaywalls(),
      final List<ApphudPlacement> placements = const []})
      : _placements = placements,
        super._();

  @override
  @JsonKey()
  final bool isStartSuccess;
  @override
  @JsonKey()
  final bool isPaywallsFetched;
  @override
  @JsonKey()
  final bool isPlacementsFetched;
  @override
  @JsonKey()
  final ApphudPaywalls paywalls;
  final List<ApphudPlacement> _placements;
  @override
  @JsonKey()
  List<ApphudPlacement> get placements {
    if (_placements is EqualUnmodifiableListView) return _placements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_placements);
  }

  @override
  String toString() {
    return 'PurchaseState.initialization(isStartSuccess: $isStartSuccess, isPaywallsFetched: $isPaywallsFetched, isPlacementsFetched: $isPlacementsFetched, paywalls: $paywalls, placements: $placements)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseInitializationStateImpl &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseInitializationStateImplCopyWith<_$PurchaseInitializationStateImpl>
      get copyWith => __$$PurchaseInitializationStateImplCopyWithImpl<
          _$PurchaseInitializationStateImpl>(this, _$identity);

  @override
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
    return initialization(isStartSuccess, isPaywallsFetched,
        isPlacementsFetched, paywalls, placements);
  }

  @override
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
    return initialization?.call(isStartSuccess, isPaywallsFetched,
        isPlacementsFetched, paywalls, placements);
  }

  @override
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
    if (initialization != null) {
      return initialization(isStartSuccess, isPaywallsFetched,
          isPlacementsFetched, paywalls, placements);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PurchaseInitializationState value) initialization,
    required TResult Function(PurchaseSuccessState value) success,
    required TResult Function(PurchaseStartFailedState value) startFailed,
  }) {
    return initialization(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PurchaseInitializationState value)? initialization,
    TResult? Function(PurchaseSuccessState value)? success,
    TResult? Function(PurchaseStartFailedState value)? startFailed,
  }) {
    return initialization?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PurchaseInitializationState value)? initialization,
    TResult Function(PurchaseSuccessState value)? success,
    TResult Function(PurchaseStartFailedState value)? startFailed,
    required TResult orElse(),
  }) {
    if (initialization != null) {
      return initialization(this);
    }
    return orElse();
  }
}

abstract class PurchaseInitializationState extends PurchaseState {
  const factory PurchaseInitializationState(
          {final bool isStartSuccess,
          final bool isPaywallsFetched,
          final bool isPlacementsFetched,
          final ApphudPaywalls paywalls,
          final List<ApphudPlacement> placements}) =
      _$PurchaseInitializationStateImpl;
  const PurchaseInitializationState._() : super._();

  bool get isStartSuccess;
  bool get isPaywallsFetched;
  bool get isPlacementsFetched;
  ApphudPaywalls get paywalls;
  List<ApphudPlacement> get placements;
  @JsonKey(ignore: true)
  _$$PurchaseInitializationStateImplCopyWith<_$PurchaseInitializationStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PurchaseSuccessStateImplCopyWith<$Res> {
  factory _$$PurchaseSuccessStateImplCopyWith(_$PurchaseSuccessStateImpl value,
          $Res Function(_$PurchaseSuccessStateImpl) then) =
      __$$PurchaseSuccessStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {ApphudPaywalls paywalls,
      List<ApphudPlacement> placements,
      bool inProgress,
      PurchaseUserMessage userMessage});

  $PurchaseUserMessageCopyWith<$Res> get userMessage;
}

/// @nodoc
class __$$PurchaseSuccessStateImplCopyWithImpl<$Res>
    extends _$PurchaseStateCopyWithImpl<$Res, _$PurchaseSuccessStateImpl>
    implements _$$PurchaseSuccessStateImplCopyWith<$Res> {
  __$$PurchaseSuccessStateImplCopyWithImpl(_$PurchaseSuccessStateImpl _value,
      $Res Function(_$PurchaseSuccessStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paywalls = null,
    Object? placements = null,
    Object? inProgress = null,
    Object? userMessage = null,
  }) {
    return _then(_$PurchaseSuccessStateImpl(
      paywalls: null == paywalls
          ? _value.paywalls
          : paywalls // ignore: cast_nullable_to_non_nullable
              as ApphudPaywalls,
      placements: null == placements
          ? _value._placements
          : placements // ignore: cast_nullable_to_non_nullable
              as List<ApphudPlacement>,
      inProgress: null == inProgress
          ? _value.inProgress
          : inProgress // ignore: cast_nullable_to_non_nullable
              as bool,
      userMessage: null == userMessage
          ? _value.userMessage
          : userMessage // ignore: cast_nullable_to_non_nullable
              as PurchaseUserMessage,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PurchaseUserMessageCopyWith<$Res> get userMessage {
    return $PurchaseUserMessageCopyWith<$Res>(_value.userMessage, (value) {
      return _then(_value.copyWith(userMessage: value));
    });
  }
}

/// @nodoc

class _$PurchaseSuccessStateImpl extends PurchaseSuccessState {
  const _$PurchaseSuccessStateImpl(
      {this.paywalls = const ApphudPaywalls(),
      final List<ApphudPlacement> placements = const [],
      this.inProgress = false,
      this.userMessage = const PurchaseUserMessage.none()})
      : _placements = placements,
        super._();

  @override
  @JsonKey()
  final ApphudPaywalls paywalls;
  final List<ApphudPlacement> _placements;
  @override
  @JsonKey()
  List<ApphudPlacement> get placements {
    if (_placements is EqualUnmodifiableListView) return _placements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_placements);
  }

  @override
  @JsonKey()
  final bool inProgress;
  @override
  @JsonKey()
  final PurchaseUserMessage userMessage;

  @override
  String toString() {
    return 'PurchaseState.success(paywalls: $paywalls, placements: $placements, inProgress: $inProgress, userMessage: $userMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseSuccessStateImpl &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseSuccessStateImplCopyWith<_$PurchaseSuccessStateImpl>
      get copyWith =>
          __$$PurchaseSuccessStateImplCopyWithImpl<_$PurchaseSuccessStateImpl>(
              this, _$identity);

  @override
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
    return success(paywalls, placements, inProgress, userMessage);
  }

  @override
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
    return success?.call(paywalls, placements, inProgress, userMessage);
  }

  @override
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
    if (success != null) {
      return success(paywalls, placements, inProgress, userMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PurchaseInitializationState value) initialization,
    required TResult Function(PurchaseSuccessState value) success,
    required TResult Function(PurchaseStartFailedState value) startFailed,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PurchaseInitializationState value)? initialization,
    TResult? Function(PurchaseSuccessState value)? success,
    TResult? Function(PurchaseStartFailedState value)? startFailed,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PurchaseInitializationState value)? initialization,
    TResult Function(PurchaseSuccessState value)? success,
    TResult Function(PurchaseStartFailedState value)? startFailed,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class PurchaseSuccessState extends PurchaseState {
  const factory PurchaseSuccessState(
      {final ApphudPaywalls paywalls,
      final List<ApphudPlacement> placements,
      final bool inProgress,
      final PurchaseUserMessage userMessage}) = _$PurchaseSuccessStateImpl;
  const PurchaseSuccessState._() : super._();

  ApphudPaywalls get paywalls;
  List<ApphudPlacement> get placements;
  bool get inProgress;
  PurchaseUserMessage get userMessage;
  @JsonKey(ignore: true)
  _$$PurchaseSuccessStateImplCopyWith<_$PurchaseSuccessStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PurchaseStartFailedStateImplCopyWith<$Res> {
  factory _$$PurchaseStartFailedStateImplCopyWith(
          _$PurchaseStartFailedStateImpl value,
          $Res Function(_$PurchaseStartFailedStateImpl) then) =
      __$$PurchaseStartFailedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$PurchaseStartFailedStateImplCopyWithImpl<$Res>
    extends _$PurchaseStateCopyWithImpl<$Res, _$PurchaseStartFailedStateImpl>
    implements _$$PurchaseStartFailedStateImplCopyWith<$Res> {
  __$$PurchaseStartFailedStateImplCopyWithImpl(
      _$PurchaseStartFailedStateImpl _value,
      $Res Function(_$PurchaseStartFailedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$PurchaseStartFailedStateImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PurchaseStartFailedStateImpl extends PurchaseStartFailedState {
  const _$PurchaseStartFailedStateImpl(this.error) : super._();

  @override
  final String error;

  @override
  String toString() {
    return 'PurchaseState.startFailed(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseStartFailedStateImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseStartFailedStateImplCopyWith<_$PurchaseStartFailedStateImpl>
      get copyWith => __$$PurchaseStartFailedStateImplCopyWithImpl<
          _$PurchaseStartFailedStateImpl>(this, _$identity);

  @override
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
    return startFailed(error);
  }

  @override
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
    return startFailed?.call(error);
  }

  @override
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
    if (startFailed != null) {
      return startFailed(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PurchaseInitializationState value) initialization,
    required TResult Function(PurchaseSuccessState value) success,
    required TResult Function(PurchaseStartFailedState value) startFailed,
  }) {
    return startFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PurchaseInitializationState value)? initialization,
    TResult? Function(PurchaseSuccessState value)? success,
    TResult? Function(PurchaseStartFailedState value)? startFailed,
  }) {
    return startFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PurchaseInitializationState value)? initialization,
    TResult Function(PurchaseSuccessState value)? success,
    TResult Function(PurchaseStartFailedState value)? startFailed,
    required TResult orElse(),
  }) {
    if (startFailed != null) {
      return startFailed(this);
    }
    return orElse();
  }
}

abstract class PurchaseStartFailedState extends PurchaseState {
  const factory PurchaseStartFailedState(final String error) =
      _$PurchaseStartFailedStateImpl;
  const PurchaseStartFailedState._() : super._();

  String get error;
  @JsonKey(ignore: true)
  _$$PurchaseStartFailedStateImplCopyWith<_$PurchaseStartFailedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
