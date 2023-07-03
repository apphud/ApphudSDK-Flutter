import 'dart:io';

import 'package:apphud/models/product_details/product_details_wrapper.dart';
import 'package:apphud/models/sk_product/sk_product_wrapper.dart';

class ApphudProductComposite {
  final SKProductWrapper? skProductWrapper;
  final ProductDetailsWrapper? productDetailsWrapper;

  ApphudProductComposite({
    this.skProductWrapper,
    this.productDetailsWrapper,
  });

  factory ApphudProductComposite.fromJson(Map<dynamic, dynamic> json) {
    if (Platform.isAndroid) {
      final ProductDetailsWrapper productDetailsWrapper =
          ProductDetailsWrapper.fromJson(json);
      return ApphudProductComposite(
          productDetailsWrapper: productDetailsWrapper);
    } else {
      final SKProductWrapper skProductWrapper = SKProductWrapper.fromJson(json);
      return ApphudProductComposite(skProductWrapper: skProductWrapper);
    }
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'skProductWrapper': skProductWrapper?.toJson(),
      'productDetailsWrapper': productDetailsWrapper?.toJson(),
    };
  }
}
