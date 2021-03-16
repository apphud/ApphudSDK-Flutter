import 'package:apphud/apphud.dart';
import 'package:apphud/models/apphud_models/ios/apphud_purchase_result_ios.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../action_screen.dart';

class PurchasePromoAction extends ActionFlow {
  String parameterName = "productIdentifier";
  String parameterValue = "productMonthly";
  String parameterValue2 = "promo_2_months_15_rub";

  @override
  Widget actionName() {
    return Text(
      "Method name: purchase promo",
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }

  Widget actionParameters() {
    return Text("Parameters: $parameterName - $parameterValue",
        style: TextStyle(fontSize: 20, color: Colors.green));
  }

  Widget actionResponse() {
    return FutureBuilder<ApphudPurchaseResultIos>(
        future: AppHud.purchasePromo(
          parameterValue,
          parameterValue2,
        ),
        // a previously-obtained Future<String> or null
        builder: (BuildContext context,
            AsyncSnapshot<ApphudPurchaseResultIos> snapshot) {
          if (snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Response: ",
                    style: TextStyle(
                      fontSize: 20,
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "transaction.transactionIdentifier: ${snapshot.data.transaction?.transactionIdentifier ?? "null"}"),
                    Text(
                        "nonRenewingPurchase.productId: ${snapshot.data.nonRenewingPurchase?.productId ?? "null"}"),
                    Text(
                        "subscription.productId ${snapshot.data.subscription?.productId ?? "null"}"),
                  ],
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Text("Waiting...");
          }
        });
  }
}
