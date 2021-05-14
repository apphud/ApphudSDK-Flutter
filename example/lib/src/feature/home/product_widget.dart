import 'dart:io';

import 'package:apphud/models/apphud_models/composite/apphud_product.dart';
import 'package:apphud/models/sk_product/sk_product_wrapper.dart';
import 'package:apphud/models/sku_details/sku_details.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final ApphudProduct product;

  const ProductWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return _buildIOSProduct(context);
    } else if (Platform.isAndroid) {
      return _buildAndroidProduct(context);
    }
    return _buildError('No product for this platform');
  }

  Card _buildError(String text) {
    return Card(child: ListTile(title: Text(text)));
  }

  Widget _buildIOSProduct(BuildContext context) {
    if (product.skProductWrapper == null) {
      return _buildError('skProduct is null');
    }
    final SKProductWrapper skProduct = product.skProductWrapper!;
    return Card(
      child: ListTile(
        title: Text(
          '${skProduct.localizedTitle} '
          '(${skProduct.productIdentifier})',
        ),
        leading:
            Text('${skProduct.price} ${skProduct.priceLocale.currencyCode}'),
        subtitle: Text(skProduct.localizedDescription),
      ),
    );
  }

  Widget _buildAndroidProduct(BuildContext context) {
    if (product.skuDetailsWrapper == null) {
      return _buildError('skuDetails is null');
    }
    final SkuDetailsWrapper skuDetails = product.skuDetailsWrapper!;
    return Card(
      child: ListTile(
        title: Text('${skuDetails.title} (${skuDetails.sku})'),
        leading: Text(skuDetails.price),
        subtitle: Text(skuDetails.description),
      ),
    );
  }
}
