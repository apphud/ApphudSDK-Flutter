import 'package:appHud_example/widgets/apphud_non_renewing_purchase_widget.dart';
import 'package:appHud_example/widgets/apphud_subscription_widget.dart';
import 'package:apphud/apphud.dart';
import 'package:apphud/models/apphud_models/apphud_composite_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../action_screen.dart';

class RestorePurchasesAction extends ActionFlow {
  @override
  Widget actionName() {
    return Text(
      "Method name: restorePurchases",
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }

  Widget actionParameters() {
    return Text("Parameters: Without parameters",
        style: TextStyle(fontSize: 20, color: Colors.green));
  }

  Widget actionResponse() {
    return FutureBuilder<ApphudComposite>(
      future: AppHud.restorePurchases(),
      builder: (
        BuildContext context,
        AsyncSnapshot<ApphudComposite> snapshot,
      ) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) return Text(snapshot.error.toString());

          if ((snapshot.data?.purchases.isEmpty ?? true) &&
              (snapshot.data?.subscriptions.isEmpty ?? true))
            return Center(child: Text('No restored purchases'));

          final List<Widget> purchaseWidgets = snapshot.data!.purchases
              .map((p) => ApphudNonRenewingPurchaseWidget(purchase: p))
              .toList();

          final List<Widget> subscriptionWidgets = snapshot.data!.subscriptions
              .map((s) => ApphudSubscriptionWidget(subscription: s))
              .toList();

          return Expanded(
            child: ListView(
              children: [
                ...purchaseWidgets,
                ...subscriptionWidgets,
              ],
            ),
          );
        }
        return Text('Waiting...');
      },
    );
  }
}
