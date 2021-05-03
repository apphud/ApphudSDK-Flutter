import 'dart:io';

import 'package:apphud/models/sk_product/sk_product_wrapper.dart';
import 'package:apphud/models/sku_details/sku_details.dart';

class ApphudProduct {
  final SKProductWrapper? skProductWrapper;
  final SkuDetailsWrapper? skuDetailsWrapper;

  ApphudProduct({
    this.skProductWrapper,
    this.skuDetailsWrapper,
  });

  factory ApphudProduct.fromJson(Map<dynamic, dynamic> json) {
    if (Platform.isAndroid) {
      final SkuDetailsWrapper skuDetailsWrapper =
          SkuDetailsWrapper.fromJson(json);
      return ApphudProduct(skuDetailsWrapper: skuDetailsWrapper);
    } else {
      final SKProductWrapper skProductWrapper = SKProductWrapper.fromJson(json);
      return ApphudProduct(skProductWrapper: skProductWrapper);
    }
  }
}
