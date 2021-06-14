import 'package:apphud/models/apphud_models/apphud_paywalls.dart';
import 'package:apphud/models/apphud_models/composite/apphud_product_composite.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'initialization_state.freezed.dart';

@freezed
class InitializationState with _$InitializationState {
  const InitializationState._();

  const factory InitializationState.trying({
    @Default(false) bool isStartSuccess,
    @Default(false) bool isProductFetched,
    @Default(false) bool isPaywallsFetched,
    @Default([]) List<ApphudProductComposite> products,
    @Default(ApphudPaywalls()) ApphudPaywalls paywalls,
  }) = Trying;

  const factory InitializationState.success({
    @Default([]) List<ApphudProductComposite> products,
    @Default(ApphudPaywalls()) ApphudPaywalls paywalls,
  }) = Success;

  const factory InitializationState.startFail(String error) = StartFail;

  const factory InitializationState.productsFetchFail(String error) =
      ProductsFetchFail;

  const factory InitializationState.paywallsFetchFail(String error) =
      PaywallsFetchFail;
}
