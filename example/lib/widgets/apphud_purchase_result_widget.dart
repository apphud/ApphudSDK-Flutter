import 'package:appHud_example/widgets/android_purchase_widget.dart';
import 'package:appHud_example/widgets/apphud_non_renewing_purchase_widget.dart';
import 'package:appHud_example/widgets/card_wrapper.dart';
import 'package:apphud/models/apphud_models/composite/apphud_purchase_result.dart';
import 'package:flutter/material.dart';

import 'apphud_subscription_widget.dart';

class ApphudPurchaseResultWidget extends StatelessWidget {
  final ApphudPurchaseResult? result;

  const ApphudPurchaseResultWidget({Key? key, this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget content = result == null
        ? Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('ApphudPurchaseResult not present'),
            ),
          )
        : _buildResult(result!);

    return CardWrapper(child: content);
  }

  _buildResult(ApphudPurchaseResult result) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ApphudSubscriptionWidget(subscription: result.subscription),
          ApphudNonRenewingPurchaseWidget(purchase: result.nonRenewingPurchase),
          AndroidPurchaseWidget(purchase: result.purchase),
          ListTile(
            title: Text("Transaction (iOS)"),
            subtitle: Text(result.transaction?.toString() ?? "null"),
          ),
        ],
      ),
    );
  }
}
