import 'dart:io';

import 'package:apphud/models/sk_product/sk_product_wrapper.dart';
import 'package:apphud/models/sku_details/sku_details.dart';

import '../../mapper.dart';

class ApphudProduct {
  SKProductWrapper? skProductWrapper;
  SkuDetailsWrapper? skuDetailsWrapper;

  ApphudProduct.fromJson(Map<dynamic, dynamic> json) {
    if (Platform.isAndroid) {
      skuDetailsWrapper = SkuDetailsWrapper.fromJson(json);
    } else if (Platform.isIOS) {
      skProductWrapper = SKProductWrapper.fromJson(json);
    }
  }
}
