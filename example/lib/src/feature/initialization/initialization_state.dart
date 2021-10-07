import 'package:apphud/models/apphud_models/apphud_paywalls.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'initialization_state.freezed.dart';

@freezed
class InitializationState with _$InitializationState {
  const InitializationState._();

  const factory InitializationState.trying({
    @Default(false) bool isStartSuccess,
    @Default(false) bool isPaywallsFetched,
    @Default(ApphudPaywalls()) ApphudPaywalls paywalls,
  }) = Trying;

  const factory InitializationState.success({
    @Default(ApphudPaywalls()) ApphudPaywalls paywalls,
  }) = Success;

  const factory InitializationState.startFail(String error) = StartFail;

  const factory InitializationState.paywallsFetchFail(String error) =
      PaywallsFetchFail;
}
