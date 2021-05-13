import 'package:appHud_example/widgets/android_purchase_widget.dart';
import 'package:appHud_example/widgets/apphud_error_widget.dart';
import 'package:appHud_example/widgets/apphud_non_renewing_purchase_widget.dart';
import 'package:appHud_example/widgets/card_wrapper.dart';
import 'package:apphud/models/apphud_models/composite/apphud_purchase_result.dart';
import 'package:flutter/material.dart';

import 'apphud_subscription_widget.dart';
import 'sk_payment_transaction_widget.dart';
import 'text_card_widget.dart';

class ApphudPurchaseResultWidget extends StatelessWidget {
  final ApphudPurchaseResult? result;

  const ApphudPurchaseResultWidget({Key? key, this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (result == null) {
      return CardWrapper(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('ApphudPurchaseResult not present'),
          ),
        ),
      );
    }
    return _buildResult(result!);
  }

  _buildResult(ApphudPurchaseResult result) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ApphudSubscriptionWidget(subscription: result.subscription),
          ApphudNonRenewingPurchaseWidget(purchase: result.nonRenewingPurchase),
          AndroidPurchaseWidget(purchase: result.purchase),
          SKPaymentTransactionWidget(transaction: result.transaction),
          ApphudErrorWidget(error: result.error),
        ],
      ),
    );
  }
}
