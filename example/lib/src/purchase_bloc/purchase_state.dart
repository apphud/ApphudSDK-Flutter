import 'package:apphud/models/apphud_models/apphud_paywalls.dart';
import 'package:apphud/models/apphud_models/apphud_placement.dart';
import 'package:apphud_example/src/purchase_bloc/purchase_user_message.dart';
import 'package:apphud_example/src/view/widgets/overlay_progress_indicator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_state.freezed.dart';

@freezed
class PurchaseState with _$PurchaseState implements InProgressState {
  const PurchaseState._();

  const factory PurchaseState.initialization({
    @Default(false) bool isStartSuccess,
    @Default(false) bool isPaywallsFetched,
    @Default(false) bool isPlacementsFetched,
    @Default(ApphudPaywalls()) ApphudPaywalls paywalls,
    @Default([]) List<ApphudPlacement> placements,
  }) = PurchaseInitializationState;

  const factory PurchaseState.success({
    @Default(ApphudPaywalls()) ApphudPaywalls paywalls,
    @Default([]) List<ApphudPlacement> placements,
    @Default(false) bool inProgress,
    @Default(PurchaseUserMessage.none()) PurchaseUserMessage userMessage,
  }) = PurchaseSuccessState;

  const factory PurchaseState.startFailed(String error) =
      PurchaseStartFailedState;

  @override
  bool get inProgress => maybeMap(
        orElse: () => false,
        success: (s) => s.inProgress,
      );
}
