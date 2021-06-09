import 'package:apphud/models/sk_product/sk_product_wrapper.dart';
import 'package:apphud/models/sku_details/sku_details.dart';
import 'package:json_annotation/json_annotation.dart';

part 'apphud_paywall_product.g.dart';

@JsonSerializable(anyMap: true)
class ApphudPaywallProduct {
  final String productId;
  final String store;
  final String? name;
  final SkuDetailsWrapper? skuDetails;
  final SKProductWrapper? skProduct;
  final String? paywallId;

  ApphudPaywallProduct({
    required this.productId,
    required this.store,
    this.name,
    this.skuDetails,
    this.paywallId,
    this.skProduct,
  });

  factory ApphudPaywallProduct.fromJson(Map<dynamic, dynamic> map) =>
      _$ApphudPaywallProductFromJson(map);

  Map<String, dynamic> toJson() => _$ApphudPaywallProductToJson(this);
}
