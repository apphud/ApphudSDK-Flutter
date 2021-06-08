// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apphud_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApphudProduct _$ApphudProductFromJson(Map json) {
  return ApphudProduct(
    productId: json['productId'] as String,
    store: json['store'] as String,
    id: json['id'] as String?,
    name: json['name'] as String?,
    skuDetails: json['skuDetails'] == null
        ? null
        : SkuDetailsWrapper.fromJson(json['skuDetails'] as Map),
    paywallId: json['paywallId'] as String?,
  );
}

Map<String, dynamic> _$ApphudProductToJson(ApphudProduct instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'store': instance.store,
      'id': instance.id,
      'name': instance.name,
      'skuDetails': instance.skuDetails,
      'paywallId': instance.paywallId,
    };
