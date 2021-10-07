import 'package:apphud/models/sk_product/sk_product_wrapper.dart';
import 'package:apphud/models/sku_details/sku_details.dart';
import 'package:json_annotation/json_annotation.dart';

part 'apphud_product.g.dart';

@JsonSerializable(anyMap: true)
class ApphudProduct {
  final String productId;
  final String store;
  final String? name;
  final SkuDetailsWrapper? skuDetails;
  final SKProductWrapper? skProduct;
  final String? paywallId;
  final String? paywallIdentifier;

  ApphudProduct({
    required this.productId,
    required this.store,
    this.name,
    this.skuDetails,
    this.paywallId,
    this.paywallIdentifier,
    this.skProduct,
  });

  factory ApphudProduct.fromJson(Map<dynamic, dynamic> map) =>
      _$ApphudProductFromJson(map);

  Map<String, dynamic> toJson() => _$ApphudProductToJson(this);

  @override
  String toString() {
    return 'ApphudProduct{productId: $productId, store: $store, name: $name, skuDetails: $skuDetails, skProduct: $skProduct, paywallId: $paywallId, paywallIdentifier: $paywallIdentifier}';
  }
}
