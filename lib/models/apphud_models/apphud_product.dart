import 'package:apphud/models/product_details/product_details_wrapper.dart';
import 'package:apphud/models/sk_product/sk_product_wrapper.dart';
import 'package:json_annotation/json_annotation.dart';

part 'apphud_product.g.dart';

@JsonSerializable(anyMap: true)
class ApphudProduct {
  final String productId;
  final String store;
  final String? name;
  final ProductDetailsWrapper? productDetails;
  final SKProductWrapper? skProduct;
  final String? paywallIdentifier;
  final String? placementIdentifier;

  ApphudProduct({
    required this.productId,
    required this.store,
    this.name,
    this.productDetails,
    this.paywallIdentifier,
    this.skProduct,
    this.placementIdentifier,
  });

  factory ApphudProduct.fromJson(Map<dynamic, dynamic> map) =>
      _$ApphudProductFromJson(map);

  Map<String, dynamic> toJson() => _$ApphudProductToJson(this);

  @override
  String toString() {
    return 'ApphudProduct{productId: $productId, store: $store, name: $name, productDetails: $productDetails, skProduct: $skProduct, paywallIdentifier: $paywallIdentifier, placementIdentifier: $placementIdentifier}';
  }
}
