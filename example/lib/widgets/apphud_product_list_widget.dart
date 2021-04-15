import 'dart:io';

import 'package:apphud/models/apphud_models/composite/apphud_product.dart';
import 'package:apphud/models/sku_details/sku_details.dart';
import 'package:flutter/material.dart';

import 'sk_product_widget.dart';

class ApphudProductListWidget extends StatelessWidget {
  final Future<List<ApphudProduct>?> future;

  const ApphudProductListWidget({Key? key, required this.future}) : super(key: key);

  Widget build(BuildContext context) {
    return FutureBuilder<List<ApphudProduct>?>(
      future: future,
      builder: (
        BuildContext context,
        AsyncSnapshot<List<ApphudProduct>?> snapshot,
      ) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Expanded(child: _buildProductList(snapshot));
          }
        }
        return Text('Waiting...');
      },
    );
  }

  Widget _buildProductList(AsyncSnapshot<List<ApphudProduct>?> snapshot) {
    if (snapshot.data == null)
      return Center(child: Text('Items are not fetched yet'));

    if (snapshot.data?.isEmpty ?? true) return Center(child: Text('No items'));

    final List<ApphudProduct> products = snapshot.data!;
    return ListView(
      children: products.map((ApphudProduct compositeProduct) {
        if (Platform.isIOS) {
          return SKProductWidget(skProduct: compositeProduct.skProductWrapper);
        } else if (Platform.isAndroid) {
          return _fromSKUProduct(compositeProduct.skuDetailsWrapper);
        }
        return Container();
      }).toList(),
    );
  }

  Widget _fromSKUProduct(SkuDetailsWrapper? skuProduct) {
    if (skuProduct == null) return Container();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: ListTile(
                title: Text("sku"),
                subtitle: Text(skuProduct.sku),
              ),
            ),
            ListTile(
              title: Text("title"),
              subtitle: Text(skuProduct.title),
            ),
            ListTile(
              title: Text("price"),
              subtitle: Text(skuProduct.price),
            ),
            ListTile(
              title: Text("originalPrice"),
              subtitle: Text(skuProduct.originalPrice),
            ),
            ListTile(
              title: Text("originalPriceAmountMicros"),
              subtitle: Text('${skuProduct.originalPriceAmountMicros}'),
            ),
            ListTile(
              title: Text("description"),
              subtitle: Text(skuProduct.description),
            ),
            ListTile(
              title: Text("freeTrialPeriod"),
              subtitle: Text(skuProduct.freeTrialPeriod),
            ),
            ListTile(
              title: Text("introductoryPrice"),
              subtitle: Text(skuProduct.introductoryPrice),
            ),
            ListTile(
                title: Text("introductoryPriceAmountMicros"),
                subtitle: Text('${skuProduct.introductoryPriceAmountMicros}')),
            ListTile(
              title: Text("introductoryPriceCycles"),
              subtitle: Text('${skuProduct.introductoryPriceCycles}'),
            ),
            ListTile(
              title: Text("introductoryPricePeriod"),
              subtitle: Text(skuProduct.introductoryPricePeriod),
            ),
            ListTile(
              title: Text("priceAmountMicros"),
              subtitle: Text('${skuProduct.priceAmountMicros}'),
            ),
            ListTile(
              title: Text("priceCurrencyCode"),
              subtitle: Text(skuProduct.priceCurrencyCode),
            ),
            ListTile(
              title: Text("subscriptionPeriod"),
              subtitle: Text(skuProduct.subscriptionPeriod),
            ),
            ListTile(
              title: Text("type"),
              subtitle: Text('${skuProduct.type}'),
            ),
          ],
        ),
      ),
    );
  }
}
