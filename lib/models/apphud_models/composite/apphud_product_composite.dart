import 'dart:io';

import 'package:apphud/models/sk_product/sk_product_wrapper.dart';
import 'package:apphud/models/sku_details/sku_details.dart';

class ApphudProductComposite {
  final SKProductWrapper? skProductWrapper;
  final SkuDetailsWrapper? skuDetailsWrapper;

  ApphudProductComposite({
    this.skProductWrapper,
    this.skuDetailsWrapper,
  });

  factory ApphudProductComposite.fromJson(Map<dynamic, dynamic> json) {
    if (Platform.isAndroid) {
      final SkuDetailsWrapper skuDetailsWrapper =
          SkuDetailsWrapper.fromJson(json);
      return ApphudProductComposite(skuDetailsWrapper: skuDetailsWrapper);
    } else {
      final SKProductWrapper skProductWrapper = SKProductWrapper.fromJson(json);
      return ApphudProductComposite(skProductWrapper: skProductWrapper);
    }
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'skProductWrapper': skProductWrapper?.toJson(),
      'skuDetailsWrapper': skuDetailsWrapper?.toJson(),
    };
  }
}
