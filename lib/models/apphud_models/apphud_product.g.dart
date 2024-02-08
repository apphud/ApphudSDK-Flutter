// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apphud_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApphudProduct _$ApphudProductFromJson(Map json) => ApphudProduct(
      productId: json['productId'] as String,
      store: json['store'] as String,
      name: json['name'] as String?,
      productDetails: json['productDetails'] == null
          ? null
          : ProductDetailsWrapper.fromJson(json['productDetails'] as Map),
      paywallIdentifier: json['paywallIdentifier'] as String?,
      skProduct: json['skProduct'] == null
          ? null
          : SKProductWrapper.fromJson(json['skProduct'] as Map),
      placementIdentifier: json['placementIdentifier'] as String?,
    );

Map<String, dynamic> _$ApphudProductToJson(ApphudProduct instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'store': instance.store,
      'name': instance.name,
      'productDetails': instance.productDetails,
      'skProduct': instance.skProduct,
      'paywallIdentifier': instance.paywallIdentifier,
      'placementIdentifier': instance.placementIdentifier,
    };
