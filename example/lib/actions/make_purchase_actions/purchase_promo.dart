import 'package:appHud_example/widgets/apphud_purchase_result_widget.dart';
import 'package:apphud/apphud.dart';
import 'package:apphud/models/apphud_models/composite/apphud_purchase_result.dart';
import 'package:flutter/material.dart';
import '../action_screen.dart';

class PurchasePromoAction extends ActionFlow {
  String parameterName = "productIdentifier";
  String parameterValue = "com.apphud.weekly";
  String parameterValue2 = "promo_1_month_free";

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
    return FutureBuilder<ApphudPurchaseResult>(
      future: AppHud.purchasePromo(
        productId: parameterValue,
        discountID: parameterValue2,
      ),
      builder: (
        BuildContext context,
        AsyncSnapshot<ApphudPurchaseResult> snapshot,
      ) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) return Text(snapshot.error.toString());

          return Expanded(
            child: ApphudPurchaseResultWidget(result: snapshot.data),
          );
        }
        return Text("Waiting...");
      },
    );
  }
}
