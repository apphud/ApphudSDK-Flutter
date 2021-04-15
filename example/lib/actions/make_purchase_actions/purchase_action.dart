import 'dart:io';

import 'package:apphud/apphud.dart';
import 'package:apphud/models/apphud_models/android/apphud_purchase_result_android.dart';
import 'package:apphud/models/apphud_models/composite/apphud_purchase.dart';
import 'package:apphud/models/apphud_models/ios/apphud_purchase_result_ios.dart';
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
        builder: (
          BuildContext context,
          AsyncSnapshot<ApphudPurchase> snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) return Text(snapshot.error.toString());

            if (Platform.isIOS) {
              return Expanded(
                child: _buildApphudPurchaseResultIos(snapshot.data?.iosResult!),
              );
            } else {
              return Expanded(
                  child: _buildApphudPurchaseResultAndroid(
                      snapshot.data?.androidResult));
            }
          } else {
            return Text("Waiting...");
          }
        });
  }

  Widget _buildApphudPurchaseResultIos(ApphudPurchaseResultIos? resultIos) {
    final Widget content = resultIos == null
        ? Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Not existing product'),
            ),
          )
        : _buildResultIos(resultIos);

    return _wrapToCard(content);
  }

  _buildResultIos(ApphudPurchaseResultIos resultIos) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            title: Text("Subscription"),
            subtitle: Text(resultIos.subscription?.toString() ?? "null"),
            tileColor: Colors.green,
          ),
          ListTile(
            title: Text("Transaction"),
            subtitle: Text(resultIos.transaction?.toString() ?? "null"),
          ),
          ListTile(
            title: Text("NonRenewingPurchase"),
            subtitle: Text(resultIos.nonRenewingPurchase?.toString() ?? "null"),
          ),
        ],
      ),
    );
  }

  Widget _buildApphudPurchaseResultAndroid(
    List<ApphudPurchaseResultAndroid>? resultAndroid,
  ) {
    if (resultAndroid == null)
      return _wrapToCard(
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Not existing product'),
          ),
        ),
      );

    return _buildResultAndroidList(resultAndroid);
  }

  Widget _wrapToCard(Widget content) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: content,
      ),
    );
  }

  _buildResultAndroidList(
    List<ApphudPurchaseResultAndroid> resultAndroidList,
  ) {
    return ListView(
      children: resultAndroidList
          .map((result) => _wrapToCard(_buildResultAndroid(result)))
          .toList(),
    );
  }

  _buildResultAndroid(ApphudPurchaseResultAndroid resultAndroid) {
    return Column(
      children: [
        ListTile(
          title: Text("sku"),
          subtitle: Text(resultAndroid.sku),
          tileColor: Colors.green,
        ),
        ListTile(
          title: Text("packageName"),
          subtitle: Text(resultAndroid.packageName),
        ),
        ListTile(
          title: Text("orderId"),
          subtitle: Text(resultAndroid.orderId),
        ),
        ListTile(
          title: Text("purchaseToken"),
          subtitle: Text(resultAndroid.purchaseToken),
        ),
        ListTile(
          title: Text("signature"),
          subtitle: Text(resultAndroid.signature),
        ),
        ListTile(
          title: Text("originalJson"),
          subtitle: Text(resultAndroid.originalJson),
        ),
        ListTile(
          title: Text("purchaseState"),
          subtitle: Text('${resultAndroid.purchaseState}'),
        ),
        ListTile(
          title: Text("purchaseTime"),
          subtitle: Text('${resultAndroid.purchaseTime}'),
        ),
      ],
    );
  }
}
