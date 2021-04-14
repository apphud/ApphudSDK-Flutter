import 'dart:io';

import 'package:apphud/apphud.dart';
import 'package:apphud/models/apphud_models/composite/apphud_product.dart';
import 'package:apphud/models/sk_product/sk_product_wrapper.dart';
import 'package:apphud/models/sku_details/sku_details.dart';
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
        builder: (BuildContext context, AsyncSnapshot<ApphudProduct?> snapshot) {
          if (snapshot.hasData) {
            if (Platform.isIOS) {
              return fromSKProduct(snapshot.data!.skProductWrapper!);
            } else {
              return fromSKUProduct(snapshot.data!.skuDetailsWrapper!);
            }
          } else if (snapshot.hasError) {
            return Text(snapshot.error as String);
          } else if (snapshot.connectionState == ConnectionState.done) {
            return Text("Done without data");
          } else {
            return Text("Waiting");
          }
        });
  }

  ListView fromSKProduct(SKProductWrapper productWrapper) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        ListTile(
          title: Text("productIdentifier"),
          subtitle: Text(productWrapper.productIdentifier ?? "null"),
          tileColor: Colors.green,
        ),
        ListTile(
          title: Text("localizedTitle"),
          subtitle: Text(productWrapper.localizedTitle ?? "null"),
        ),
        ListTile(
          title: Text("localizedDescription"),
          subtitle: Text(productWrapper.localizedDescription ?? "null"),
        ),
        ListTile(
          title: Text("priceLocale"),
          subtitle: Text(productWrapper.priceLocale?.toString() ?? "null"),
        ),
        ListTile(
          title: Text("subscriptionGroupIdentifier"),
          subtitle: Text(productWrapper.subscriptionGroupIdentifier ?? "null"),
        ),
        ListTile(
          title: Text("price"),
          subtitle: Text(productWrapper.price ?? "null"),
        ),
        ListTile(
          title: Text("subscriptionPeriod"),
          subtitle:
              Text(productWrapper.subscriptionPeriod.toString() ?? "null"),
        ),
        ListTile(
          title: Text("introductoryPrice"),
          subtitle: Text(productWrapper.introductoryPrice.toString() ?? "null"),
        ),
      ],
      shrinkWrap: true,
    );
  }

  ListView fromSKUProduct(SkuDetailsWrapper skuProduct) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        ListTile(
          title: Text("sku"),
          subtitle: Text(skuProduct.sku ?? "null"),
          tileColor: Colors.green,
        ),
        ListTile(
          title: Text("title"),
          subtitle: Text(skuProduct.title ?? "null"),
        ),
        ListTile(
          title: Text("price"),
          subtitle: Text(skuProduct.price ?? "null"),
        ),
        ListTile(
          title: Text("originalPrice"),
          subtitle: Text(skuProduct.originalPrice ?? "null"),
        ),
        ListTile(
          title: Text("originalPriceAmountMicros"),
          subtitle:
              Text(skuProduct.originalPriceAmountMicros.toString() ?? "null"),
        ),
        ListTile(
          title: Text("description"),
          subtitle: Text(skuProduct.description ?? "null"),
        ),
        ListTile(
          title: Text("freeTrialPeriod"),
          subtitle: Text(skuProduct.freeTrialPeriod ?? "null"),
        ),
        ListTile(
          title: Text("introductoryPrice"),
          subtitle: Text(skuProduct.introductoryPrice ?? "null"),
        ),
        ListTile(
          title: Text("introductoryPriceAmountMicros"),
          subtitle: Text(
              skuProduct.introductoryPriceAmountMicros.toString() ?? "null"),
        ),
        ListTile(
          title: Text("introductoryPriceCycles"),
          subtitle:
              Text(skuProduct.introductoryPriceCycles.toString() ?? "null"),
        ),
        ListTile(
          title: Text("introductoryPricePeriod"),
          subtitle: Text(skuProduct.introductoryPricePeriod ?? "null"),
        ),
        ListTile(
          title: Text("priceAmountMicros"),
          subtitle: Text(skuProduct.priceAmountMicros.toString() ?? "null"),
        ),
        ListTile(
          title: Text("priceCurrencyCode"),
          subtitle: Text(skuProduct.priceCurrencyCode ?? "null"),
        ),
        ListTile(
          title: Text("subscriptionPeriod"),
          subtitle: Text(skuProduct.subscriptionPeriod ?? "null"),
        ),
        ListTile(
          title: Text("type"),
          subtitle: Text(skuProduct.type.toString() ?? "null"),
        ),
      ],
      shrinkWrap: true,
    );
  }
}
