import 'package:apphud/models/sku_details/sku_details.dart';
import 'package:json_annotation/json_annotation.dart';

part 'apphud_product.g.dart';

@JsonSerializable(anyMap: true)
class ApphudProduct {
  final String productId;
  final String store;
  final String? name;
  final SkuDetailsWrapper? skuDetails;
  final String? paywallId;

  ApphudProduct({
    required this.productId,
    required this.store,
    this.name,
    this.skuDetails,
    this.paywallId,
  });

  factory ApphudProduct.fromJson(Map<dynamic, dynamic> map) =>
      _$ApphudProductFromJson(map);

  Map<String, dynamic> toJson() => _$ApphudProductToJson(this);
}
