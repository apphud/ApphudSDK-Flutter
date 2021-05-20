import 'package:apphud/models/apphud_models/apphud_error.dart';
import 'package:apphud_example/src/feature/common/widgets/overlay_progress_indicator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_state.freezed.dart';

@freezed
class PurchaseState with _$PurchaseState implements InProgressState {
  const PurchaseState._();

  const factory PurchaseState.init() = Init;

  const factory PurchaseState.inProgress() = InProgress;

  const factory PurchaseState.purchaseSuccess() = PurchaseSuccess;

  const factory PurchaseState.purchaseFailure(ApphudError error) =
      PurchaseFailure;

  const factory PurchaseState.restorePurchasesSuccess() =
      RestorePurchasesSuccess;

  const factory PurchaseState.restorePurchaseFailure(ApphudError error) =
      RestorePurchasesFailure;

  @override
  bool get inProgress => maybeMap(
        orElse: () => false,
        inProgress: (_) => true,
      );
}
