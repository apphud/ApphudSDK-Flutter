import 'package:appHud_example/widgets/non_renewing_purchase_widget.dart';
import 'package:apphud/apphud.dart';
import 'package:apphud/models/apphud_models/apphud_non_renewing_purchase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../action_screen.dart';

class NonRenewingPurchasesAction extends ActionFlow {
  @override
  Widget actionName() {
    return Text(
      "Method name: nonRenewingPurchases",
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
    return FutureBuilder<List<ApphudNonRenewingPurchase>>(
      future: AppHud.nonRenewingPurchases(),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<ApphudNonRenewingPurchase>> snapshot,
      ) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) return Text(snapshot.error.toString());
          if (snapshot.data?.isEmpty ?? true)
            return Center(child: Text('No nonRenewingPurchases'));
          final List<ApphudNonRenewingPurchase> purchases = snapshot.data!;
          return Expanded(
            child: ListView(
              children: purchases
                  .map((p) => NonRenewingPurchaseWidget(purchase: p))
                  .toList(),
            ),
          );
        }
        return Text('Waiting...');
      },
    );
  }
}
