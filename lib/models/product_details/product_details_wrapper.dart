import 'package:apphud/models/product_details/one_time_purchase_offer_details_wrapper.dart';
import 'package:apphud/models/product_details/subscription_offer_details.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_details_wrapper.g.dart';

@JsonSerializable(anyMap: true)
class ProductDetailsWrapper {
  final String description;
  final String name;
  final String productId;
  final String productType;
  final String title;
  final OneTimePurchaseOfferDetailsWrapper? oneTimePurchaseOfferDetails;
  final List<SubscriptionOfferDetailsWrapper>? subscriptionOfferDetails;

  ProductDetailsWrapper({
    required this.description,
    required this.name,
    required this.productId,
    required this.productType,
    required this.title,
    this.oneTimePurchaseOfferDetails,
    this.subscriptionOfferDetails,
  });

  Map<String, dynamic> toJson() => _$ProductDetailsWrapperToJson(this);

  factory ProductDetailsWrapper.fromJson(Map<dynamic, dynamic> json) =>
      _$ProductDetailsWrapperFromJson(json);

  @override
  String toString() {
    return 'ProductDetailsWrapper{description: $description, name: $name, productId: $productId, productType: $productType, title: $title, oneTimePurchaseOfferDetails: $oneTimePurchaseOfferDetails, subscriptionOfferDetails: $subscriptionOfferDetails}';
  }
}
