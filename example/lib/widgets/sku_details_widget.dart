import 'package:apphud/models/sk_product/sk_product_wrapper.dart';
import 'package:apphud/models/sku_details/sku_details.dart';
import 'package:flutter/material.dart';

import 'card_wrapper.dart';

class SKUDetailsWidget extends StatelessWidget {
  final SkuDetailsWrapper? skuDetails;

  const SKUDetailsWidget({Key? key, this.skuDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget content = skuDetails == null
        ? Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Not existing product'),
            ),
          )
        : _buildProduct(skuDetails!);

    return CardWrapper(child: content);
  }

  Widget _buildProduct(SkuDetailsWrapper skuDetailsLocal) {
    return Column(
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
            subtitle: Text(skuDetailsLocal.sku),
          ),
        ),
        ListTile(
          title: Text("title"),
          subtitle: Text(skuDetailsLocal.title),
        ),
        ListTile(
          title: Text("price"),
          subtitle: Text(skuDetailsLocal.price),
        ),
        ListTile(
          title: Text("originalPrice"),
          subtitle: Text(skuDetailsLocal.originalPrice),
        ),
        ListTile(
          title: Text("originalPriceAmountMicros"),
          subtitle: Text('${skuDetailsLocal.originalPriceAmountMicros}'),
        ),
        ListTile(
          title: Text("description"),
          subtitle: Text(skuDetailsLocal.description),
        ),
        ListTile(
          title: Text("freeTrialPeriod"),
          subtitle: Text(skuDetailsLocal.freeTrialPeriod),
        ),
        ListTile(
          title: Text("introductoryPrice"),
          subtitle: Text(skuDetailsLocal.introductoryPrice),
        ),
        ListTile(
          title: Text("introductoryPriceAmountMicros"),
          subtitle: Text('${skuDetailsLocal.introductoryPriceAmountMicros}'),
        ),
        ListTile(
          title: Text("introductoryPriceCycles"),
          subtitle: Text('${skuDetailsLocal.introductoryPriceCycles}'),
        ),
        ListTile(
          title: Text("introductoryPricePeriod"),
          subtitle: Text(skuDetailsLocal.introductoryPricePeriod),
        ),
        ListTile(
          title: Text("priceAmountMicros"),
          subtitle: Text('${skuDetailsLocal.priceAmountMicros}'),
        ),
        ListTile(
          title: Text("priceCurrencyCode"),
          subtitle: Text(skuDetailsLocal.priceCurrencyCode),
        ),
        ListTile(
          title: Text("subscriptionPeriod"),
          subtitle: Text(skuDetailsLocal.subscriptionPeriod),
        ),
        ListTile(
          title: Text("type"),
          subtitle: Text('${skuDetailsLocal.type}'),
        ),
      ],
    );
  }
}
