import 'package:appHud_example/widgets/apphud_purchase_result_ios_widget.dart';
import 'package:apphud/apphud.dart';
import 'package:apphud/models/apphud_models/ios/apphud_purchase_result_ios.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../action_screen.dart';

class PurchasePromoAction extends ActionFlow {
  String parameterName = "productIdentifier";
  String parameterValue = "productMonthly";
  String parameterValue2 = "promo_1_months_free";

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
        productId: parameterValue,
        discountID: parameterValue2,
      ),
      builder: (
        BuildContext context,
        AsyncSnapshot<ApphudPurchaseResultIos> snapshot,
      ) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) return Text(snapshot.error.toString());

          return Expanded(
            child: ApphudPurchaseResultIosWidget(resultIos: snapshot.data),
          );
        }
        return Text("Waiting...");
      },
    );
  }
}
