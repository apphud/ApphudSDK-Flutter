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

// TODO: remove or make it private, paywallId should not be used by clients
  final String? paywallId;

  final String? paywallIdentifier;

  ApphudProduct({
    required this.productId,
    required this.store,
    this.name,
    this.productDetails,
    this.paywallId,
    this.paywallIdentifier,
    this.skProduct,
  });

  factory ApphudProduct.fromJson(Map<dynamic, dynamic> map) =>
      _$ApphudProductFromJson(map);

  Map<String, dynamic> toJson() => _$ApphudProductToJson(this);

  @override
  String toString() {
    return 'ApphudProduct{productId: $productId, store: $store, name: $name, productDetails: $productDetails, skProduct: $skProduct, paywallId: $paywallId, paywallIdentifier: $paywallIdentifier}';
  }
}
