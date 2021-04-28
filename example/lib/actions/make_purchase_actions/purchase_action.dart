import 'dart:io';

import 'package:appHud_example/widgets/apphud_purchase_result_android_widget.dart';
import 'package:appHud_example/widgets/apphud_purchase_result_ios_widget.dart';
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
                child: ApphudPurchaseResultIosWidget(
                  resultIos: snapshot.data?.iosResult,
                ),
              );
            } else {
              return Expanded(
                child: ApphudPurchaseResultAndroidWidget(
                    resultAndroid: snapshot.data?.androidResult),
              );
            }
          } else {
            return Text("Waiting...");
          }
        });
  }
}
