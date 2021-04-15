import 'dart:io';

import 'package:appHud_example/widgets/sk_product_widget.dart';
import 'package:appHud_example/widgets/sku_details_widget.dart';
import 'package:apphud/apphud.dart';
import 'package:apphud/models/apphud_models/composite/apphud_product.dart';
import 'package:flutter/material.dart';

import '../action_screen.dart';

class ProductAction extends ActionFlow {
  String parameterName = """
     productIdentifier: 
      """;
  String iOSValue = "productMonthly";
  String androidValue = "com.apphud.test.monthly1";

  @override
  Widget actionName() {
    return Text(
      "Method name: product",
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }

  Widget actionParameters() {
    return Text(
        "Parameters: ${parameterName} - ${Platform.isIOS ? iOSValue : androidValue}",
        style: TextStyle(fontSize: 20, color: Colors.green));
  }

  Widget actionResponse() {
    return FutureBuilder<ApphudProduct?>(
        future: AppHud.product(Platform.isIOS ? iOSValue : androidValue),
        builder: (
          BuildContext context,
          AsyncSnapshot<ApphudProduct?> snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) return Text(snapshot.error.toString());

            final Widget content = Platform.isIOS
                ? SKProductWidget(skProduct: snapshot.data?.skProductWrapper)
                : SKUDetailsWidget(
                    skuDetails: snapshot.data?.skuDetailsWrapper,
                  );
            return Expanded(child: SingleChildScrollView(child: content));
          }
          return Text('Waiting...');
        });
  }
}
