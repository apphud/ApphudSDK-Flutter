// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailsWrapper _$ProductDetailsWrapperFromJson(Map json) =>
    ProductDetailsWrapper(
      description: json['description'] as String,
      name: json['name'] as String,
      productId: json['productId'] as String,
      productType: json['productType'] as String,
      title: json['title'] as String,
      oneTimePurchaseOfferDetails: json['oneTimePurchaseOfferDetails'] == null
          ? null
          : OneTimePurchaseOfferDetailsWrapper.fromJson(
              json['oneTimePurchaseOfferDetails'] as Map),
      subscriptionOfferDetails:
          (json['subscriptionOfferDetails'] as List<dynamic>?)
              ?.map((e) => SubscriptionOfferDetailsWrapper.fromJson(e as Map))
              .toList(),
    );

Map<String, dynamic> _$ProductDetailsWrapperToJson(
        ProductDetailsWrapper instance) =>
    <String, dynamic>{
      'description': instance.description,
      'name': instance.name,
      'productId': instance.productId,
      'productType': instance.productType,
      'title': instance.title,
      'oneTimePurchaseOfferDetails': instance.oneTimePurchaseOfferDetails,
      'subscriptionOfferDetails': instance.subscriptionOfferDetails,
    };
