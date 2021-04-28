import 'dart:io';

import 'package:apphud/models/apphud_models/composite/apphud_product.dart';
import 'package:flutter/material.dart';

import 'sk_product_widget.dart';
import 'sku_details_widget.dart';

class ApphudProductListWidget extends StatelessWidget {
  final Future<List<ApphudProduct>?> future;

  const ApphudProductListWidget({Key? key, required this.future})
      : super(key: key);

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
          return SKUDetailsWidget(
              skuDetails: compositeProduct.skuDetailsWrapper);
        }
        return Container();
      }).toList(),
    );
  }
}
