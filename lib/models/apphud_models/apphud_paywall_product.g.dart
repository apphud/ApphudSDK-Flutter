// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apphud_paywall_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApphudPaywallProduct _$ApphudPaywallProductFromJson(Map json) {
  return ApphudPaywallProduct(
    productId: json['productId'] as String,
    store: json['store'] as String,
    name: json['name'] as String?,
    skuDetails: json['skuDetails'] == null
        ? null
        : SkuDetailsWrapper.fromJson(json['skuDetails'] as Map),
    paywallId: json['paywallId'] as String?,
    skProduct: json['skProduct'] == null
        ? null
        : SKProductWrapper.fromJson(json['skProduct'] as Map),
  );
}

Map<String, dynamic> _$ApphudPaywallProductToJson(
        ApphudPaywallProduct instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'store': instance.store,
      'name': instance.name,
      'skuDetails': instance.skuDetails,
      'skProduct': instance.skProduct,
      'paywallId': instance.paywallId,
    };
