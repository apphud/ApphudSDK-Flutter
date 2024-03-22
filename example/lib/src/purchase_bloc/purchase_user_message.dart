import 'package:apphud/models/apphud_models/apphud_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_user_message.freezed.dart';

@freezed
class PurchaseUserMessage with _$PurchaseUserMessage {
  const PurchaseUserMessage._();

  const factory PurchaseUserMessage.none() = PurchaseNoneUserMessage;

  const factory PurchaseUserMessage.purchaseSuccess() =
      PurchasePurchaseSuccessUserMessage;

  const factory PurchaseUserMessage.purchaseFailure(ApphudError error) =
      PurchasePurchaseFailureUserMessage;

  const factory PurchaseUserMessage.restorePurchasesSuccess() =
      PurchaseRestorePurchasesSuccessUserMessage;

  const factory PurchaseUserMessage.restorePurchasesFailure(ApphudError error) =
      PurchaseRestorePurchasesFailureUserMessage;
}
