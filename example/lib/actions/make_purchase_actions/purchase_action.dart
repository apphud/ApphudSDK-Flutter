import 'dart:io';

import 'package:apphud/apphud.dart';
import 'package:apphud/models/apphud_models/android/apphud_purchase_result_android.dart';
import 'package:apphud/models/apphud_models/composite/apphud_purchase.dart';
import 'package:apphud/models/apphud_models/ios/apphud_purchase_result_ios.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../action_screen.dart';

class PurchaseAction extends ActionFlow {
  String parameterName = "productIdentifier";
  String iOSValue = "productWeekly";
  String androidValue = "com.apphud.test.weekly1";

  @override
  Widget actionName() {
    return Text(
      "Method name: purchase",
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }

  Widget actionParameters() {
    return Text(
        "Parameters: $parameterName - ${Platform.isIOS ? iOSValue : androidValue}",
        style: TextStyle(fontSize: 20, color: Colors.green));
  }

  Widget actionResponse() {
    return FutureBuilder<ApphudPurchase>(
        future: AppHud.purchase(Platform.isIOS ? iOSValue : androidValue),
        builder:
            (BuildContext context, AsyncSnapshot<ApphudPurchase> snapshot) {
          if (snapshot.hasData) {
            if (Platform.isIOS) {
              return fromApphudPurchaseResultIos(snapshot.data.iosResult);
            } else {
              return Expanded(
                child: ListView(children: [
                  ...snapshot.data.androidResult
                      .map((result) => fromApphudPurchaseResultAndroid(result))
                      .toList()
                ]),
              );
            }
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Text("Waiting...");
          }
        });
  }

  Widget fromApphudPurchaseResultIos(ApphudPurchaseResultIos resultIos) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        ListTile(
          title: Text("subscription.productId"),
          subtitle: Text(resultIos.subscription?.productId ?? "null"),
          tileColor: Colors.green,
        ),
        ListTile(
          title: Text("transaction.transactionIdentifier"),
          subtitle: Text(resultIos.transaction?.transactionIdentifier ?? "null"),
        ),
        ListTile(
          title: Text("resultIos.nonRenewingPurchase.productId"),
          subtitle: Text(resultIos.nonRenewingPurchase?.productId ?? "null"),
        ),
      ],
      shrinkWrap: true,
    );
  }

  Widget fromApphudPurchaseResultAndroid(
      ApphudPurchaseResultAndroid resultAndroid) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        ListTile(
          title: Text("sku"),
          subtitle: Text(resultAndroid.sku ?? "null"),
          tileColor: Colors.green,
        ),
        ListTile(
          title: Text("packageName"),
          subtitle: Text(resultAndroid.packageName ?? "null"),
        ),
        ListTile(
          title: Text("purchaseToken"),
          subtitle: Text(resultAndroid.purchaseToken ?? "null"),
        ),
      ],
      shrinkWrap: true,
    );
  }
}
