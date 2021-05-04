import 'package:appHud_example/widgets/card_wrapper.dart';
import 'package:apphud/models/apphud_models/apphud_composite_model.dart';
import 'package:flutter/material.dart';

import 'apphud_non_renewing_purchase_widget.dart';
import 'apphud_subscription_widget.dart';

class ApphudCompositeWidget extends StatelessWidget {
  final Future<ApphudComposite> future;

  const ApphudCompositeWidget({Key? key, required this.future})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApphudComposite>(
      future: future,
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
                CardWrapper(
                  child: ListTile(
                    title: Text('Error'),
                    subtitle: Text(snapshot.data?.error ?? 'No error'),
                  ),
                ),
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
