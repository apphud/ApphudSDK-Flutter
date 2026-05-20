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

  /// Product configuration from Apphud Mission control (iOS).
  final Map<String, dynamic>? properties;

  /// For internal usage (iOS).
  final String? variationIdentifier;

  /// For internal usage (iOS).
  final String? experimentId;

  ApphudProduct({
    required this.productId,
    required this.store,
    this.name,
    this.productDetails,
    this.paywallIdentifier,
    this.skProduct,
    this.placementIdentifier,
    this.properties,
    this.variationIdentifier,
    this.experimentId,
  });

  /// Returns true if the product has a commitment plan option configured in Mission control.
  ///
  /// iOS only. On Android always returns `false`.
  bool isCommitmentPlanPreferred() {
    final offers = properties?['introductory_offer'];
    if (offers is Map) {
      return offers['commitment_offer_enabled'] == true;
    }
    return false;
  }

  factory ApphudProduct.fromJson(Map<dynamic, dynamic> map) =>
      _$ApphudProductFromJson(map);

  Map<String, dynamic> toJson() => _$ApphudProductToJson(this);

  @override
  String toString() {
    return 'ApphudProduct{productId: $productId, store: $store, name: $name, productDetails: $productDetails, skProduct: $skProduct, paywallIdentifier: $paywallIdentifier, placementIdentifier: $placementIdentifier, properties: $properties, variationIdentifier: $variationIdentifier, experimentId: $experimentId}';
  }
}
