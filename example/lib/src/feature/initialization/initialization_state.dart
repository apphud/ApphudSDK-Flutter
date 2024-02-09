import 'package:apphud/models/apphud_models/apphud_paywalls.dart';
import 'package:apphud/models/apphud_models/apphud_placement.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'initialization_state.freezed.dart';

@freezed
class InitializationState with _$InitializationState {
  const InitializationState._();

  const factory InitializationState.trying({
    @Default(false) bool isStartSuccess,
    @Default(false) bool isPaywallsFetched,
    @Default(false) bool isPlacementsFetched,
    @Default(ApphudPaywalls()) ApphudPaywalls paywalls,
    @Default([]) List<ApphudPlacement> placements,
  }) = Trying;

  const factory InitializationState.success({
    @Default(ApphudPaywalls()) ApphudPaywalls paywalls,
    @Default([]) List<ApphudPlacement> placements,
  }) = Success;

  const factory InitializationState.startFail(String error) = StartFail;
}
